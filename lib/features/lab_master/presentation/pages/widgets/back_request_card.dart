import 'package:dashboad/core/domain/services/locator.dart';
import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/assets_manager.dart';
import 'package:dashboad/core/widgets/toast_bar.dart';
import 'package:dashboad/features/lab_master/presentation/cubit/upload_file_cubit.dart';

import 'package:dashboad/features/lab_master/presentation/pages/widgets/flip_card_animation.dart';
import 'package:dashboad/features/lab_master/presentation/pages/widgets/uploading_progress.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

//todo remove the session deatils id from here
class BackRequestCard extends StatelessWidget {
  const BackRequestCard(
      {super.key, required this.controller, required this.sessionDetailsId});
  final FlipCardController controller;
  final int sessionDetailsId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UploadFileCubit(getIt()),
      child: Builder(builder: (context) {
        return BlocListener<UploadFileCubit, UploadFileState>(
          listener: (context, state) {
            if (state is UploadFileErrorState) {
              ToastBar.onNetworkFailure(context, networkException: state.error);
            } else if (state is UploadFileSuccessState) {
              ToastBar.onSuccess(context,
                  message: state.message, title: "Success");
            }
          },
          child: Container(
            width: 250,
            decoration: BoxDecoration(
              color: ColorsHelper.test.withOpacity(.5),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: ColorsHelper.test,
              ),
            ),
            padding: const EdgeInsets.all(10),
            child: BlocBuilder<UploadFileCubit, UploadFileState>(
              builder: (context, state) {
                if (state is UploadingFileState) {
                  return UploadingProgress(value: state.value);
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Select your file",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: ColorsHelper.darkGrey,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () async {
                              await controller.flipCard();
                            },
                            icon: const Icon(
                              Icons.flip_to_front_outlined,
                              color: Colors.black,
                              size: 18,
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            await BlocProvider.of<UploadFileCubit>(context)
                                .pickFile(sessionDetailsId, context);
                          },
                          child: DottedBorder(
                            padding: const EdgeInsets.all(10),
                            stackFit: StackFit.expand,
                            color: ColorsHelper.darkGrey,
                            child: SvgPicture.asset(
                              AssetsManager.uploadFileImage,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        );
      }),
    );
  }
}

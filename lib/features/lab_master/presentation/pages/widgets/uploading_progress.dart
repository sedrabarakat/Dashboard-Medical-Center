import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/assets_manager.dart';
import 'package:dashboad/features/lab_master/presentation/cubit/upload_file_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class UploadingProgress extends StatelessWidget {
  const UploadingProgress({super.key, required this.value});
  final double value;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadFileCubit, UploadFileState>(
      builder: (context, state) {
        if (state is UploadingFileState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Uploading",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: ColorsHelper.darkGrey,
                    ),
                  ),
                  AnimatedTextKit(
                    repeatForever: true,
                    pause: const Duration(milliseconds: 50),
                    animatedTexts: [
                      TypewriterAnimatedText(
                        '...',
                        speed: const Duration(milliseconds: 100),
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: ColorsHelper.darkGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    AssetsManager.file,
                    width: 35,
                    color: ColorsHelper.darkGrey,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: LinearProgressIndicator(
                      value: state.value,
                      color: ColorsHelper.blueLight,
                      backgroundColor: ColorsHelper.darkGrey,
                    ),
                  ),
                ],
              ),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

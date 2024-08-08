import 'package:dashboad/core/domain/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/colors_helper.dart';
import '../../../../core/utils/style_manager.dart';
import '../../../../core/widgets/elevated_button.dart';
import '../../../../core/widgets/table/shimmer_table_row.dart';
import '../../../../core/widgets/toast_bar.dart';
import '../../../patients/presentation/cubits/patient_cubit.dart';
import 'session_card.dart';

class SessionContainer extends StatelessWidget {
  final int id;
  const SessionContainer({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          PatientCubit(getIt())..getOpenSession(id: id),
      child: BlocBuilder<PatientCubit, PatientState>(
        builder: (context, state) {
          return Container(
            decoration: StyleManager.rounded40(color: Colors.white),
            padding: EdgeInsets.all(30.h),
            height: 920.h,
            width: 350.w,
            child: Column(
              //crossAxisAlignment: ,
              children: [
                Text(
                  'Open Sessions:',
                  style: StyleManager.font30Bold_Lobster,
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Builder(
                    builder: (builderContext) {
                      if (state is GetOpenSessionLoadingState) {
                        ListView.builder(
                          itemBuilder: (context, index) =>
                              const ShimmerTableRow(),
                          itemCount: 10,
                        );
                      } else if (state is GetOpenSessionErrorState) {
                        return Center(child: Text(state.error));
                      } else if (state is GetOpenSessionSuccessState) {
                        final sessions = state.sessions;
                        if (sessions.isEmpty) {
                          return const SizedBox();
                        }
                        return ListView.builder(
                          itemCount: sessions.length,
                          itemBuilder: (context, index) {
                            final session = sessions[index];
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SessionCard(
                                session: session,
                                onClose: () {
                                  debugPrint('click on close button');
                                  context
                                      .read<PatientCubit>()
                                      .closeSession(session.id, id);
                                },
                                onEdit: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(
                                          'Upload laboratory tests \nand radiographic images \n(As files) to this Session:\n ',
                                          style: StyleManager.font20W600,
                                        ),
                                        actions: [
                                          CustomElevatedButton(
                                            onPressed: () {
                                              builderContext
                                                  .read<PatientCubit>()
                                                  .uploadFile(session.id)
                                                  .then((_) {
                                                ToastBar.onSuccess(
                                                  context,
                                                  message:
                                                      'the file has been added successfully',
                                                  title: "Success",
                                                );
                                                builderContext
                                                    .read<PatientCubit>()
                                                    .getOpenSession(id: id);
                                              }).catchError((error) {
                                                ToastBar.onError(
                                                  context,
                                                  message: 'File upload failed',
                                                  title: "Error",
                                                );
                                              });
                                            },
                                            label: 'Add File',
                                            buttonColor: ColorsHelper.blue,
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Save'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            );
                          },
                        );
                      }
                      return ListView.builder(
                        itemBuilder: (context, index) =>
                            const ShimmerTableRow(),
                        itemCount: 10,
                      );
                    },
                  ),
                ),
                CustomElevatedButton(
                  onPressed: () {
                    context.read<PatientCubit>().addSession(context, id);
                  },
                  label: 'Add New Session',
                  buttonColor: ColorsHelper.blue,
                ),

                //const SizedBox(height: 10,),
              ],
            ),
          );
        },
      ),
    );
  }
}

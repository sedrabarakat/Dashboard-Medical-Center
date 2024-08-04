import 'package:dashboad/core/domain/services/locator.dart';
import 'package:dashboad/features/session/presentation/cubit/session_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/colors_helper.dart';
import '../../../../core/utils/style_manager.dart';
import '../../../../core/widgets/elevated_button.dart';
import '../../../../core/widgets/table/shimmer_table_row.dart';
import '../../../../core/widgets/toast_bar.dart';
import '../cubit/session_cubit.dart';
import 'session_card.dart';

class SessionContainer extends StatelessWidget {
  const SessionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SessionCubit(getIt())..getOpenSession(),
      child: BlocBuilder<SessionCubit, SessionState>(
        builder: (context, state) {
          return Container(
            padding:const EdgeInsets.all(10),
            height: 920,
            width: 350,
            child: Column(
              children: [
                Text(
                  'Open Sessions:',
                  style: StyleManager.font30Bold_Lobster,
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
                            return SessionCard(
                              session: session,
                              onClose: () {
                                debugPrint('click on close button');
                                context
                                    .read<SessionCubit>()
                                    .closeSession(session.id);
                              },
                              onEdit: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Upload laboratory tests \nand radiographic images \n(As files) to this Session:\n '),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomElevatedButton(
                                            onPressed: () {
                                              builderContext
                                                  .read<SessionCubit>()
                                                  .uploadFile(session.id)
                                                  .then((_) {
                                                ToastBar.onSuccess(
                                                  context,
                                                  message:
                                                      'the file has been added successfully',
                                                  title: "Success",
                                                );
                                                builderContext
                                                    .read<SessionCubit>()
                                                    .getOpenSession();
                                              }).catchError((error) {
                                                ToastBar.onError(
                                                  context,
                                                  message: 'File upload failed',
                                                  title: "Error",
                                                );
                                              });
                                            },
                                            label: 'Add File',
                                            buttonColor: ColorsHelper.teal,
                                          ),
                                        ],
                                      ),
                                      actions: [
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
                    context.read<SessionCubit>().addSession(context);
                  },
                  label: 'Add New Session',
                  buttonColor: ColorsHelper.teal,
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

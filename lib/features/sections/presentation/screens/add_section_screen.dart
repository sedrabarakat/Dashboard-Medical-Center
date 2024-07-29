import 'package:dashboad/core/domain/services/locator.dart';
import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/style_manager.dart';
import 'package:dashboad/core/utils/validator_manager.dart';
import 'package:dashboad/core/widgets/toast_bar.dart';
import 'package:dashboad/features/auth/presentation/widgets/auth_field.dart';
import 'package:dashboad/features/auth/presentation/widgets/custom_state_button.dart';
import 'package:dashboad/features/sections/presentation/cubits/section_cubit.dart';
import 'package:dashboad/features/sections/presentation/widgets/add_service_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_state_button/progress_button.dart';

// TODO Refactor the code
class AddSectionScreen extends StatelessWidget {
  const AddSectionScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
          value: getIt<SectionCubit>(),
          child: Builder(builder: (builderContext) {
            return BlocListener<SectionCubit, SectionState>(
              listener: (context, state) {
                if (state is CreateSectionSuccessState) {
                  ToastBar.onSuccess(context,
                      message: "Section created Successfully",
                      title: "Success");
                } else if (state is CreateSectionErrorState) {
                  ToastBar.onNetworkFailure(
                    context,
                    networkException: state.error,
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Text(
                        'Add Section',
                        style: StyleManager.font30Bold,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AuthTextField(
                              controller:
                                  BlocProvider.of<SectionCubit>(builderContext)
                                      .sectionName,
                              label: "Section Name",
                              validator: (value) =>
                                  ValidatorManager().validateName(value!),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Section Services",
                                  style: StyleManager.fontregular14.copyWith(
                                    color: Colors.black54,
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () async {
                                    showDialog(
                                      context: builderContext,
                                      builder: (context) => AlertDialog(
                                        title: Text(
                                          'Add Service',
                                          style: StyleManager.font30Bold,
                                        ),
                                        content: Form(
                                          key: BlocProvider.of<SectionCubit>(
                                                  builderContext)
                                              .addServiceKey,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              AuthTextField(
                                                controller: BlocProvider.of<
                                                            SectionCubit>(
                                                        builderContext)
                                                    .serviceName,
                                                label: "Service Name",
                                                validator: (value) =>
                                                    ValidatorManager()
                                                        .validateName(value!),
                                              ),
                                              AuthTextField(
                                                controller: BlocProvider.of<
                                                            SectionCubit>(
                                                        builderContext)
                                                    .servicePrice,
                                                label: "Price",
                                                validator: (value) =>
                                                    ValidatorManager()
                                                        .validateNumber(value!),
                                              )
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          CustomStateButton(
                                            onPressed: () {
                                              if (BlocProvider.of<SectionCubit>(
                                                      builderContext)
                                                  .addServiceKey
                                                  .currentState!
                                                  .validate()) {
                                                BlocProvider.of<SectionCubit>(
                                                        builderContext)
                                                    .addSectionService();
                                                Navigator.of(context).pop();
                                              }
                                            },
                                            currentState: ButtonState.idle,
                                            label: "Add",
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  style: IconButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    iconSize: 14,
                                    minimumSize: const Size(26, 26),
                                    maximumSize: const Size(26, 26),
                                    backgroundColor: ColorsHelper.teal,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: BlocBuilder<SectionCubit, SectionState>(
                                builder: (builderContext, state) =>
                                    AddServiceList(
                                  animationDuration:
                                      const Duration(milliseconds: 500),
                                  listKey: BlocProvider.of<SectionCubit>(
                                          builderContext)
                                      .listKey,
                                  items: BlocProvider.of<SectionCubit>(
                                          builderContext)
                                      .sectionServices,
                                  onRemovePressed:
                                      BlocProvider.of<SectionCubit>(
                                              builderContext)
                                          .removeSectionService,
                                ),
                              ),
                            ),
                            BlocBuilder<SectionCubit, SectionState>(
                              builder: (builderContext, state) {
                                return CustomStateButton(
                                  onPressed: () async {
                                    await BlocProvider.of<SectionCubit>(
                                            builderContext)
                                        .createSection();
                                  },
                                  currentState: BlocProvider.of<SectionCubit>(
                                          builderContext)
                                      .createSectionButtonState,
                                  label: "Create",
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          })),
    );
  }
}

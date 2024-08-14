import 'package:dashboad/core/domain/services/locator.dart';
import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/values_manager.dart';
import 'package:dashboad/core/widgets/toast_bar.dart';
import 'package:dashboad/features/lab_master/presentation/cubit/lab_cubit.dart';
import 'package:dashboad/features/lab_master/presentation/cubit/upload_file_cubit.dart';
import 'package:dashboad/features/lab_master/presentation/pages/widgets/back_request_card.dart';
import 'package:dashboad/features/lab_master/presentation/pages/widgets/custom_drop_down_button.dart';
import 'package:dashboad/features/lab_master/presentation/pages/widgets/flip_card_animation.dart';
import 'package:dashboad/features/lab_master/presentation/pages/widgets/front_request_card.dart';
import 'package:dashboad/features/lab_master/presentation/pages/widgets/shimmer_request_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

var fController = FlipCardController();
var controllers = List.generate(20, (index) => FlipCardController());

class LabMasterPatientQueue extends StatelessWidget {
  const LabMasterPatientQueue({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LabCubit(getIt())..getLabRequest(),
        ),
        BlocProvider(
          create: (context) => UploadFileCubit(getIt()),
          lazy: false,
        ),
      ],
      child: Builder(builder: (context) {
        return BlocListener<LabCubit, LabState>(
          listener: (context, state) {
            if (state is GetLabRequestErrorState) {
              ToastBar.onNetworkFailure(context, networkException: state.error);
            } else if (state is MakeItDoneSuccessState) {
              ToastBar.onSuccess(context,
                  message: state.message, title: "Success");
            } else if (state is MakeItFailSuccessState) {
              ToastBar.onSuccess(context,
                  message: state.message, title: "Success");
            } else if (state is MakeItDoneErrorState) {
              ToastBar.onNetworkFailure(context, networkException: state.error);
            } else if (state is MakeItFailErrorState) {
              ToastBar.onNetworkFailure(context, networkException: state.error);
            }
          },
          child: Scaffold(
            body: Padding(
                padding: const EdgeInsets.all(
                  AppPadding.p30,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: SearchBar(
                            controller: BlocProvider.of<LabCubit>(context)
                                .searchController,
                            onSubmitted: (value) {
                              BlocProvider.of<LabCubit>(context)
                                  .getLabRequest();
                            },
                            backgroundColor:
                                WidgetStatePropertyAll(ColorsHelper.grey100),
                            constraints: const BoxConstraints(minHeight: 50),
                            leading: const Icon(
                              Icons.search,
                              color: ColorsHelper.blue,
                            ),
                            hintText: "Enter patient name",
                            hintStyle: const WidgetStatePropertyAll(
                              TextStyle(
                                fontSize: 16,
                                color: Colors.black45,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomDropDownButton(
                            items: const [
                              'All',
                              'Pending',
                              "Done",
                              "Failed",
                            ],
                            initialValue:
                                BlocProvider.of<LabCubit>(context).labStatus,
                            onChnaged: (value) {
                              BlocProvider.of<LabCubit>(context).labStatus =
                                  value!;
                              BlocProvider.of<LabCubit>(context)
                                  .getLabRequest();
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: BlocBuilder<LabCubit, LabState>(
                        builder: (context, state) {
                          if (state is GetLabRequestSuccessState) {
                            return GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 300,
                                mainAxisExtent: 210,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return FlipCardWidget(
                                  controller: BlocProvider.of<LabCubit>(context)
                                      .cardControllers[index],
                                  front: FrontRequestCard(
                                    makeItDoneOnPressed: () {
                                      BlocProvider.of<LabCubit>(context)
                                          .makeItDone(
                                        state.requests[index].id,
                                        state.requests[index].labStatus,
                                      );
                                    },
                                    makeItFailOnPressed: () {
                                      BlocProvider.of<LabCubit>(context)
                                          .makeItFail(
                                        state.requests[index].id,
                                        state.requests[index].labStatus,
                                      );
                                    },
                                    controller:
                                        BlocProvider.of<LabCubit>(context)
                                            .cardControllers[index],
                                    patientName: state.requests[index].session
                                        .patient.fullName,
                                    serviceName: BlocProvider.of<LabCubit>(
                                            context)
                                        .getServiceNameById(
                                            state.requests[index].serviceId),
                                    status: state.requests[index].labStatus,
                                    date: state.requests[index].createdDate,
                                    description:
                                        state.requests[index].description,
                                  ),
                                  back: BackRequestCard(
                                    sessionDetailsId: state.requests[index].id,
                                    controller:
                                        BlocProvider.of<LabCubit>(context)
                                            .cardControllers[index],
                                  ),
                                );
                              },
                              itemCount: state.requests.length,
                            );
                          } else if (state is GetLabRequetLoadingState) {
                            return GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 300,
                                mainAxisExtent: 210,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return const ShimmerRequestCard();
                              },
                              itemCount: 20,
                            );
                          } else {
                            return const Text("Something went wrong");
                          }
                        },
                      ),
                    ),
                  ],
                )),
          ),
        );
      }),
    );
  }
}

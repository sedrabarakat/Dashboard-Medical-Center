import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/core/domain/services/locator.dart';
import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/helpers/dimensions_helper.dart';
import 'package:dashboad/core/helpers/responsive_helper.dart';
import 'package:dashboad/core/utils/assets_manager.dart';
import 'package:dashboad/core/utils/style_manager.dart';
import 'package:dashboad/core/utils/values_manager.dart';
import 'package:dashboad/core/widgets/toast_bar.dart';
import 'package:dashboad/features/sections/presentation/cubits/section_cubit.dart';
import 'package:dashboad/features/sections/presentation/widgets/doctor_card.dart';
import 'package:dashboad/features/sections/presentation/widgets/service_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SectionDetails extends StatelessWidget {
  const SectionDetails({
    required this.id,
    required this.name,
    super.key,
  });
  final int id;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: getIt<SectionCubit>()..getSectionInformation(id),
        child: Builder(builder: (context) {
          return BlocListener<SectionCubit, SectionState>(
            listener: (context, state) {
              if (state is DeleteSectionErrorState) {
                ToastBar.onNetworkFailure(context,
                    networkException: state.error);
              } else if (state is DeleteSectionSuccessState) {
                context.pop();
              } else if (state is DeleteServiceSuccessState) {
                ToastBar.onSuccess(context,
                    message: state.message, title: "Success");
              } else if (state is DeleteServiceErrorState) {
                ToastBar.onNetworkFailure(context,
                    networkException: state.error, title: "Error");
              } else if (state is EditServiceSuccessState) {
                ToastBar.onSuccess(context,
                    message: "Edited Successfully", title: "Success");
              } else if (state is EditServiceErrorState) {
                ToastBar.onNetworkFailure(context,
                    networkException: state.error, title: "Error");
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p30),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: DimensionsHelper.heightPercentage(context, 10),
                    decoration: BoxDecoration(
                      color: ColorsHelper.teal.withAlpha(155),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        //TODO change it to network image
                        Hero(tag: id, child: Image.asset(AssetsManager.heart)),
                        Hero(
                          tag: name,
                          child: Text(
                            name,
                            overflow: TextOverflow.ellipsis,
                            style: StyleManager.fontSemiBold22
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () async {
                            BlocProvider.of<SectionCubit>(context)
                                .deleteSection(id);
                          },
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                          style: IconButton.styleFrom(
                            padding: EdgeInsets.zero,
                            iconSize: 22,
                            maximumSize: const Size(32, 32),
                            minimumSize: const Size(32, 32),
                            backgroundColor: Colors.red,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: BlocBuilder<SectionCubit, SectionState>(
                      buildWhen: (previous, current) {
                        if (current is GetSectionInformationLoadingState &&
                            previous is GetSectionInformationSuccessState) {
                          return false;
                        } else if (current
                                is GetSectionInformationLoadingState &&
                            previous is GetSectionInformationLoadingState) {
                          return false;
                        }
                        if (current is GetSectionInformationErrorState) {
                          return true;
                        } else if (current
                            is GetSectionInformationLoadingState) {
                          return true;
                        } else if (current
                            is GetSectionInformationSuccessState) {
                          return true;
                        } else if (previous
                                is GetSectionInformationSuccessState &&
                            current is DeleteServiceSuccessState) {
                          return true;
                        }
                        return false;
                      },
                      builder: (context, state) {
                        if (state is GetSectionInformationSuccessState) {
                          return Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    maxCrossAxisExtent: 350,
                                    mainAxisExtent: 250,
                                  ),
                                  itemBuilder: (context, index) => DoctorCard(
                                    sectionName: name,
                                    doctorName: state.section.doctor![index]
                                        .userData.firstName,
                                    onTap: () {},
                                  ),
                                  itemCount: state.section.doctor?.length,
                                ),
                              ),
                              !ResponsiveHelper.isMobile(context)
                                  ? const SizedBox(
                                      width: 20,
                                    )
                                  : const SizedBox(),
                              !ResponsiveHelper.isMobile(context)
                                  ? Expanded(
                                      flex: 1,
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color: ColorsHelper.lightGry,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: ListView.separated(
                                            itemBuilder: (context, index) =>
                                                SerivcesTile(
                                              onDeletePressed: () async {
                                                await BlocProvider.of<
                                                        SectionCubit>(context)
                                                    .deleteService(state.section
                                                        .service![index].id);
                                              },
                                              onEditPressed: () async {
                                                await BlocProvider.of<
                                                        SectionCubit>(context)
                                                    .showServiceDialog(
                                                  context: context,
                                                  edit: true,
                                                  index: index,
                                                );
                                              },
                                              name: state
                                                  .section.service![index].name,
                                              price: state.section
                                                  .service![index].price,
                                              index: index,
                                              lastIndex: 20,
                                            ),
                                            separatorBuilder:
                                                (context, index) =>
                                                    const SizedBox(
                                              height: 0,
                                            ),
                                            itemCount:
                                                state.section.service!.length,
                                          )),
                                    )
                                  : const SizedBox(),
                            ],
                          );
                        } else if (state is GetSectionInformationLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: ColorsHelper.teal,
                            ),
                          );
                        } else if (state is GetSectionInformationErrorState) {
                          return Center(
                            child: Text(
                                NetworkExceptions.getErrorMessage(state.error)),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

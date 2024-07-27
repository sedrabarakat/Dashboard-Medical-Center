import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/core/domain/services/locator.dart';
import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/helpers/dimensions_helper.dart';
import 'package:dashboad/core/helpers/responsive_helper.dart';
import 'package:dashboad/core/utils/assets_manager.dart';
import 'package:dashboad/core/utils/style_manager.dart';
import 'package:dashboad/core/utils/values_manager.dart';
import 'package:dashboad/features/sections/presentation/cubits/section_cubit.dart';
import 'package:dashboad/features/sections/presentation/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p30),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                height: DimensionsHelper.heightPercentage(context, 10),
                decoration: BoxDecoration(
                  color: ColorsHelper.teal.withAlpha(155),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
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
                    } else if (current is GetSectionInformationLoadingState &&
                        previous is GetSectionInformationLoadingState) {
                      return false;
                    }
                    if (current is GetSectionInformationErrorState) {
                      return true;
                    } else if (current is GetSectionInformationLoadingState) {
                      return true;
                    } else if (current is GetSectionInformationSuccessState) {
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
                                doctorName: "Doctor name",
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
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: ListView.separated(
                                        itemBuilder: (context, index) =>
                                            SerivcesTile(
                                          index: index,
                                          lastIndex: 20,
                                        ),
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                          height: 0,
                                        ),
                                        itemCount: 20,
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
      ),
    );
  }
}

class SerivcesTile extends StatefulWidget {
  const SerivcesTile({super.key, required this.index, required this.lastIndex});
  final int index;
  final int lastIndex;
  @override
  State<SerivcesTile> createState() => _SerivcesTileState();
}

class _SerivcesTileState extends State<SerivcesTile> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHover = false;
        });
      },
      child: AnimatedContainer(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        padding: const EdgeInsets.all(10),
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        height: isHover ? 70 : 50,
        decoration: BoxDecoration(
          border: isHover
              ? Border.all(
                  color: ColorsHelper.teal,
                )
              : null,
          borderRadius: BorderRadius.only(
            topRight: (isHover || widget.index == 0
                ? const Radius.circular(20)
                : const Radius.circular(0)),
            topLeft: (isHover || widget.index == 0
                ? const Radius.circular(20)
                : const Radius.circular(0)),
            bottomLeft: (isHover || widget.index == widget.lastIndex - 1
                ? const Radius.circular(20)
                : const Radius.circular(0)),
            bottomRight: (isHover || widget.index == widget.lastIndex - 1
                ? const Radius.circular(20)
                : const Radius.circular(0)),
          ),
          color: ColorsHelper.lightGry,
        ),
        child: SizedBox(
          height: 70,
          child: Column(
            children: [
              SizedBox(
                height: 30,
                child: Row(
                  children: [
                    Text(
                      "Services",
                      style: StyleManager.fontMedium14.copyWith(
                        color: ColorsHelper.black,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "200\$",
                      style: StyleManager.fontRegular12.copyWith(
                        color: ColorsHelper.black,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isHover
                        ? Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: 30,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.red,
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.close,
                                        size: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: 30,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: ColorsHelper.teal,
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.edit,
                                        size: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

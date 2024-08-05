import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/helpers/responsive_helper.dart';
import 'package:dashboad/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SectionsListLoading extends StatelessWidget {
  const SectionsListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isMobile(context)
        ? ListView.separated(
            padding: const EdgeInsets.all(AppPadding.p30),
            itemBuilder: (context, index) => const SectionCardShimmer(),
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: 10,
          )
        : GridView.builder(
            padding: const EdgeInsets.all(AppPadding.p30),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              mainAxisExtent: 125,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) => const SectionCardShimmer(),
            itemCount: 10,
          );
  }
}

class SectionCardShimmer extends StatelessWidget {
  const SectionCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade400,
      child: Container(
        height: 125,
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: ColorsHelper.tealLightest,
            width: 1,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 0,
              blurRadius: 10,
            )
          ],
        ),
        child: const SizedBox(),
      ),
    );
  }
}

import 'package:dashboad/core/helpers/dimensions_helper.dart';
import 'package:dashboad/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTableRow extends StatelessWidget {
  const ShimmerTableRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade400,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p8,
          vertical: AppPadding.p10,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 22,
                  ),
                  const SizedBox(
                    width: AppSize.s10,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: DimensionsHelper.widthPercentage(context, 10),
                          height: 10,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: DimensionsHelper.widthPercentage(context, 15),
                          height: 10,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppPadding.p4,
                      horizontal: AppPadding.p12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      width: 40,
                      height: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Wrap(
                clipBehavior: Clip.hardEdge,
                children: [
                  Container(
                    color: Colors.white,
                    width: 50,
                    height: 15,
                  ),
                  const SizedBox(
                    width: AppSize.s8,
                  ),
                  Container(
                    color: Colors.white,
                    width: 50,
                    height: 15,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

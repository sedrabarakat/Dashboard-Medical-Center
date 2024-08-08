import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/style_manager.dart';
import 'package:dashboad/features/sections/data/models/section_model.dart';
import 'package:flutter/material.dart';

class SectionItemList extends StatelessWidget {
  const SectionItemList(
      {super.key,
      required this.animation,
      required this.value,
      required this.onRemovePressed});
  final SectionService value;
  final Animation<double> animation;
  final void Function()? onRemovePressed;
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position:
          Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
              .animate(animation),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: ColorsHelper.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: ColorsHelper.blue.withOpacity(.2),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value.name,
                  style: StyleManager.fontSemiBold12,
                ),
              ),
              Expanded(
                child: Text(
                  "${value.price} SYP",
                  style: StyleManager.fontSemiBold12,
                ),
              ),
              IconButton(
                onPressed: onRemovePressed,
                icon: const Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
                style: IconButton.styleFrom(
                  padding: EdgeInsets.zero,
                  iconSize: 14,
                  minimumSize: const Size(26, 26),
                  maximumSize: const Size(26, 26),
                  backgroundColor: ColorsHelper.error,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

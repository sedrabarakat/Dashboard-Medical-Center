import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/assets_manager.dart';
import 'package:dashboad/core/utils/style_manager.dart';
import 'package:flutter/material.dart';

class SectionCard extends StatelessWidget {
  const SectionCard(
      {required this.onTap,
      required this.name,
      required this.image,
      required this.id,
      super.key});
  final String name;
  final String image;
  final int id;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // when hover above the card
      hoverColor: ColorsHelper.grey300,
      // when you tab the card and untap
      splashColor: ColorsHelper.grey400,

      // when you tab the card
      highlightColor: ColorsHelper.grey500,
      borderRadius: BorderRadius.circular(10),

      onTap: onTap,
      child: Container(
        height: 125,
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
          border: Border.all(
            color: ColorsHelper.black12,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Hero(
              tag: id,
              // Todo change it to network image
              child: Image.asset(
                AssetsManager.heart,
                fit: BoxFit.fitHeight,
              ),
            ),
            
            Expanded(
              child: Hero(
                tag: name,
                child: Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: StyleManager.fontSemiBold22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

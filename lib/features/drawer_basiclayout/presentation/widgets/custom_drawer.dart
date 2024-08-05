import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/assets_manager.dart';
import 'package:dashboad/core/utils/style_manager.dart';
import 'package:dashboad/core/widgets/animated_text.dart';
import 'package:dashboad/features/drawer_basiclayout/presentation/widgets/drawer_items.dart';
import 'package:dashboad/features/drawer_basiclayout/presentation/widgets/reception_drawer_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomDrawer extends StatelessWidget {
  final String role;

  const CustomDrawer({
    super.key,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: StyleManager.rounded50,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            liquedText(
              text: 'Medical Center',
              waveColor: ColorsHelper.blueDark,
              backgroundColor: Colors.white,
            ),
            role == 'owner'
                ? receptionDrawerList(context: context)
                : drawerList(context: context),
            SvgPicture.asset(
              AssetsManager.drawerImage,
              height: 440.h,
            )
          ],
        ),
      ),
    );
  }
}

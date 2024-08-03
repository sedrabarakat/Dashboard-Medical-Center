import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/assets_manager.dart';
import 'package:dashboad/core/utils/style_manager.dart';
import 'package:dashboad/core/widgets/animated_text.dart';
import 'package:dashboad/features/drawer_basiclayout/presentation/widgets/drawer_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.navigationShell,
  });
  final StatefulNavigationShell navigationShell;
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
            drawerList(
              navigationShell: navigationShell,
            ),
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

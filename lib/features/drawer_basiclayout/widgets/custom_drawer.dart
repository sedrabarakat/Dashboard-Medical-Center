import 'package:dashboad/core/data/datasources/local.dart';
import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/assets_manager.dart';
import 'package:dashboad/core/utils/style_manager.dart';
import 'package:dashboad/core/widgets/animated_text.dart';
import 'package:dashboad/features/drawer_basiclayout/widgets/lab_master_drawer.dart';
import 'package:dashboad/features/drawer_basiclayout/widgets/reception_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'drawer_items.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    var role = SharedPrefrence.getData(key: 'role');
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
            (role == "owner")
                ? drawerList(
                    navigationShell: navigationShell,
                  )
                : (role == 'receptionist')
                    ? receptionDrawerList(
                        navigationShell: navigationShell, context: context)
                    : labMasterDrawer(navigationShell: navigationShell),
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

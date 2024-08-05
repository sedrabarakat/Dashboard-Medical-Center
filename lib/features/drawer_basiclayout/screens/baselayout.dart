import 'package:dashboad/core/helpers/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/helpers/colors_helper.dart';
import '../widgets/custom_drawer.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isDesktop(context)
        ? Scaffold(
            backgroundColor: ColorsHelper.basicBackground,
            body: Row(
              children: [
                CustomDrawer(
                  navigationShell: navigationShell,
                ),
                Expanded(
                  child: navigationShell,
                ),
              ],
            ),
          )
        : Scaffold(
            backgroundColor: ColorsHelper.basicBackground,
            drawer: CustomDrawer(
              navigationShell: navigationShell,
            ),
            appBar: AppBar(),
            body: navigationShell,
          );
  }
}

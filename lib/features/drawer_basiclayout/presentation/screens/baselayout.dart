import 'package:dashboad/features/drawer_basiclayout/presentation/cubits/basic_cubit.dart';
import 'package:dashboad/features/drawer_basiclayout/presentation/cubits/basic_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/helpers/colors_helper.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/style_manager.dart';
import '../../../../core/widgets/animated_text.dart';
import '../widgets/drawer_items.dart';

class Base_Layout extends StatelessWidget {
  Base_Layout({required this.child});

  Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsHelper.Basic_background,
      body: Row(
        children: [
          Drawer(
              backgroundColor: Colors.white,
              shape: StyleManager.Rounded50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Liqued_Text(
                    Text: 'Medical Center',
                    waveColor: ColorsHelper.tealLightDark,
                    BackgroundColor: Colors.white,
                  ),
                  Drawer_List(context: context),
                  Flexible(
                      child: Padding(
                       padding: EdgeInsets.only(top: 100.h),
                        child: SvgPicture.asset(AssetsManager.drawer_image),
                  ))
                ],
              )),
          Expanded(child: child)
        ],
      ),
    );
  }
}
//Color.fromARGB(255, 10, 185, 181)

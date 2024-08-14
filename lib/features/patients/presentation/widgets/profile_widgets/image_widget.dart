import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_network/image_network.dart';
import '../../../../../core/helpers/colors_helper.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/style_manager.dart';

Widget Image_widget({
  required var image,
}) {
  return Container(
      clipBehavior: Clip.hardEdge,
      height: 250.h,
      width: 200.w,
      decoration: StyleManager.Circle_Shape(color: ColorsHelper.black26),
      child: (image != null)
          ? ImageNetwork(
              image: image,
              height: 250.h,
              width: 200.w,
              fitWeb: BoxFitWeb.fill,
            )
          : Image.asset(AssetsManager.defImage, fit: BoxFit.contain));
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/style_manager.dart';
import '../../../drawer_basiclayout/presentation/screens/baselayout.dart';
import '../widgets/image_widget.dart';

class PatientProfile extends StatelessWidget {
  const PatientProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 50.w, vertical: 5.h),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: 50.w, vertical: 50.h),
          height: 920.h,
          decoration: StyleManager.rounded40(
              color: Colors.white),
          child: Column(
            children: [
              Row(children: [
                Image_widget(),
                TextField()
              ],)
            ],
          ),
        ),
      ),
    );
  }
}

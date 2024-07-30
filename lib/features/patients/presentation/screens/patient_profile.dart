import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/style_manager.dart';
import '../../../drawer_basiclayout/presentation/screens/baselayout.dart';
import '../widgets/profile_widgets/image_widget.dart';
import '../widgets/profile_widgets/name_widget.dart';

class PatientProfile extends StatelessWidget {
  const PatientProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Padding(
        padding: EdgeInsets.only(left: 50.w , right: 30.w),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 50.w, vertical: 50.h),
              height: 920.h,
              width: 850.w,
              decoration: StyleManager.rounded40(
                  color: Colors.white),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Image_widget(),
                    SizedBox(width: 30.w,),
                    Padding(
                      padding: EdgeInsets.only(top: 30.h),
                      child: nameWidget(first_name: 'Abd Alrahmman', Second_name: 'Sieffffffffffffff', Last_name: 'Quatliiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii'),
                    )
                  ],)
                ],
              ),
            ),
            SizedBox(width: 50.w,),
            Container(
              height: 920.h,
              width: 350.w,
              decoration: StyleManager.rounded40(
                  color: Colors.white),)
          ],
        ),
      ),
    );
  }
}

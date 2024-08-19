import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/style_manager.dart';
import '../cubits/add_account_cubit.dart';
import 'basic_columns/fromfield_column.dart';
import 'basic_columns/role_image_column.dart';

class BaseContainer extends StatelessWidget{

  AddAccountCubit cubit;
  BaseContainer({required this.cubit});

  @override
  Widget build(BuildContext context) {

    return  Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 80.w, vertical: 50.h),
        height: 700.h,
        decoration: StyleManager.rounded40(
            color: Colors.white),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoleImageColumn(cubit: cubit,),
            SizedBox(
              width: 100.w,
            ),
            Expanded(
              flex: 3,
                child: FromfieldColumn(cubit: cubit,context: context,)),
          ],
        ),
      ),
    );
  }
}
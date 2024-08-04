import 'package:dashboad/core/utils/style_manager.dart';
import 'package:dashboad/features/create_account/presentation/cubits/add_account_cubit.dart';
import 'package:dashboad/features/create_account/presentation/widgets/select_role/cell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../domain/constants/constants.dart';

Widget SelectedCell({
  required int index,
  required AddAccountCubit cubit
}){
  return InkWell(
    onTap: (){
      cubit.changed_Select(index: index);
      if(index==1) {
        cubit.getSection();
      }
    },
    child: Row(
      children: [
        Cell(index: index,cubit: cubit),
        SizedBox(width: 10.w,),
        Text(Selected_role_list[index]["name"],
          style: StyleManager.font20W600,)
      ],),
  );
}


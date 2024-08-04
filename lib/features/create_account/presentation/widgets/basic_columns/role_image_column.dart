import 'package:dashboad/features/create_account/presentation/widgets/select_role/selected_role_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/colors_helper.dart';
import '../../../../../core/utils/style_manager.dart';
import '../../cubits/add_account_cubit.dart';
import '../add_image_widget.dart';

class RoleImageColumn extends StatelessWidget {
  AddAccountCubit cubit;

  RoleImageColumn({required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AddImage(context: context),
        SizedBox(
          height: 80.h,
        ),
        Text("Role",
            style:
                StyleManager.font20W600.copyWith(color: ColorsHelper.black54)),
        SizedBox(
          height: 25.h,
        ),
        SizedBox(
          width: 200.w,
          child: SelecteRoleList(
            cubit: cubit,
          ),
        )
      ],
    );
  }
}

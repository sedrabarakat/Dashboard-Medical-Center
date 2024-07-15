import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/features/create_account/presentation/cubits/add_account_cubit.dart';
import 'package:dashboad/features/create_account/presentation/cubits/add_account_states.dart';
import 'package:dashboad/features/create_account/presentation/widgets/select_role/selected_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/style_manager.dart';
import '../add_image_widget.dart';

class SelecteRoleList extends StatelessWidget {

  AddAccountCubit cubit;

  SelecteRoleList({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) =>
            SelectedCell(index: index, cubit: cubit),
        separatorBuilder: (context, index) => SizedBox(
          height: 15.h,
        ),
        itemCount: cubit.Selected_role_list.length);
  }
}

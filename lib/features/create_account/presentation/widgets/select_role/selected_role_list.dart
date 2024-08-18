import 'package:dashboad/features/create_account/presentation/cubits/add_account_cubit.dart';
import 'package:dashboad/features/create_account/presentation/widgets/select_role/selected_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/data/datasources/local.dart';
import '../../../domain/constants/constants.dart';


class SelecteRoleList extends StatelessWidget {

  AddAccountCubit cubit;

  SelecteRoleList({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    var role = SharedPrefrence.getData(key: 'reception');
    return (role == "owner")?SelectedCell(index: 2, cubit: cubit):
     ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) =>
            SelectedCell(index: index, cubit: cubit),
        separatorBuilder: (context, index) => SizedBox(
          height: 15.h,
        ),
        itemCount: Selected_role_list.length);
  }
}

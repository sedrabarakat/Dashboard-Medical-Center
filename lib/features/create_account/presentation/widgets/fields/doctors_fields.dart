import 'package:dashboad/features/create_account/presentation/widgets/texts_and_fields/text&drop_down.dart';
import 'package:dashboad/features/create_account/presentation/widgets/texts_and_fields/text&text_filed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/validator_manager.dart';
import '../../../domain/constants/constants.dart';
import '../../cubits/add_account_cubit.dart';

class DoctorsFields extends StatelessWidget{




  AddAccountCubit cubit;
  DoctorsFields({required this.cubit});

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Text_DropDown(text: "Section",dropdownItems: Sections, OnChanged: (value) {
          cubit.Select_Section(item: value);
        },selectedItem: cubit.Selected_Section,
          validator: (value) =>
              ValidatorManager.instance.validate_EmptyState(value ?? '','Section'),
        ),
        SizedBox(width: 30.w,),
        Text_TextFiled(text: 'Day In Advance',controller: cubit.Day_In_Advance,
        validator: (value) =>
            ValidatorManager.instance.validate_EmptyState(value ?? '',"Doctor Advance Day")),
        SizedBox(width: 30.w,),
        Text_TextFiled(text: 'Duration',controller: cubit.Duration,
        validator: (value) =>
            ValidatorManager.instance.validate_EmptyState(value ?? '',"Doctor Duration"),),
      ],
    );
  }



}
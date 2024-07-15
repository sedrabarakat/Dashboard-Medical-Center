import 'package:dashboad/features/create_account/presentation/widgets/texts_and_fields/text&drop_down.dart';
import 'package:dashboad/features/create_account/presentation/widgets/texts_and_fields/text&text_filed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cubits/add_account_cubit.dart';

class DoctorsFields extends StatelessWidget{

  var First_name=TextEditingController();
  var Day_In_Advance=TextEditingController();
  var Duration=TextEditingController();

  AddAccountCubit cubit;
  DoctorsFields({required this.cubit});

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Text_DropDown(text: "Section",dropdownItems: cubit.Sections, OnChanged: (value) {
          cubit.Select_Section(item: value);
        },selectedItem: cubit.Selected_Section,),
        SizedBox(width: 30.w,),
        Text_TextFiled(text: 'Day In Advance',controller: Day_In_Advance,),
        SizedBox(width: 30.w,),
        Text_TextFiled(text: 'Duration',controller: Duration,),
      ],
    );
  }



}
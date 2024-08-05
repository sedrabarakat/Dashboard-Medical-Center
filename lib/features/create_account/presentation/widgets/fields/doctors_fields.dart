import 'package:dashboad/features/create_account/presentation/widgets/texts_and_fields/text&drop_down.dart';
import 'package:dashboad/features/create_account/presentation/widgets/texts_and_fields/text&text_filed.dart';
import 'package:dashboad/features/doctors/presentation/widgets/profile_widget/work_days.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/validator_manager.dart';
import '../../cubits/add_account_cubit.dart';

class DoctorsFields extends StatelessWidget {
  AddAccountCubit cubit;
  var Buildcontext;

  DoctorsFields({required this.cubit,this.Buildcontext});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text_DropDown(
              text: "Section",
              dropdownItems: cubit.SectionNames,
              OnChanged: (value) {
                //cubit.Select_Section(item: value);
                for (var section in cubit.Sections) {
                  if (section.containsKey(value)) {
                    cubit.Select_SectionId(id: section[value]!);
                  }
                }
              },
              //selectedItem: cubit.Selected_Section,
              validator: (value) => ValidatorManager.instance
                  .validate_EmptyState(value ?? '', 'Section'),
            ),
            SizedBox(
              width: 30.w,
            ),
            Text_TextFiled(
                text: 'Day In Advance',
                controller: cubit.Day_In_Advance,
                isNum: true,
                validator: (value) => ValidatorManager.instance
                    .validate_EmptyState(value ?? '', "Doctor Advance Day")),
            SizedBox(
              width: 30.w,
            ),
            Text_TextFiled(
              text: 'Duration',
              controller: cubit.Duration,
              validator: (value) => ValidatorManager.instance
                  .validate_EmptyState(value ?? '', "Doctor Duration"),
            ),
          ],
        ),
        SizedBox(
          height: 50.h,
        ),
      /*  Text_TextFiled(
          text: 'Working Hours',
          onTap: () {
            showCupertinoDialog(
                context: context,
                builder: (_) => AlertDialouge(myctx: Buildcontext,onPressed: (){
                }));
          },
          validator: (value) => ValidatorManager.instance
              .validate_EmptyState(value ?? '', "Working hour...At least one"),
        ),*/
      ],
    );
  }
}

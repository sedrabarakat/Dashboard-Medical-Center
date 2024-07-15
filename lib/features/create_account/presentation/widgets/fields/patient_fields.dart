import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/features/create_account/presentation/widgets/texts_and_fields/text&drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../cubits/add_account_cubit.dart';
import '../texts_and_fields/text&text_filed.dart';

class PatientFields extends StatelessWidget {

  var Birth_Date = TextEditingController();
  var Age = TextEditingController();
  var Address = TextEditingController();
  var Blood_Type = TextEditingController();
  var Matrial_Status = TextEditingController();
  var Children_num = TextEditingController();
  var Habit = TextEditingController();


  AddAccountCubit cubit;
  BuildContext context;

  PatientFields({required this.cubit,required this.context});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text_DropDown(
              text: "Gender",
              OnChanged: (value) {
                cubit.Select_Gender(value: value);
              },
              dropdownItems: cubit.Gender,
              selectedItem: cubit.Selected_Gender,
            ),
            SizedBox(
              width: 30.w,
            ),
            Text_TextFiled(
              text: 'Birth Date',
              controller: Birth_Date,
              onTap:  () async {
               showDatePicker(context: context,
                   firstDate: DateTime.now(),
                   lastDate: DateTime(2090),

               );
    },
            ),
            SizedBox(
              width: 30.w,
            ),
            Text_TextFiled(
              text: 'Age',
              controller: Age,
            ),
          ],
        ),
        SizedBox(
          height: 40.h,
        ),
        Row(
          children: [
            Text_TextFiled(
              text: 'Address',
              controller: Address,
            ),
            SizedBox(
              width: 30.w,
            ),
            Text_DropDown(
              text: "Matrial Status",
              OnChanged: (value) {
                cubit.Select_Status(value: value);
              },
              dropdownItems: cubit.Matrial_Status,
              selectedItem: cubit.Status,
            ),
            SizedBox(
              width: 30.w,
            ),
            Text_TextFiled(
              text: 'Children number',
              controller: Children_num,
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            Text_DropDown(
              text: "Blood Type",
              OnChanged: (value) {
                cubit.Select_BloodType(value: value);
              },
              dropdownItems: cubit.Blood_Type,
              selectedItem: cubit.Selected_Blood_Type,
            ),
            SizedBox(
              width: 30.w,
            ),
          Text_DropDown(
            text: "Diabetes",
            OnChanged: (value) {
              cubit.Select_Boolean(type: "Diabetes", value: value);
            },
            dropdownItems: cubit.Boolean_List,
            selectedItem: cubit.Diabetes,
          ),
            SizedBox(
              width: 30.w,
            ),
            Text_DropDown(
              text: "Pressure",
              OnChanged: (value) {
                cubit.Select_Boolean(type: "Pressure", value: value);
              },
              dropdownItems: cubit.Boolean_List,
              selectedItem: cubit.Pressure,
            ),
        ],),
        SizedBox(
          height: 20.h,
        ),
        Text_TextFiled(
          text: 'Habits',
          controller: Habit,
          maxLine: 10,
        ),

      ],
    );
  }
}

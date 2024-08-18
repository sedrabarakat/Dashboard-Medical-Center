import 'package:dashboad/features/create_account/presentation/widgets/texts_and_fields/text&drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/date_helper.dart';
import '../../../../../core/utils/validator_manager.dart';
import '../../../domain/constants/constants.dart';
import '../../cubits/add_account_cubit.dart';
import '../texts_and_fields/text&text_filed.dart';

class PatientFields extends StatelessWidget {
  AddAccountCubit cubit;
  BuildContext context;

  PatientFields({required this.cubit, required this.context});

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
              dropdownItems: Gender,
              selectedItem: cubit.Selected_Gender,
              validator: (value) =>
                  ValidatorManager.instance.validate_EmptyState(value ?? '','Gender'),
            ),
            SizedBox(
              width: 40.w,
            ),
            Text_TextFiled(
              text: 'Birth Date',
              controller: cubit.Birth_Date,
              validator: (value) =>
                  ValidatorManager.instance.validate_EmptyState(value ?? '',"Birth Date"),
              onTap: () async {
                showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                ).then((val){
                 if(val!=null) {
                    cubit.calculateAge(val);
                    cubit.Select_Date(
                        DateHelper.Convert_DateTime_DashString(dateTime: val));
                  }
                });
              },
            ),
            SizedBox(
              width: 40.w,
            ),
            Text_TextFiled(
              text: 'Age',
              controller: cubit.Age,
              isNum: true,
            ),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        Row(
          children: [
            Text_TextFiled(
              text: 'Address',
              controller: cubit.Address,
              validator: (value) =>
                  ValidatorManager.instance.validate_EmptyState(value ?? '',"Address"),
            ),
            SizedBox(
              width: 40.w,
            ),
            Text_DropDown(
              text: "Matrial Status",
              OnChanged: (value) {
                cubit.Select_Status(value: value);
              },
              validator: (value) =>
                  ValidatorManager.instance.validate_EmptyState(value ?? '','Matrial Status'),
              dropdownItems: Matrial_Status_List,
              selectedItem: cubit.Status,
            ),
            SizedBox(
              width: 40.w,
            ),
            Text_TextFiled(
              isNum: true,
              text: 'Children number',
              controller: cubit.Children_num,
              validator:  (value) =>
                  ValidatorManager.instance.validateChildren(value ?? '')
            ),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        Row(
          children: [
            Text_DropDown(
              text: "Blood Type",
              OnChanged: (value) {
                cubit.Select_BloodType(value: value);
              },
              dropdownItems: Blood_Type_List,
              selectedItem: cubit.Selected_Blood_Type,
              validator: (value) =>
                  ValidatorManager.instance.validate_EmptyState(value ?? '','Blood Type'),
            ),
            SizedBox(
              width: 40.w,
            ),
            Text_DropDown(
              text: "Diabetes",
              OnChanged: (value) {
                cubit.Select_Boolean(type: "Diabetes", value: value);
              },
              dropdownItems: Boolean_List,
              selectedItem: cubit.Diabetes,
              validator: (value) =>
                  ValidatorManager.instance.validate_EmptyState(value ?? '','that field'),
            ),
            SizedBox(
              width: 40.w,
            ),
            Text_DropDown(
              text: "Pressure",
              OnChanged: (value) {
                cubit.Select_Boolean(type: "Pressure", value: value);

              },
              dropdownItems: Boolean_List,
              selectedItem: cubit.Pressure,
              validator: (value) =>
                  ValidatorManager.instance.validate_EmptyState(value ?? '','that field'),
            ),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        Row(
          children: [
            Text_TextFiled(
              text: 'Habits',
              controller: cubit.Habit,
              maxLine: 10,
            ),
            SizedBox(
              width: 40.w,
            ),
            Text_TextFiled(
              text: 'Job',
              controller: cubit.profession,
            ),
            SizedBox(
              width: 40.w,
            ),
            Text_TextFiled(
              text: 'Wallet',
              isNum: true,
              controller: cubit.wallet,
              validator:  (value) =>
                  ValidatorManager.instance.validate_EmptyState(value ?? '',"Address")
            ),
          ],
        ),
      ],
    );
  }
}

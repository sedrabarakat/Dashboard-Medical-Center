import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/features/create_account/presentation/cubits/add_account_cubit.dart';
import 'package:dashboad/features/create_account/presentation/widgets/texts_and_fields/text&text_filed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/validator_manager.dart';
import '../../../../../core/widgets/elevated_button.dart';
import '../fields/doctors_fields.dart';
import '../fields/patient_fields.dart';

class FromfieldColumn extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  AddAccountCubit cubit;
  BuildContext context;

  FromfieldColumn({super.key, required this.cubit, required this.context});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text_TextFiled(
                  text: 'First Name',
                  controller: cubit.First_name,
                  validator: (value) =>
                      ValidatorManager.instance.validateName(value ?? ''),
                ),
                SizedBox(
                  width: 30.w,
                ),
                Text_TextFiled(
                    text: 'Middle Name',
                    controller: cubit.Middle_name,
                    validator: (value) => ValidatorManager.instance
                        .validateMiddleName(value ?? '')),
                SizedBox(
                  width: 30.w,
                ),
                Text_TextFiled(
                  text: 'Last Name',
                  controller: cubit.Last_name,
                  validator: (value) =>
                      ValidatorManager.instance.validateLastName(value ?? ''),
                ),
              ],
            ),
            SizedBox(
              height: 50.h,
            ),
            Row(
              children: [
                Text_TextFiled(
                    text: 'Password',
                    controller: cubit.Password,
                    validator: (value) => ValidatorManager.instance
                        .validatePassword(value ?? '')),
                SizedBox(
                  width: 30.w,
                ),
                Text_TextFiled(
                    text: 'Phone Number',
                    controller: cubit.Phone,
                    isNum: true,
                    validator: (value) =>
                        ValidatorManager.instance.validatePhone(value ?? '')),
                SizedBox(
                  width: 30.w,
                ),
                Text_TextFiled(
                    text: 'Description',
                    controller: cubit.Description,
                    maxLine: 4,
                    validator: (value) => ValidatorManager.instance
                        .validate_EmptyState(value ?? '', 'Description')),
              ],
            ),
            SizedBox(
              height: 70.h,
            ),
            if (cubit.SelectedIndex == 1)
              DoctorsFields(cubit: cubit, Buildcontext: context),
            if (cubit.SelectedIndex == 2)
              PatientFields(
                cubit: cubit,
                context: context,
              ),
            SizedBox(
                height: (cubit.SelectedIndex != 2)
                    ? (cubit.SelectedIndex != 1)
                        ? 247.h
                        : 55.h
                    : 50.h),
            Padding(
              padding: EdgeInsets.only(left: 750.w),
              child: CustomElevatedButton(
                onPressed: () {
                  // print(SharedPrefrence.getData(key: "token"));
                  if (formKey.currentState!.validate()) {
                    if (cubit.SelectedIndex == 0 ||
                        cubit.SelectedIndex == 3 ||
                        cubit.SelectedIndex == 4) cubit.Create_User();
                    if (cubit.SelectedIndex == 1) cubit.Create_Doctor();
                    if (cubit.SelectedIndex == 2) cubit.Create_Patient();
                  }
                },
                label: 'Add',
                buttonColor: ColorsHelper.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}

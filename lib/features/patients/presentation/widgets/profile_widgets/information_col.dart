import 'package:dashboad/features/patients/presentation/cubits/patient_cubit.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/widgets/editing/editing_dropdown.dart';
import '../../../../../core/widgets/editing/editing_field.dart';
import '../../../../create_account/domain/constants/constants.dart';

Widget infoCol1({required context}) {
  PatientCubit cubit = PatientCubit.get(context);
  bool isEditing = cubit.isEditing;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      editingFields(controller: cubit.age, is_Editig: isEditing),
      editingDropDown(
          dropdownItems: Gender,
          selectedItem: cubit.gender.text,
          selection: 'Gender',
          is_Editig: isEditing,
          onChanged: (value) {
            cubit.gender.text = value.toString();
          }),
      editingFields(controller: cubit.phone, is_Editig: isEditing),
      editingFields(controller: cubit.profession, is_Editig: isEditing),
      editingFields(controller: cubit.wallet, is_Editig: isEditing),
      editingDropDown(
          dropdownItems: Blood_Type_List,
          selectedItem: cubit.bloodType.text,
          selection: 'Blood Type',
          is_Editig: isEditing,
          onChanged: (value) {
            cubit.bloodType.text = value.toString();
          }),
      editingFields(
          controller: cubit.address, is_Editig: isEditing, isAddress: true),
      editingFields(controller: cubit.description, is_Editig: isEditing),
    ],
  );
}

Widget infoCol2({required context}) {
  PatientCubit cubit = PatientCubit.get(context);
  bool isEditing = cubit.isEditing;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      editingFields(controller: cubit.birthDate, is_Editig: isEditing),
      editingDropDown(
          dropdownItems: Matrial_Status_List,
          selectedItem: cubit.matrialStatus.text,
          selection: 'Material Status',
          is_Editig: isEditing,
          onChanged: (value) {
            cubit.matrialStatus.text = value.toString();
          }),
      editingFields(controller: cubit.childrenNum, is_Editig: isEditing),
      editingDropDown(
          dropdownItems: Boolean_List,
          selectedItem: cubit.diabets.text,
          selection: 'Diabetes',
          is_Editig: isEditing,
          onChanged: (value) {
            cubit.diabets.text = value.toString();
          }),
      editingDropDown(
          dropdownItems: Boolean_List,
          selectedItem: cubit.pressure.text,
          selection: 'Pressure',
          is_Editig: isEditing,
          onChanged: (value) {
            cubit.pressure.text = value.toString();
          }),
      editingFields(controller: cubit.habit, is_Editig: isEditing),
    ],
  );
}

import 'package:dashboad/features/patients/presentation/cubits/patient_cubit.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/widgets/editing_dropdown.dart';
import '../../../../../core/widgets/editing_field.dart';
import '../../../../create_account/domain/constants/constants.dart';

Widget infoCol1({required context}){
  PatientCubit cubit=PatientCubit.get(context);
  bool isEditing = cubit.isEditing;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      editingFields(
          controller: cubit.Age,
          is_Editig: isEditing),
      editingDropDown(
          dropdownItems: Gender, selectedItem: cubit.Gender.text, selection: 'Gender',
          is_Editig: isEditing),
      editingFields(
          controller: cubit.Phone,
          is_Editig: isEditing),
      editingFields(
          controller: cubit.profession,
          is_Editig: isEditing),
      editingFields(
          controller: cubit.wallet,
          is_Editig: isEditing),
      editingDropDown(
          dropdownItems: Blood_Type_List, selectedItem: cubit.Blood_Type.text, selection: 'Blood Type',
          is_Editig: isEditing),
      editingFields(
          controller: cubit.Address,
          is_Editig: isEditing,
          isAddress: true),

      editingFields(
          controller: cubit.Description,
          is_Editig: isEditing),
    ],
  );
}

Widget infoCol2({required context}){
  PatientCubit cubit=PatientCubit.get(context);
  bool isEditing = cubit.isEditing;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      editingFields(
          controller: cubit.Birth_Date,
          is_Editig: isEditing),
      editingDropDown(dropdownItems: Matrial_Status_List, selectedItem: cubit.Matrial_Status.text, selection: 'Matrial_Status',
          is_Editig:isEditing),
      editingFields(
          controller: cubit.Children_num,
          is_Editig: isEditing),
      editingDropDown(
          dropdownItems: Boolean_List,
          selectedItem: cubit.Diabets.text, selection: 'Diabets',
          is_Editig:isEditing),
      editingDropDown(
          dropdownItems: Boolean_List,
          selectedItem: cubit.Pressure.text, selection: 'Pressure',
          is_Editig:isEditing),
      editingFields(
          controller: cubit.Habit,
          is_Editig: isEditing),
    ],
  );
}
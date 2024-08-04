import 'package:dashboad/core/widgets/editing/editing_dropdown.dart';
import 'package:dashboad/features/create_account/presentation/cubits/add_account_cubit.dart';
import 'package:dashboad/features/doctors/presentation/cubits/doctor_cubit.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/widgets/editing/editing_field.dart';

Widget infoCol1({required context}){
  DoctorCubit cubit=DoctorCubit.get(context);
  bool isEditing = cubit.isEditing;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      editingFields(
          controller: cubit.Middle_name,
          is_Editig: isEditing),
      editingFields(
          controller: cubit.Phone,
          is_Editig: isEditing),
      editingDropDown(
          dropdownItems: cubit.SectionsName!,
          selectedItem: cubit.Section.text,
          selection: "Select Section" ,
          is_Editig: isEditing,
        onChanged: (value){
          for (int j=0;j<cubit.SectionsName!.length;j++ ) {
            if(cubit.SectionsName![j]==value){
              cubit.Select_SectionId(id: cubit.Sections[j][value]!);
            }
          }
        }
      ),
      editingFields(
          controller: cubit.Description,
          is_Editig: isEditing),


    ],
  );
}

Widget infoCol2({required context}){
  DoctorCubit cubit=DoctorCubit.get(context);
  bool isEditing = cubit.isEditing;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      editingFields(
          controller: cubit.Duration,
          is_Editig: isEditing),
      editingFields(
          controller: cubit.Day_In_Advance,
          is_Editig: isEditing),
    ],
  );
}


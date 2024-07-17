import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/features/create_account/presentation/cubits/add_account_cubit.dart';
import 'package:dashboad/features/create_account/presentation/widgets/texts_and_fields/text&text_filed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/elevated_button.dart';
import '../fields/doctors_fields.dart';
import '../fields/patient_fields.dart';

class FromfieldColumn extends StatelessWidget{


  var First_name=TextEditingController();
  var Middle_name=TextEditingController();
  var Last_name=TextEditingController();
  var Phone=TextEditingController();

  AddAccountCubit cubit;
  BuildContext context;

  FromfieldColumn({required this.cubit,required this.context});


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h,),
          Row(
            children: [
              Text_TextFiled(text: 'First Name',controller: First_name,),
              SizedBox(width: 30.w,),
              Text_TextFiled(text: 'Middle Name',controller: Middle_name,),
              SizedBox(width: 30.w,),
              Text_TextFiled(text: 'Last Name',controller: Last_name,),
            ],
          ),
          SizedBox(height: 50.h,),
          Text_TextFiled(text: 'Phone Number',controller: Phone,),
          SizedBox(height: 70.h,),
          if(cubit.SelectedIndex==1) DoctorsFields(cubit: cubit,),
          if(cubit.SelectedIndex==2) PatientFields(cubit: cubit,context: context,),
          if(cubit.SelectedIndex!=1 && cubit.SelectedIndex!=2)SizedBox(height: 230.h,),
          Padding(
            padding: EdgeInsets.only(left: 750.w,top: 50.h),
            child: CustomElevatedButton(onPressed: () {  }, label: 'Add',buttonColor: ColorsHelper.teal,),
          )
      
        ],
      ),
    );
  }
}
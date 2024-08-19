import 'package:dashboad/core/domain/services/locator.dart';
import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/data/datasources/local.dart';
import '../../../../core/widgets/animated_text.dart';
import '../../../auth/presentation/cubits/cubit/auth_cubit.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_states.dart';
import '../widget/appointment_chart.dart';
import '../widget/gender_chart.dart';
import '../widget/num_widget.dart';
import '../widget/welcome_con.dart';

class Home extends StatelessWidget{
  const Home({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context)=> HomeCubit(getIt())..getNums()..getGender()..getAppointment(),
      child: BlocConsumer<HomeCubit,HomeStates>(
        listener: (context,states){},
        builder: (context,states){
          HomeCubit cubit=HomeCubit.get(context);
          return Column(
            children: [
              WelcomeCon(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 30.h,bottom: 50.h,left: 60.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if(cubit.count.length>0)
                          rowNumWidget(context),
                          SizedBox(height: 50.h,),
                          if(cubit.appointmentList.length>0)
                          Container(
                            height: 550.h,
                            width: 940.w,
                            decoration: BoxDecoration(
                              color: CupertinoColors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: StackedColumnChart(),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding:  EdgeInsets.only(
                        left: 60.w,top: 40.h
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(height: 200,width: 200,),
                          if(cubit.genderList.length>0)
                          Container(
                            height: 480.h,
                            width: 500.w,
                            decoration: BoxDecoration(
                              color: CupertinoColors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: GenderPieChart(),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
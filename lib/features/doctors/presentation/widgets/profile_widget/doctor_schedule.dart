import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/colors_helper.dart';
import '../../../../../core/helpers/time_helper.dart';
import '../../../../../core/utils/style_manager.dart';
import '../../../data/model/schedule_model.dart';
import '../../screens/doctor_profile.dart';

Widget doctorSchedule({
  required cubit
}){
  return Container(
    height: 920.h,
    width: 350.w,
    decoration: StyleManager.rounded40(color: Colors.white),
    child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 30.w, vertical: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Doctor\'s Schedule",
            style: StyleManager.font30Bold_Lobster
                .copyWith(color: ColorsHelper.blueLight),
          ),
          SizedBox(
            height: 50.h,
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) =>
                      ScheduleColumn(
                          object: cubit.working_hours[index]),
                  separatorBuilder: (context, index) =>
                      SizedBox(
                        height: 20.h,
                      ),
                  itemCount: cubit.working_hours.length))
        ],
      ),
    ),
  );
}

Widget ScheduleColumn({required ScheduleModel object}) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          width: 120,
          decoration: BoxDecoration(
              color: ColorsHelper.blueDark,
              borderRadius: BorderRadius.circular(50)),
          child: Center(
            child: Text(
              object.day,
              style: StyleManager.font17Lobster,
            ),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        SizedBox(
          child: ListView.separated(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
                var spl_times = TimeHelper.splitTime(time: object.times[index]);
                return Row(
                  children: [
                    Text(
                        "From : ",
                        style:StyleManager.font17Lobster.copyWith(
                            color: Colors.grey
                        )
                    ),
                    Container(
                      height: 50,
                      width: 75,
                      decoration: BoxDecoration(
                          color: ColorsHelper.blueLight,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "${spl_times[0]}",
                          style: StyleManager.font17Lobster,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50.w,
                    ),
                    Text(
                      "To : ",
                      style: StyleManager.font17Lobster.copyWith(
                          color: Colors.grey
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 75,
                      decoration: BoxDecoration(
                          color: ColorsHelper.blueLight,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "${spl_times[1]}",
                          style: StyleManager.font17Lobster,
                        ),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                height: 25.h,
              ),
              itemCount: object.times.length),
        ),
        if(object.times.isEmpty) Center(child: Text("There is NO Times For That Day",
            style: StyleManager.fontregular14)),

        SizedBox(
          height: 20.h,
        ),
      ],
    ),
  );
}

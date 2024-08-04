import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/style_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/elevated_button.dart';
import '../../../../core/widgets/text_from_field.dart';
import '../../domain/constants/constants.dart';

Widget AlertDialouge({
  var myctx,
}) {
  int counter = 1;
  String Selected_Day = "";
  bool Timerappear = false;
  bool DateAppear = false;
  TextEditingController Startcontroller = TextEditingController();
  TextEditingController Endcontroller = TextEditingController();
  return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.w),
      titlePadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      elevation: 20,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white70,
      title: Text(
        "Add Working Hours",
        style: StyleManager.font30Bold_Lobster
            .copyWith(color: ColorsHelper.blueDark),
      ),
      content: Stack(
        children: [
          Container(
            height: 400.h,
            width: 1010.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: Days.map((item) => Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: CustomElevatedButton(
                          onPressed: () {
                            setState(() {
                              Selected_Day = item;
                            });
                          },
                          label: item,
                          minimumSizeH: 50,
                          minimumSizeW: 140.w,
                          buttonColor: (Selected_Day == item)
                              ? ColorsHelper.onPressedColor
                              : ColorsHelper.blueDark,
                        ),
                      )).toList(),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  children: [
                    Text(
                      "Times",
                      style: StyleManager.font30Bold_Lobster.copyWith(
                          color: ColorsHelper.blueDark, fontSize: 20.sp),
                    ),
                    SizedBox(
                      width: 100.w,
                    ),
                    CustomElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (counter < 6) counter++;
                        });
                      },
                      label: 'Add Time',
                      buttonColor: ColorsHelper.blueDark,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    CustomElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (counter > 1) counter--;
                        });
                      },
                      label: 'Remove Time',
                      buttonColor: ColorsHelper.blueDark,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    CustomElevatedButton(
                      onPressed: () {
                        setState(() {
                          Timerappear = false;
                          DateAppear = !DateAppear;
                        });
                      },
                      label: 'Add Vacation',
                      buttonColor: ColorsHelper.blueDark,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) =>
                          TimesRow(context, onTimeFieldTap: () {
                            setState(() {
                              Timerappear = !Timerappear;
                            });
                          }, Startcontroller, Endcontroller),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 15.h,
                          ),
                      itemCount: counter),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 500.w, top: 30.h),
            child: SizedBox(
                height: 500.h,
                width: 500.w,
                child: (Timerappear)
                    ? TimePickerDialog(
                        initialTime: TimeOfDay.now(),
                        cancelText: '',
                      )
                    : (DateAppear)
                        ? DatePickerDialog(
                            firstDate: DateTime.now(), lastDate: DateTime(2090))
                        : SizedBox()),
          )
        ],
      ),
      actions: [
        CustomElevatedButton(
          onPressed: () {
            Navigator.pop(myctx);
          },
          label: 'Cancel',
          buttonColor: ColorsHelper.blueDark,
        ),
        CustomElevatedButton(
          onPressed: () {},
          label: 'Submit',
          buttonColor: ColorsHelper.blueDark,
        )
      ],
    );
  });
}

/*Widget workDays({required context}) {
  AddAccountCubit cubit=AddAccountCubit.get(context);
  return  Container(
    height: 400.h,
    width: 1010.w,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: Days.map((item) => Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: CustomElevatedButton(
              onPressed: () {},
              label: item,
              minimumSizeH: 50,
              minimumSizeW: 140.w,
              buttonColor: ColorsHelper.blueDark,
            ),
          )).toList(),
        ),
        SizedBox(
          height: 40.h,
        ),
        Row(
          children: [
            Text(
              "Times",
              style: StyleManager.font30Bold_Lobster
                  .copyWith(color: ColorsHelper.blueDark, fontSize: 20.sp),
            ),
            SizedBox(width: 200.w,),
            CustomElevatedButton(onPressed: () {
            }, label: 'Add Time',
              buttonColor: ColorsHelper.blueDark,),
            SizedBox(width: 5.w,),
            CustomElevatedButton(onPressed: () {
            }, label: 'Remove Time',
              buttonColor: ColorsHelper.blueDark,),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context,index)=>TimesRow(cubit: cubit,),
              separatorBuilder: (context,index)=>SizedBox(height: 15.h,),
              itemCount: 1),
        )
      ],
    ),
  );
}*/

Widget TimesRow(context, Startcontroller, Endcontroller,
    {required onTimeFieldTap}) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: 200.w,
              child: TextFild_def(
                onTap: () {
                  onTimeFieldTap();
                },
                controller: Startcontroller,
                hintText: "Start Time",
                CursorColor: ColorsHelper.blueLight,
                fillColor: ColorsHelper.blueLightest,
                borderStyle: StyleManager.FieldBorder_round40,
              )),
          SizedBox(
            width: 30.w,
          ),
          SizedBox(
            width: 200.w,
            child: TextFild_def(
              onTap: () {
                onTimeFieldTap();
              },
              hintText: "End Time",
              controller: Endcontroller,
              CursorColor: ColorsHelper.blueLight,
              fillColor: ColorsHelper.blueLightest,
              borderStyle: StyleManager.FieldBorder_round40,
            ),
          ),
          SizedBox(
            width: 30.w,
          ),
        ],
      ),
    ],
  );
}

/*Container(
height: 50,
width: 140,
decoration: BoxDecoration(
color: ColorsHelper.blueDark,
borderRadius: BorderRadius.circular(50)),
child: Center(
child: Text(
item,
style: StyleManager.fontRegular20,
),
),
)*/

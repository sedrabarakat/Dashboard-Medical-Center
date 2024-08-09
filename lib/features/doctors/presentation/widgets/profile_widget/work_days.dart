import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/style_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/time_helper.dart';
import '../../../../../core/widgets/elevated_button.dart';
import '../../../../../core/widgets/text_from_field.dart';
import '../../../../create_account/domain/constants/constants.dart';
import '../../../domain/constants/const.dart';

Widget AlertDialouge({
  required VoidCallback Submit_onPressed,
}) {
  int counter = 1;
  String? Selected_Day;
  bool DateAppear = false;

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
                workDaysButton(
                    Selected_Day: Selected_Day,
                    onPressed: (item) {
                      setState(() {
                        Selected_Day = item;
                      });
                    }),
                SizedBox(
                  height: 40.h,
                ),
                TimesButtons(Add_onPressed: () {
                  setState(() {
                    if (counter < 6) counter++;
                  });
                }, Remove_onPressed: () {
                  setState(() {
                    if (counter > 0) {
                      counter--;
                    }
                  });
                }, Vication_onPressed: () {
                  setState(() {
                    DateAppear = !DateAppear;
                  });
                }),
                SizedBox(
                  height: 30.h,
                ),
                if (Selected_Day != null)
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) =>
                            TimesRow(context, Selected_Day, index),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 15.h,
                            ),
                        itemCount: counter),
                  ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 510.w, top: 30.h),
            child: SizedBox(
                height: 500.h,
                width: 500.w,
                child: (DateAppear)
                    ? DatePickerDialog(
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2090),
                      )
                    : SizedBox()),
          )
        ],
      ),
      actions: [
        CustomElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          label: 'Cancel',
          buttonColor: ColorsHelper.blueDark,
        ),
        CustomElevatedButton(
          onPressed: () {
            Submit_onPressed();
            Navigator.pop(context);
          },
          label: 'Submit',
          buttonColor: ColorsHelper.blueDark,
        )
      ],
    );
  });
}

Widget workDaysButton({required Selected_Day, required onPressed}) {
  return Row(
    children: Days.map((item) => Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: CustomElevatedButton(
            onPressed: () {
              onPressed(item);
            },
            label: item,
            minimumSizeH: 50,
            minimumSizeW: 140.w,
            buttonColor: (Selected_Day == item)
                ? ColorsHelper.onPressedColor
                : ColorsHelper.blueDark,
          ),
        )).toList(),
  );
}

Widget TimesButtons(
    {required Add_onPressed,
    required Remove_onPressed,
    required Vication_onPressed}) {
  return Row(
    children: [
      Text(
        "Times",
        style: StyleManager.font30Bold_Lobster
            .copyWith(color: ColorsHelper.blueDark, fontSize: 20.sp),
      ),
      SizedBox(
        width: 100.w,
      ),
      CustomElevatedButton(
        onPressed: () {
          Add_onPressed();
        },
        label: 'Add Time',
        buttonColor: ColorsHelper.blueDark,
      ),
      SizedBox(
        width: 5.w,
      ),
      CustomElevatedButton(
        onPressed: () {
          Remove_onPressed();
        },
        label: 'Remove Time',
        buttonColor: ColorsHelper.blueDark,
      ),
      SizedBox(
        width: 5.w,
      ),
      CustomElevatedButton(
        onPressed: () {
          Vication_onPressed();
        },
        label: 'Add Vacation',
        buttonColor: ColorsHelper.blueDark,
      ),
    ],
  );
}

void addItemToDay(String day, dynamic item) {
  if (Work_Days.containsKey(day)) {
    Work_Days[day].add(item);
  } else {
    print("Invalid day: $day");
  }
}

Widget TimesRow(context, selectedDay, index) {
  TextEditingController Startcontroller = TextEditingController();
  TextEditingController Endcontroller = TextEditingController();
  if (index < Work_Days[selectedDay].length) {
    var times = TimeHelper.splitTime(time: Work_Days[selectedDay][index]);
    Startcontroller.text = times[0];
    Endcontroller.text = times[1];
  }

  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: 200.w,
              child: TextFild_def(
                onTap: () {
                  showTimePicker(context: context, initialTime: TimeOfDay.now())
                      .then((time) {
                    if (time != null) {
                      Startcontroller.text =
                          TimeHelper.Convert_Time_HM(Time: time);
                    }
                  });
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
                showTimePicker(context: context, initialTime: TimeOfDay.now())
                    .then((time) {
                  if (time != null) {
                    Endcontroller.text = TimeHelper.Convert_Time_HM(Time: time);
                  }
                });
              },
              onFieldSubmitted: (value) {
                Work_Days.forEach((day, time) {
                  if (day == selectedDay) {
                    //Work_Days.add()
                  }
                });
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
          IconButton(
            onPressed: () {
              if (Startcontroller.text.isNotEmpty &&
                  Endcontroller.text.isNotEmpty) {
                addItemToDay(selectedDay,
                    "${Startcontroller.text}-${Endcontroller.text}");
              }
            },
            icon: const Icon(Icons.add_circle_outline),
          ),
          SizedBox(
            width: 10.w,
          ),
          IconButton(
              onPressed: () {
                Startcontroller.clear();
                Endcontroller.clear();
                if (index < Work_Days[selectedDay].length) {
                  Work_Days[selectedDay].removeAt(index);
                }
              },
              icon: Icon(
                Icons.cancel_outlined,
                color: ColorsHelper.error,
              ))
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

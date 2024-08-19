import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../cubit/home_cubit.dart';

class GenderPieChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit=HomeCubit.get(context);
    return SfCircularChart(
      title: ChartTitle(text: 'Gender Distribution'),
      legend: Legend(isVisible: true),
      series: <PieSeries<GenderData, String>>[
        PieSeries<GenderData, String>(
          dataSource: getGenderData(context),
          xValueMapper: (GenderData data, _) => data.gender,
          yValueMapper: (GenderData data, _) => data.count,
          pointColorMapper: (GenderData data, _) => data.color,
          dataLabelSettings: DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }

  List<GenderData> getGenderData(context) {
    HomeCubit cubit=HomeCubit.get(context);
    var maleNum=cubit.genderList[0].count;
    var femaleNum=cubit.genderList[1].count;
    return [
      GenderData('Male', maleNum,Colors.blue),
      GenderData('Female', femaleNum,Colors.indigoAccent.shade700),

    ];
  }
}

class GenderData {
  GenderData(this.gender, this.count,this.color);
  final String gender;
  final int count;
  final Color color;
}
import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GenderPieChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      title: ChartTitle(text: 'Gender Distribution'),
      legend: Legend(isVisible: true),
      series: <PieSeries<GenderData, String>>[
        PieSeries<GenderData, String>(
          dataSource: getGenderData(),
          xValueMapper: (GenderData data, _) => data.gender,
          yValueMapper: (GenderData data, _) => data.count,
          pointColorMapper: (GenderData data, _) => data.color,
          dataLabelSettings: DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }

  List<GenderData> getGenderData() {
    return [
      GenderData('Male', 60,Colors.blue),
      GenderData('Female', 40,Colors.indigoAccent.shade700),

    ];
  }
}

class GenderData {
  GenderData(this.gender, this.count,this.color);
  final String gender;
  final int count;
  final Color color;
}
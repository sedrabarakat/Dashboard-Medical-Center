import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class StackedColumnChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: DateTimeAxis(),
      primaryYAxis: NumericAxis(),
      
      series: <CartesianSeries<ChartData,DateTime>>[
        StackedColumnSeries<ChartData, DateTime>(
          color: ColorsHelper.primary,
          dataSource: getChartData(),
          xValueMapper: (ChartData data, _) => data.date,
          yValueMapper: (ChartData data, _) => data.count,
        ),
      ],
    );
  }

  List<ChartData> getChartData() {
    return [
      ChartData(DateTime(2024, 8, 18), 100),
      ChartData(DateTime(2024, 10, 10), 10),
      ChartData(DateTime(2024, 12, 24), 20),
      ChartData(DateTime(2024, 11, 23), 30),
    ];
  }
}

class ChartData {
  ChartData(this.date, this.count);
  final DateTime date;
  final int count;
}
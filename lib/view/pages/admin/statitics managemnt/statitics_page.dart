import 'package:flutter/material.dart';
import 'package:foodies_restaurent/constants/colors.dart';
import 'package:foodies_restaurent/constants/sized_box.dart';
import 'package:foodies_restaurent/constants/style.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatiticsManagementPage extends StatelessWidget {
  const StatiticsManagementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        backgroundColor: kwhite,
        title: Text(
          "Statitics Management Page",
          style: googleNormalFont,
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          sizeH40,
          SizedBox(
            height: 500,
            child: SfCartesianChart(
              title: ChartTitle(text: "weekly Sales report"),
              primaryXAxis: CategoryAxis(title: AxisTitle(text: "")),
              primaryYAxis: CategoryAxis(
                title: AxisTitle(text: "Sales in rupees (K)"),
              ),
              series: <ChartSeries>[
                ColumnSeries<SalesData, String>(
                    dataSource: getWeeklyData(),
                    xValueMapper: (SalesData sales, _) => sales.x,
                    yValueMapper: (SalesData sales, _) => sales.y,
                    color: Colors.deepOrangeAccent,
                    dataLabelSettings: const DataLabelSettings(
                        color: Colors.amber,
                        isVisible: true,
                        labelPosition: ChartDataLabelPosition.inside)),
              ],
            ),
          ),
          sizeH40,
          SizedBox(
            height: 500,
            child: SfCartesianChart(
              title: ChartTitle(text: "Montly Sales report"),
              primaryXAxis: CategoryAxis(title: AxisTitle(text: "Months")),
              primaryYAxis: CategoryAxis(
                title: AxisTitle(text: "Sales in rupees (K)"),
              ),
              series: <ChartSeries>[
                ColumnSeries<SalesData, String>(
                    dataSource: getMonthlyData(),
                    xValueMapper: (SalesData sales, _) => sales.x,
                    yValueMapper: (SalesData sales, _) => sales.y,
                    color: kgreen,
                    dataLabelSettings: const DataLabelSettings(
                        color: Colors.amber,
                        isVisible: true,
                        labelPosition: ChartDataLabelPosition.inside)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SalesData {
  String x;
  double y;
  SalesData(this.x, this.y);
}

dynamic getWeeklyData() {
  List<SalesData> columndata = <SalesData>[
    SalesData("week 1", 40),
    SalesData("week 2", 50),
    SalesData("Week 3", 80),
    SalesData("Week 4", 100),
  ];
  return columndata;
}

dynamic getMonthlyData() {
  List<SalesData> columndata = <SalesData>[
    SalesData("Jan", 40),
    SalesData("Feb", 50),
    SalesData("Mar", 80),
    SalesData("april", 100),
  ];
  return columndata;
}

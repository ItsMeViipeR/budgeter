import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

int touchedIndex = -1;

Widget getTitlesWeek(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('M', style: style);
      break;
    case 1:
      text = const Text('T', style: style);
      break;
    case 2:
      text = const Text('W', style: style);
      break;
    case 3:
      text = const Text('T', style: style);
      break;
    case 4:
      text = const Text('F', style: style);
      break;
    case 5:
      text = const Text('S', style: style);
      break;
    case 6:
      text = const Text('S', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 16,
    child: text,
  );
}

Widget getTitlesMonth(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('Jan', style: style);
      break;
    case 1:
      text = const Text('Feb', style: style);
      break;
    case 2:
      text = const Text('Mar', style: style);
      break;
    case 3:
      text = const Text('Apr', style: style);
      break;
    case 4:
      text = const Text('May', style: style);
      break;
    case 5:
      text = const Text('Jun', style: style);
      break;
    case 6:
      text = const Text('Jul', style: style);
      break;
    case 7:
      text = const Text('Aug', style: style);
      break;
    case 8:
      text = const Text('Sep', style: style);
      break;
    case 9:
      text = const Text('Oct', style: style);
      break;
    case 10:
      text = const Text('Nov', style: style);
      break;
    case 11:
      text = const Text('Dec', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 16,
    child: text,
  );
}

BarChartGroupData makeGroupData(
  int x,
  double y, {
  bool isTouched = false,
  Color? barColor,
  double width = 11,
  List<int> showTooltips = const [],
}) {
  barColor ??= Colors.red;
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(
        toY: isTouched ? y + 1 : y,
        color: isTouched ? Colors.redAccent : barColor,
        width: width,
        borderSide: isTouched
            ? const BorderSide(color: Colors.redAccent)
            : const BorderSide(color: Colors.white, width: 0),
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          toY: 20,
          color: Colors.grey,
        ),
      ),
    ],
    showingTooltipIndicators: showTooltips,
  );
}

List<BarChartGroupData> showingGroupsWeek() => List.generate(7, (i) {
      switch (i) {
        case 0:
          return makeGroupData(0, 5, isTouched: i == touchedIndex);
        case 1:
          return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
        case 2:
          return makeGroupData(2, 5, isTouched: i == touchedIndex);
        case 3:
          return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
        case 4:
          return makeGroupData(4, 9, isTouched: i == touchedIndex);
        case 5:
          return makeGroupData(5, 11.5, isTouched: i == touchedIndex);
        case 6:
          return makeGroupData(6, 6.5, isTouched: i == touchedIndex);
        default:
          return throw Error();
      }
    });

List<BarChartGroupData> showingGroupsMonth() => List.generate(12, (i) {
      switch (i) {
        case 0:
          return makeGroupData(0, 5, isTouched: i == touchedIndex);
        case 1:
          return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
        case 2:
          return makeGroupData(2, 5, isTouched: i == touchedIndex);
        case 3:
          return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
        case 4:
          return makeGroupData(4, 9, isTouched: i == touchedIndex);
        case 5:
          return makeGroupData(5, 11.5, isTouched: i == touchedIndex);
        case 6:
          return makeGroupData(6, 6.5, isTouched: i == touchedIndex);
        case 7:
          return makeGroupData(7, 5, isTouched: i == touchedIndex);
        case 8:
          return makeGroupData(8, 6.5, isTouched: i == touchedIndex);
        case 9:
          return makeGroupData(9, 5, isTouched: i == touchedIndex);
        case 10:
          return makeGroupData(10, 7.5, isTouched: i == touchedIndex);
        case 11:
          return makeGroupData(11, 9, isTouched: i == touchedIndex);
        default:
          return throw Error();
      }
    });

BarChart weeklyBarChart() {
  return BarChart(
    BarChartData(
      barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
              getTooltipColor: (_) => Colors.grey,
              tooltipHorizontalAlignment: FLHorizontalAlignment.right,
              tooltipMargin: -10,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                String weekDay;

                switch (group.x) {
                  case 0:
                    weekDay = 'Monday';
                    break;
                  case 1:
                    weekDay = 'Tuesday';
                    break;
                  case 2:
                    weekDay = 'Wednesday';
                    break;
                  case 3:
                    weekDay = 'Thursday';
                    break;
                  case 4:
                    weekDay = 'Friday';
                    break;
                  case 5:
                    weekDay = 'Saturday';
                    break;
                  case 6:
                    weekDay = 'Sunday';
                    break;
                  default:
                    throw Error();
                }

                return BarTooltipItem(
                  '$weekDay\n',
                  const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: (rod.toY - 1).toString(),
                      style: const TextStyle(
                        color: Colors.white, //widget.touchedBarColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                );
              }),
          touchCallback: (FlTouchEvent event, barTouchResponse) {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          }),
      titlesData: const FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitlesWeek,
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroupsWeek(),
      gridData: const FlGridData(show: false),
    ),
  );
}

BarChart monthlyBarChart() {
  return BarChart(
    BarChartData(
      barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
              getTooltipColor: (_) => Colors.grey,
              tooltipHorizontalAlignment: FLHorizontalAlignment.right,
              tooltipMargin: -10,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                String month;

                switch (group.x) {
                  case 0:
                    month = 'January';
                    break;
                  case 1:
                    month = 'February';
                    break;
                  case 2:
                    month = 'March';
                    break;
                  case 3:
                    month = 'April';
                    break;
                  case 4:
                    month = 'May';
                    break;
                  case 5:
                    month = 'June';
                    break;
                  case 6:
                    month = 'July';
                    break;
                  case 7:
                    month = 'August';
                    break;
                  case 8:
                    month = 'September';
                    break;
                  case 9:
                    month = 'October';
                    break;
                  case 10:
                    month = 'November';
                    break;
                  case 11:
                    month = 'December';
                    break;
                  default:
                    throw Error();
                }

                return BarTooltipItem(
                  '$month\n',
                  const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: (rod.toY - 1).toString(),
                      style: const TextStyle(
                        color: Colors.white, //widget.touchedBarColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                );
              }),
          touchCallback: (FlTouchEvent event, barTouchResponse) {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          }),
      titlesData: const FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitlesMonth,
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroupsMonth(),
      gridData: const FlGridData(show: false),
    ),
  );
}

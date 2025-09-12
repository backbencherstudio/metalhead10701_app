import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/theme/theme_extension/app_colors.dart';

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({super.key});

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.30,
          child: Padding(
            padding: EdgeInsets.only(
              right: 18.w,
              left: 12.w,
              top: 24.h,
              bottom: 12.h,
            ),
            child: LineChart(
              avgData(),
            ),
          ),
        ),
        AspectRatio(
          aspectRatio: 1.30,
          child: Padding(
            padding: EdgeInsets.only(
              right: 18.w,
              left: 12.w,
              top: 24.h,
              bottom: 12.h,
            ),
            child: LineChart(
              mainData(),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final style = Theme.of(context).textTheme.labelMedium?.copyWith(
      color: AppColors.graphTextColor
    );
    //CHANGE
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('Sun', style: style);
        break;
      case 2:
        text = Text('Mon', style: style);
        break;
      case 4:
        text = Text('Tue', style: style);
        break;
      case 6:
        text = Text('Wed', style: style);
        break;
      case 8:
        text = Text('Thu', style: style);
        break;
      case 10:
        text = Text('Fri', style: style);
        break;
      case 12:
        text = Text('Sat', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }

    return SideTitleWidget(
      meta: meta,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    final style = Theme.of(context).textTheme.labelMedium?.copyWith(
        color: AppColors.graphTextColor
    );
    //CHANGE
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10';
        break;
      case 2:
        text = '50';
        break;
      case 3:
        text = '100';
        break;
      case 4:
        text = '150';
        break;
      case 5:
        text = '500';
        break;
      case 6:
        text = '1K+';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: true),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        drawHorizontalLine: false,
        horizontalInterval: 1,
        verticalInterval: 2,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: AppColors.bgColor1,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: AppColors.bgColor2,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 12,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2, 2),
            FlSpot(4, 5),
            FlSpot(6, 3.1),
            FlSpot(8, 4),
            FlSpot(10, 3),
            FlSpot(12, 0),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [AppColors.curve1Color, AppColors.curve1Color],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [AppColors.curve1Color, AppColors.onPrimary]
                  .map((color) => color.withValues(alpha: 0.1))
                  .toList(),
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: true),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        // getDrawingVerticalLine: (value) {
        //   return const FlLine(
        //     color: Color(0xff37434d),
        //     strokeWidth: 1,
        //   );
        // },
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: AppColors.graphTextColor,
            strokeWidth: 1,
            dashArray: [4]
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 12,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2, 0),
            FlSpot(4, 2),
            FlSpot(6, 3),
            FlSpot(8, 0),
            FlSpot(10, 2),
            FlSpot(12, 2),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              AppColors.graphTextColor,
              AppColors.graphTextColor
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          // belowBarData: BarAreaData(
          //   show: false,
          //   gradient: LinearGradient(
          //     colors: [
          //       ColorTween(begin: gradientColors[0], end: gradientColors[1])
          //           .lerp(0.2)!
          //           .withValues(alpha: 0.1),
          //       ColorTween(begin: gradientColors[0], end: gradientColors[1])
          //           .lerp(0.2)!
          //           .withValues(alpha: 0.1),
          //     ],
          //   ),
          // ),
        ),
      ],
    );
  }
}
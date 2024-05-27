import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

  List<Color> gradientColors = [
    Colors.blue,
    Colors.purple
  ];
LineChartData activityData() {
    return LineChartData(
      gridData: const FlGridData(
        show: false,
        drawVerticalLine: true,
      ),
      titlesData: const FlTitlesData(
        show: false,
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false, 
          ),
        ),
      ),
      borderData: FlBorderData(
          show: false,
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots:  [
            const FlSpot(0, 3),
            const FlSpot(2.6, 2),
            const FlSpot(4.9, 5),
            const FlSpot(6.8, 3.1),
            const FlSpot(8, 4),
            const FlSpot(9.5, 3),
            const FlSpot(11, 4),
            
          ],
          isCurved: false,
          color: Colors.blue,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            color: Colors.blue.withOpacity(0.3),
          ),
        ),
      ],
    );
  }
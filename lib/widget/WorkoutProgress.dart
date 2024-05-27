import 'package:menu_navigator/theme/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

List<Color> gradientColors = [primary];

LineChartData workoutProgressData() {
  return LineChartData(
    gridData: FlGridData(
      show: true,
      getDrawingVerticalLine: (value) {
      return const FlLine(
          color: Colors.transparent,
          strokeWidth: 0.1,
        );
      }, 
    getDrawingHorizontalLine: (value) {
      return const FlLine(
          color: Color(0xff37434d),
          strokeWidth: 0.1,
        );
      }
    ),   
    titlesData: FlTitlesData(
      show: true,
      topTitles: const AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value,style){
            switch(value.toInt()){
              case 1:
                return const Text('Lun',style: TextStyle(fontSize: 10),);
              case 2:
                return const Text('Mar',style: TextStyle(fontSize: 10),);
              case 3:
                return const Text('Mie',style: TextStyle(fontSize: 10),);
              case 4:
                return const Text('Jue',style: TextStyle(fontSize: 10),);
              case 5:
                return const Text('Vie',style: TextStyle(fontSize: 10),);
              case 6:
                return const Text('Sab',style: TextStyle(fontSize: 10),);
              case 7:
                return const Text('Dom',style: TextStyle(fontSize: 10),);
              default:
                return const Text('');
            }
          },
        ), 
      ),
  
      leftTitles: const AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
          reservedSize: 28,
          //margin: 12,
        ),
      ),
      
      rightTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value,style){
            switch(value.toInt()){
              case 1:
                return const Text('0%',style: TextStyle(fontSize: 10),);
              case 2:
                return const Text('20%',style: TextStyle(fontSize: 10),);
              case 3:
                return const Text('40%',style: TextStyle(fontSize: 10),);
              case 4:
                return const Text('60%',style: TextStyle(fontSize: 10),);
              case 5:
                return const Text('80%',style: TextStyle(fontSize: 10),);
              case 6:
                return const Text('100%',style: TextStyle(fontSize: 10),);
              default:
                return const Text('');
            }
          },
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
        spots: [
          const FlSpot(0, 3),
          const FlSpot(2.6, 2),
          const FlSpot(4.9, 5),
          const FlSpot(6.8, 3.1),
          const FlSpot(8, 4),
          const FlSpot(9.5, 3),
          const FlSpot(11, 4),
        ],
        isCurved: true,
        color: primary,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(
          show: false,
        ),
      ),
      LineChartBarData(
        spots: [
          const FlSpot(0, 1.5),
          const FlSpot(2.5, 1),
          const FlSpot(3, 5),
          const FlSpot(5, 2),
          const FlSpot(7, 4),
          const FlSpot(8, 3),
          const FlSpot(11, 4),
        ],
        isCurved: true,
        color: thirdColor.withOpacity(0.5),
        barWidth: 1,
        isStrokeCapRound: true,
        dotData: const FlDotData(
          show: false,
        ),
      ),
    ],
  );
}
// widgets/step_graph.dart

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StepGraph extends StatelessWidget {
  final List<int> steps = [4200, 5300, 6100, 4800, 7100, 6300, 8000];
  final List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        maxY: 10000,
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, interval: 2000),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, _) {
                if (value.toInt() < days.length) {
                  return Text(days[value.toInt()]);
                }
                return const Text('');
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        barGroups: List.generate(7, (index) {
          return BarChartGroupData(x: index, barRods: [
            BarChartRodData(
              toY: steps[index].toDouble(),
              color: Colors.teal,
              width: 16,
              borderRadius: BorderRadius.circular(4),
            )
          ]);
        }),
      ),
    );
  }
}

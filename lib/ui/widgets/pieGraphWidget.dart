import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'pieLegendWidget.dart';

class PieGraph extends StatefulWidget {
  const PieGraph({super.key});

  @override
  State<StatefulWidget> createState() => PieGraphState();
}

class PieGraphState extends State {
  int touchedIndex = -1;

  final yachtColor = Color(0xff0293ee);
  final propColor = Color(0xfff8b250);
  final carColor = Color(0xff845bef);
  final boatColor = Color(0xff13d38e);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        elevation: 0,
        shadowColor: Colors.transparent,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  "Percentage of ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff505050),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                PieLegend(
                  color: Color(0xff0293ee),
                  text: 'Yacht',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                PieLegend(
                  color: Color(0xfff8b250),
                  text: 'Properties',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                PieLegend(
                  color: Color(0xff845bef),
                  text: 'Cars',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                PieLegend(
                  color: Color(0xff13d38e),
                  text: 'Boats',
                  isSquare: true,
                ),
                SizedBox(
                  height: 18,
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: AspectRatio(
                  aspectRatio: 1,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Total"),
                      ),
                      PieChart(
                        PieChartData(
                          pieTouchData: PieTouchData(
                            touchCallback:
                                (FlTouchEvent event, pieTouchResponse) {
                              setState(() {
                                if (!event.isInterestedForInteractions ||
                                    pieTouchResponse == null ||
                                    pieTouchResponse.touchedSection == null) {
                                  touchedIndex = -1;
                                  return;
                                }
                                touchedIndex = pieTouchResponse
                                    .touchedSection!.touchedSectionIndex;
                              });
                            },
                          ),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 5,
                          centerSpaceRadius: 60,
                          sections: showingSections(),
                        ),
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              width: 28,
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 50.0 : 40.0;
      final yachtText = isTouched ? "value" : "";
      final propText = isTouched ? "value" : "";
      final carText = isTouched ? "value" : "";
      final boatText = isTouched ? "value" : "";
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 40,
            title: yachtText,
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.normal,
              color: const Color(0xffffffff),
            ),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 30,
            title: propText,
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 15,
            title: carText,
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 15,
            title: boatText,
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        default:
          throw Error();
      }
    });
  }
}

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:tienda_login/pages/Inicio.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tienda_login/pages/Inventario.dart';
import 'package:tienda_login/pages/Tareas.dart';

class Estadisticas extends StatelessWidget {
  final List<Widget> screens = [Inicio(), Inventario(), Tareas()];

  // Datos para el gráfico de barras
  final List<ChartSampleData> chartData = <ChartSampleData>[
    ChartSampleData(x: 'Ene', y: 0.541),
    ChartSampleData(x: 'Feb', y: 0.818),
    ChartSampleData(x: 'Mar', y: 1.51),
    ChartSampleData(x: 'Abril', y: 1.302),
    ChartSampleData(x: 'Mayo', y: 2.017),
    ChartSampleData(x: 'Jun', y: 1.683),
  ];

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);

    return MaterialApp(
      home: MediaQuery(
        data: query.copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            title: Text(
              "Estadisticas",
              style: TextStyle(
                fontFamily: 'Bebas Neue',
                color: Color(0xFF1D1B45),
                fontSize: 38,
              ),
            ),
          ),
          body: Center(
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          "Este mes",
                          style: TextStyle(
                              fontFamily: 'Bebas Neue',
                              fontSize: 31,
                              color: Color(0xFF1D1B45)),
                        ),
                      ),
                      SizedBox(height: 20),
                      // Agregar el gráfico de barras aquí
                      Container(
                        width: 620,
                        height: 500,
                        child: BarChart(
                          BarChartData(
                            titlesData: FlTitlesData(
                              bottomTitles: SideTitles(
                                showTitles: true,
                                getTextStyles: (context, value) => TextStyle(
                                  color: const Color(0xff37434d),
                                  fontWeight: FontWeight.bold,
                                ),
                                margin: 16,
                                getTitles: (double value) {
                                  if (value.toInt() >= 0 &&
                                      value.toInt() < chartData.length) {
                                    return chartData[value.toInt()].x;
                                  }
                                  return '';
                                },
                              ),
                              leftTitles: SideTitles(
                                showTitles: true,
                                getTextStyles: (context, value) => TextStyle(
                                  color: const Color(0xff37434d),
                                  fontWeight: FontWeight.bold,
                                ),
                                margin: 16,
                                reservedSize: 30,
                                interval: 1,
                              ),
                            ),
                            borderData: FlBorderData(
                              show: true,
                              border: Border.all(
                                color: const Color(0xff37434d),
                                width: 1,
                              ),
                            ),
                            barGroups: chartData
                                .asMap()
                                .entries
                                .map(
                                  (entry) => BarChartGroupData(
                                    x: entry.key,
                                    barRods: [
                                      BarChartRodData(
                                        y: entry.value.y,
                                        colors: [Colors.yellow],
                                      ),
                                    ],
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            iconSize: 46,
            currentIndex: 0,
            onTap: (index) {
              if (index == 0) {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType
                        .fade, // Cambia el tipo de transición según tu preferencia
                    child: screens[0],
                  ),
                );
              } else if (index == 2) {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType
                        .fade, // Cambia el tipo de transición según tu preferencia
                    child: screens[1],
                  ),
                );
              } else if (index == 3) {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType
                        .fade, // Cambia el tipo de transición según tu preferencia
                    child: screens[2],
                  ),
                );
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Icon(
                    Icons.home_filled,
                    color: Colors.grey,
                  ),
                ),
                label: ' ',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.leaderboard,
                  color: Color(0xFF1D1B45),
                ),
                label: ' ',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.inventory),
                label: 'Favoritos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Carrito',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: 'Perfil',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartSampleData {
  final String x;
  final double y;

  ChartSampleData({required this.x, required this.y});
}

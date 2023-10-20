import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Importa flutter_svg
import 'package:get/get.dart';
import 'package:tienda_login/pages/Estadisticas2.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tienda_login/pages/Inicio.dart';
import 'package:tienda_login/pages/Inventario.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Tareas extends StatefulWidget {
  @override
  _TareasState createState() => _TareasState();
}

class _TareasState extends State<Tareas> {
  List<Appointment> _appointments = [];

  String _selectedDate = '';
  TextEditingController _eventController = TextEditingController();
  bool _isVisible = false;

  @override
  void initState() {
    _appointments = getAppointments();
    super.initState();
  }

  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);

    // Inicializa el idioma español para el calendario
    const Locale('es', 'ES');

    //Lista de todas las rutas
    final List<Widget> screens = [Inicio(), Estadisticas(), Inventario()];

    //Calendario
    //especificar el formato en el que se muestra el calendario. En este caso,
    //se ha establecido en month, lo que significa que el calendario se mostrará
    //en formato mensual por defecto. Sin embargo, puedes cambiar esto a otros
    //formatos admitidos como CalendarFormat.twoWeeks o CalendarFormat.week.

    return MaterialApp(
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: [
          const Locale('en', 'US'), // Inglés
          const Locale('es', 'ES'), // Español
        ],
        locale: Locale('es', 'ES'), // Establece el idioma español
        home: MediaQuery(
          data: query.copyWith(textScaleFactor: 1.0),
          child: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              title: Container(
                margin: EdgeInsets.fromLTRB(90, 20, 0, 0),
                child: Center(
                  child: Text(
                    "Tareas",
                    style: TextStyle(
                      fontFamily: 'Bebas Neue',
                      color: Color(0xFF1D1B45),
                      fontSize: 38,
                    ),
                  ),
                ),
              ),
              actions: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: IconButton(
                    onPressed: () {
                      // Acción a realizar cuando se presiona el segundo IconButton
                    },
                    icon: Icon(
                      Icons.notifications_none,
                      size: 46,
                    ),
                    color: Color(0xFF1D1B45),
                  ),
                ),
              ],
            ),
            //Calendario
            body: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Alinea los widgets a la izquierda
              children: <Widget>[
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(
                        "Hoy",
                        style: TextStyle(
                            color: Color(0xFF1D1B45),
                            fontFamily: 'Noto Sans',
                            fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(1.0),
                      child: IconButton(
                        icon: Icon(
                            _isVisible ? Icons.expand_more : Icons.expand_less,
                            size: 43),
                        onPressed: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 209.0),
                      child: IconButton(
                          icon: Icon(
                            Icons.add_circle_outline_outlined,
                            size: 38,
                          ), // Aquí puedes personalizar el icono
                          onPressed: () {
                            // Acción a realizar cuando se presiona este IconButton
                            _showEventDialog(context);
                          }),
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    if (_isVisible)
                      Container(
                        padding: EdgeInsets.only(
                          left: 20.0,
                        ),
                        height: 222,
                        width: 360,
                        child: SfCalendar(
                          view: CalendarView.month,
                          cellBorderColor: Color.fromARGB(255, 155, 159, 161),
                          selectionDecoration: BoxDecoration(
                            color: Colors.transparent,
                            border:
                                Border.all(color: Color(0xFF1D1B45), width: 2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            shape: BoxShape.rectangle,
                          ),
                          todayHighlightColor: Color(0xFF1D1B45),
                          headerStyle: CalendarHeaderStyle(
                              textStyle:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              textAlign: TextAlign.center,
                              backgroundColor:
                                  Color.fromARGB(0, 255, 255, 255)),
                          monthViewSettings: MonthViewSettings(
                            numberOfWeeksInView: 5,
                          ),
                          dataSource: MeetingDataSource(_appointments),
                          onTap: (CalendarTapDetails details) {
                            setState(() {
                              _selectedDate = details.date.toString();
                            });
                          },
                        ),
                      ),
                    Container(
                      height: _isVisible ? 618 : 600,
                      child: Padding(
                        padding: EdgeInsets.only(top: _isVisible ? 218.0 : 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 618,
                                // Ajusta la altura según sea necesario para que coincida con la altura del calendario
                                child: SfCalendar(
                                  view: CalendarView.week,
                                  selectionDecoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: Color(0xFF1D1B45), width: 2),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4)),
                                    shape: BoxShape.rectangle,
                                  ),
                                  todayHighlightColor: Color(0xFF1D1B45),
                                  headerStyle: CalendarHeaderStyle(
                                    textAlign: TextAlign.center,
                                    textStyle: TextStyle(
                                        color: Color(0xFF1D1B45),
                                        fontSize: 22,
                                        fontFamily: 'Noto Sans'),
                                  ),
                                  timeSlotViewSettings: TimeSlotViewSettings(
                                    startHour: 5,
                                    endHour: 20,
                                    timeIntervalHeight: 60,
                                  ),
                                  dataSource:
                                      MeetingDataSource(getAppointments()),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),

            bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor:
                  Colors.grey, // Color para los íconos no seleccionados
              iconSize: 36,
              currentIndex: 0, // Índice inicial
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
                } else if (index == 1) {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType
                          .fade, // Cambia el tipo de transición según tu preferencia
                      child: screens[1],
                    ),
                  );
                } else if (index == 2) {
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
                  icon: Icon(Icons.leaderboard),
                  label: ' ',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.inventory),
                  label: 'Favoritos',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list,
                    color: Color(0xFF1D1B45),
                  ),
                  label: 'Carrito',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined),
                  label: 'Perfil',
                ),
              ],
            ),
          ),
        ));
  }

  _showEventDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Añadir Evento'),
        content: TextField(
          controller: _eventController,
          decoration: InputDecoration(hintText: 'Ingrese el evento'),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Añadir'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

List<Appointment> getAppointments() {
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 1));

  meetings.add(Appointment(
    startTime: startTime,
    endTime: endTime,
    subject: 'Entrega de pedido',
    color: Color(0xFFF9DE5B),
    recurrenceRule: 'FREQ=DAILY;COUNT=10',
    isAllDay: false,
  ));

  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}

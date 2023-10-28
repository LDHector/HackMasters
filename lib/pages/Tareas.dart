import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tienda_login/pages/AgregarProductos1.dart';
import 'package:tienda_login/pages/Estadisticas2.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tienda_login/pages/Inicio.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tienda_login/pages/Inventario1.dart';

class Tareas extends StatefulWidget {
  @override
  _TareasState createState() => _TareasState();
}

class _TareasState extends State<Tareas> {
  List<Appointment> _appointments = [];

  final FirebaseFirestore db = FirebaseFirestore.instance;
  Future<String> obtenerUltimoNombreTienda() async {
    QuerySnapshot querySnapshot = await db
        .collection('Emprendimiento')
        .orderBy('Titulo', descending: true)
        .limit(1)
        .get();

    print(querySnapshot.docs);
    if (querySnapshot.docs.isNotEmpty) {
      var document = querySnapshot.docs.last;
      var data = document.data() as Map<String, dynamic>;
      var specificField = data['Titulo'] as String?;
      if (specificField != null) {
        return specificField;
      } else {
        return 'Nombre de tienda no encontrado';
      }
    } else {
      return 'Nombre de tienda no encontrado';
    }
  }

  Future<String> obtenerUltimoCorreoTienda() async {
    QuerySnapshot querySnapshot = await db
        .collection('Emprendimiento')
        .orderBy('Correo', descending: true)
        .limit(1)
        .get();

    print(querySnapshot.docs);
    if (querySnapshot.docs.isNotEmpty) {
      var document = querySnapshot.docs.last;
      var data = document.data() as Map<String, dynamic>;
      var specificField = data['Correo'] as String?;
      if (specificField != null) {
        return specificField;
      } else {
        return 'Correo de tienda no encontrado';
      }
    } else {
      return 'Correo de tienda no encontrado';
    }
  }

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
    final List<Widget> screens = [Inicio(), Inventario1()];

    //Calendario
    //especificar el formato en el que se muestra el calendario. En este caso,
    //se ha establecido en month, lo que significa que el calendario se mostrará
    //en formato mensual por defecto. Sin embargo, puedes cambiar esto a otros
    //formatos admitidos como CalendarFormat.twoWeeks o CalendarFormat.week.

    return MediaQuery(
      data: query.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            iconTheme:
                IconThemeData(color: const Color.fromARGB(255, 32, 32, 32)),
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            elevation: 0.0,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: FutureBuilder<String>(
                    future: obtenerUltimoNombreTienda(),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          snapshot.data!,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xFF1D1B45),
                            fontSize: 20,
                          ),
                        );
                      } else {
                        return Text(
                          '',
                          style: TextStyle(
                            fontFamily: 'Bebas Neue',
                            color: Color(0xFF1D1B45),
                            fontSize: 25,
                          ),
                        );
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: FutureBuilder<String>(
                    future: obtenerUltimoCorreoTienda(),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          snapshot.data!,
                          style: TextStyle(
                            fontFamily: 'Noto Sans',
                            color: Color(0xff858585),
                            fontWeight: FontWeight.normal,
                            fontSize: 13,
                          ),
                        );
                      } else {
                        return Text(
                          'Correo no especificado',
                          style: TextStyle(
                            fontFamily: 'Bebas Neue',
                            color: Color(0xFF1D1B45),
                            fontSize: 13,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
            actions: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
                padding: EdgeInsets.only(left: 0.0),
                child: IconButton(
                  onPressed: () {
                    // Acción a realizar cuando se presiona el segundo IconButton
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: screens[0],
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.notifications_none,
                    size: 30,
                  ),
                  color: Color(0xFF1D1B45),
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(40.0),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 30.0), // Ajusté los márgenes horizontalmente
                child: Divider(
                  height: 1,
                  color: Colors.black, // Cambié el color a azul
                  thickness: 3, // Hice la línea más gruesa
                ),
              ),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Alinea los widgets a la izquierda
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30.0,
                  ),
                  child: Text(
                    "Hoy",
                    style: TextStyle(
                        color: Color(0xFF1D1B45),
                        fontFamily: 'Noto Sans',
                        fontSize: 28),
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
                        border: Border.all(color: Color(0xFF1D1B45), width: 2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                        shape: BoxShape.rectangle,
                      ),
                      todayHighlightColor: Color(0xFF1D1B45),
                      headerStyle: CalendarHeaderStyle(
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 20),
                          textAlign: TextAlign.center,
                          backgroundColor: Color.fromARGB(0, 255, 255, 255)),
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
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(4)),
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
                              dataSource: MeetingDataSource(getAppointments()),
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
          unselectedItemColor: Colors.grey,
          selectedItemColor:
              Color(0xFF1D1B45), // Color para los íconos no seleccionados
          iconSize: 40,
          currentIndex: 0, // Índice inicial
          onTap: (index) {
            if (index == 0) {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: screens[0],
                ),
              );
            } else if (index == 1) {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: screens[1],
                ),
              );
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.grey),
              label:
                  'Inicio', // Coloca la etiqueta aquí en el mismo nivel que el icono
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              label: ' Productos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_outlined, color: Color(0xFF1D1B45)),
              label: 'Tareas',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
              ),
              label: 'Perfil',
            ),
          ],
          showUnselectedLabels: true,
        ),
      ),
    );
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

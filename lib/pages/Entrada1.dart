import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Importa flutter_svg
import 'package:get/get.dart';
import 'package:tienda_login/pages/Estadisticas2.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tienda_login/pages/Inicio.dart';
import 'package:tienda_login/pages/Tareas.dart';
import 'package:tienda_login/pages/Inventario.dart';

class Entrada1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);

//Lista de todas las rutas
    final List<Widget> screens = [
      Inicio(),
      Estadisticas(),
      Tareas(),
      Inventario(),
    ];

    return WillPopScope(
        onWillPop: () async {
          // Bloquea el retorno a la pantalla anterior
          return false;
        },
        child: MediaQuery(
          data: query.copyWith(textScaleFactor: 1.0),
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: AppBar(
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
                elevation: 0.0,
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Luna Store",
                      style: TextStyle(
                        fontFamily: 'Bebas Neue',
                        color: Color(0xFF1D1B45),
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      "correo@example.com",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                actions: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: IconButton(
                      onPressed: () {
                        // Acción a realizar cuando se presiona el segundo IconButton
                        print('Presionado el segundo IconButton');
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
                  preferredSize: Size.fromHeight(4.0), // Altura de la línea
                  child: Divider(
                    height: 1, // Altura de la línea
                    color: Colors.black, // Color de la línea
                  ),
                ),
              ),
            ),
            body: Column(children: [
              SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: 180,
                            height: 110,
                            margin: EdgeInsets.fromLTRB(0, 16, 10, 0),
                            child: ElevatedButton(
                              onPressed: () => {},
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFEBEBEB),
                                side: BorderSide(
                                  width: 2,
                                  color: Colors.white,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                shadowColor: Colors.transparent,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(
                                          0xff313A56), // Color del círculo
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.add_outlined, // Icono deseado
                                      color: Colors.white, // Color del icono
                                      size: 30, // Tamaño del icono
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Productos',
                                    style: TextStyle(
                                      color: Color(0xFF1D1B45),
                                      fontFamily: 'Bebas Neue',
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 180,
                            height: 110,
                            margin: EdgeInsets.fromLTRB(0, 16, 10, 0),
                            child: ElevatedButton(
                              onPressed: () => {},
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFEBEBEB),
                                side: BorderSide(
                                  width: 2,
                                  color: Colors.white,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                shadowColor: Colors.transparent,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(
                                          0xff313A56), // Color del círculo
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.circle, // Icono deseado
                                      color: Colors.white, // Color del icono
                                      size: 30, // Tamaño del icono
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Mis tareas',
                                    style: TextStyle(
                                      color: Color(0xFF1D1B45),
                                      fontFamily: 'Bebas Neue',
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: 180,
                            height: 110,
                            margin: EdgeInsets.fromLTRB(0, 16, 10, 0),
                            child: ElevatedButton(
                              onPressed: () => {},
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFEBEBEB),
                                side: BorderSide(
                                  width: 2,
                                  color: Colors.white,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                shadowColor: Colors.transparent,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(
                                          0xff313A56), // Color del círculo
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.price_change, // Icono deseado
                                      color: Colors.white, // Color del icono
                                      size: 30, // Tamaño del icono
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Ver Inventario',
                                    style: TextStyle(
                                      color: Color(0xFF1D1B45),
                                      fontFamily: 'Bebas Neue',
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 180,
                            height: 110,
                            margin: EdgeInsets.fromLTRB(0, 16, 10, 0),
                            child: ElevatedButton(
                              onPressed: () => {},
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFEBEBEB),
                                side: BorderSide(
                                  width: 2,
                                  color: Colors.white,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                shadowColor: Colors.transparent,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(
                                          0xff313A56), // Color del círculo
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.person_2_outlined, // Icono deseado
                                      color: Colors.white, // Color del icono
                                      size: 30, // Tamaño del icono
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Colaboradores',
                                    style: TextStyle(
                                      color: Color(0xFF1D1B45),
                                      fontFamily: 'Bebas Neue',
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: 180,
                            height: 110,
                            margin: EdgeInsets.fromLTRB(0, 16, 10, 0),
                            child: ElevatedButton(
                              onPressed: () => {},
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFEBEBEB),
                                side: BorderSide(
                                  width: 2,
                                  color: Colors.white,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                shadowColor: Colors.transparent,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(
                                          0xff313A56), // Color del círculo
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.insert_chart, // Icono deseado
                                      color: Colors.white, // Color del icono
                                      size: 30, // Tamaño del icono
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Estadisticas',
                                    style: TextStyle(
                                      color: Color(0xFF1D1B45),
                                      fontFamily: 'Bebas Neue',
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 180,
                            height: 110,
                            margin: EdgeInsets.fromLTRB(0, 16, 10, 0),
                            child: ElevatedButton(
                              onPressed: () => {},
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFEBEBEB),
                                side: BorderSide(
                                  width: 2,
                                  color: Colors.white,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                shadowColor: Colors.transparent,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(
                                          0xff313A56), // Color del círculo
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons
                                          .chat_bubble_outline, // Icono deseado
                                      color: Colors.white, // Color del icono
                                      size: 30, // Tamaño del icono
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'ChatBots',
                                    style: TextStyle(
                                      color: Color(0xFF1D1B45),
                                      fontFamily: 'Bebas Neue',
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
            bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor:
                  Colors.grey, // Color para los íconos no seleccionados
              iconSize: 46,
              currentIndex: 0, // Índice inicial
              onTap: (index) {
                // Cambia la pantalla según el índice seleccionado
                //El index pasado a este método indica qué ícono se tocó. Luego, se utiliza este index para seleccionar la pantalla correspondiente de la lista screens y mostrarla en el área de contenido principal de la aplicación.
                //Por ejemplo, si el usuario toca el segundo ícono en el BottomNavigationBar, el
                //index será 1 y se cambiara a la ruta que esta en la posicion 1 de mi screens
                if (index == 1 || index == 0) {
                  // Cambia la pantalla solo si el índice es 1
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType
                          .fade, // Cambia el tipo de transición según tu preferencia
                      child: screens[index],
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
                } else if (index == 4) {
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
                    child: Icon(Icons.home, color: Colors.grey),
                  ),
                  label: ' Inicio',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_circle_outline),
                  label: ' Productos',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list_outlined),
                  label: 'Tareas',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined,
                      color: Color(0xFF1D1B45)),
                  label: 'Perfil',
                ),
              ],
            ),
          ),
        ));
  }
}

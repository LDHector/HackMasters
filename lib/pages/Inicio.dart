import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Importa flutter_svg
import 'package:get/get.dart';
import 'package:tienda_login/pages/Estadisticas2.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tienda_login/pages/Inventario.dart';
import 'package:tienda_login/pages/Tareas.dart';
import 'package:tienda_login/pages/miCuenta.dart';

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);

//Lista de todas las rutas
    final List<Widget> screens = [
      Inicio(),
      Estadisticas(),
      Inventario(),
      Tareas(),
      miCuenta()
    ];

    return WillPopScope(
        onWillPop: () async {
          // Bloquea el retorno a la pantalla anterior
          return false;
        },
        child: MediaQuery(
          data: query.copyWith(textScaleFactor: 1.0),
          child: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              title: Center(
                child: Container(
                  padding: EdgeInsets.only(top: 12.0, left: 15.0),
                  child: Text(
                    "MarketNic",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Bebas Neue',
                      color: Color(0xFF1D1B45),
                      fontSize: 40,
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
            body: Center(
              child: Column(children: [
                SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SizedBox(width: 22),
                        Container(
                          width: 390,
                          height: 110,
                          margin: EdgeInsets.fromLTRB(0, 16, 10, 0),
                          child: ElevatedButton(
                            onPressed: () => {},
                            child: Text('NUEVOS PRODUCTOS',
                                style: TextStyle(
                                    color: Color(0xFF1D1B45),
                                    fontFamily: 'Bebas Neue',
                                    fontSize: 30)),
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
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 390,
                          height: 110,
                          margin: EdgeInsets.fromLTRB(0, 16, 10, 0),
                          child: ElevatedButton(
                            onPressed: () => {},
                            child: Text('RESTOCK',
                                style: TextStyle(
                                    color: Color(0xFF1D1B45),
                                    fontFamily: 'Bebas Neue',
                                    fontSize: 30)),
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
                          ),
                        ),
                        Container(
                          width: 390,
                          height: 110,
                          margin: EdgeInsets.fromLTRB(0, 16, 10, 0),
                          child: ElevatedButton(
                            onPressed: () => {},
                            child: Text('PRODUCTOS DESTACADOS',
                                style: TextStyle(
                                    color: Color(0xFF1D1B45),
                                    fontFamily: 'Bebas Neue',
                                    fontSize: 30)),
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
                          ),
                        ),
                        Container(
                          width: 390,
                          height: 110,
                          margin: EdgeInsets.fromLTRB(0, 16, 10, 0),
                          child: ElevatedButton(
                            onPressed: () => {},
                            child: Text('AGOTADOS',
                                style: TextStyle(
                                    color: Color(0xFF1D1B45),
                                    fontFamily: 'Bebas Neue',
                                    fontSize: 30)),
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
                          ),
                        ),
                      ],
                    )),
              ]),
            ),
            bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor:
                  Colors.grey, // Color para los íconos no seleccionados
              iconSize: 36,
              currentIndex: 0, // Índice inicial
              onTap: (index) {
                // Cambia la pantalla según el índice seleccionado
                //El index pasado a este método indica qué ícono se tocó. Luego, se utiliza este index para seleccionar la pantalla correspondiente de la lista screens y mostrarla en el área de contenido principal de la aplicación.
                //Por ejemplo, si el usuario toca el segundo ícono en el BottomNavigationBar, el
                //index será 1 y se cambiara a la ruta que esta en la posicion 1 de mi screens
                if (index == 1 || index == 2 || index == 3 || index == 4) {
                  // Cambia la pantalla solo si el índice es 1
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType
                          .fade, // Cambia el tipo de transición según tu preferencia
                      child: screens[index],
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
                      color: Color(0xFF1D1B45),
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
        ));
  }
}

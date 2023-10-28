import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Importa flutter_svg
import 'package:get/get.dart';
import 'package:tienda_login/pages/Estadisticas2.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tienda_login/pages/Inicio.dart';
import 'package:tienda_login/pages/Inventario.dart';

class Tareas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);

//Lista de todas las rutas
    final List<Widget> screens = [Inicio(), Estadisticas(), Inventario()];

    return MaterialApp(
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
        body: Center(),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor:
              Colors.grey, // Color para los íconos no seleccionados
          iconSize: 46,
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
}

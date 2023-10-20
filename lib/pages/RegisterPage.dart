import 'package:flutter/material.dart';
import 'package:tienda_login/pages/Inicio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tienda_login/pages/Inventario.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tienda_login/pages/Registro2.dart';
import 'package:tienda_login/pages/RegistroColab.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  bool isChecked = false;
  final List<Widget> screens = [Registro2(), RegistroColab()];
  //Funcion para navegar con el checkbox
  void navigateToNextPage(BuildContext context) {
    //Si es seleccionado el checkbox
    if (isChecked) {
      Navigator.push(context,
          PageTransition(type: PageTransitionType.fade, child: screens[1]));
    } else {
      Navigator.push(context,
          PageTransition(type: PageTransitionType.fade, child: screens[0]));
    }
  }

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    return MediaQuery(
        data: query.copyWith(textScaleFactor: 1.0),
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text(" "),
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
            ),
            body: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Center(
                    child: Container(
                        //padding: EdgeInsets.only(top: 0.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Crear cuenta",
                                  style: TextStyle(
                                      fontFamily: 'Noto Sans',
                                      fontSize: 30,
                                      color: Color(0xff313A56))),
                              SizedBox(height: 6),
                              SizedBox(height: 10),
                              Container(
                                width: 300,
                                height: 35,
                                child: Text(
                                  "Nombre ",
                                  style: TextStyle(
                                      color: Color(0xff313A56),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Noto Sans'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Container(
                                  width: 305,
                                  //// Márgenes horizontales de 20 puntos
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  padding: EdgeInsets.all(
                                      4.0), // // Relleno interno de 10 puntos
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255,
                                        255), // Color de fondo del TextFormField
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Bordes redondeados
                                  ),
                                  child: Container(
                                    height: 68,
                                    width: 200,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 290,
                                          child: Container(
                                            height: 45,
                                            child: TextFormField(
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color(
                                                      0xff313A56)), // Establece el color del texto.
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                  width: 10,
                                                  color: Color(0xFF1D1B45),
                                                )), // Elimina el borde del TextFormField
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),

                              //Contraseña
                              Container(
                                width: 300,
                                height: 35,
                                child: Text(
                                  "Correo electrónico",
                                  style: TextStyle(
                                      color: Color(0xff313A56),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Noto Sans'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Container(
                                  width: 305,
                                  //// Márgenes horizontales de 20 puntos
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  padding: EdgeInsets.all(
                                      4.0), // // Relleno interno de 10 puntos
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(0, 255, 255,
                                        255), // Color de fondo del TextFormField
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Bordes redondeados
                                  ),
                                  child: Container(
                                    height: 68,
                                    width: 200,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 290,
                                          child: Container(
                                            height: 45,
                                            child: TextFormField(
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color(
                                                      0xff313A56)), // Establece el color del texto.
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                  width: 10,
                                                  color: Color(0xFF1D1B45),
                                                )), // Elimina el borde del TextFormField
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),

                              //Confirmar contraseña
                              Container(
                                width: 300,
                                height: 35,
                                child: Text(
                                  "Contraseña",
                                  style: TextStyle(
                                      color: Color(0xff313A56),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Noto Sans'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Container(
                                  width: 305,
                                  //// Márgenes horizontales de 20 puntos
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  padding: EdgeInsets.all(
                                      4.0), // // Relleno interno de 10 puntos
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255,
                                        255), // Color de fondo del TextFormField
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Bordes redondeados
                                  ),
                                  child: Container(
                                    height: 68,
                                    width: 200,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 290,
                                          child: Container(
                                            height: 45,
                                            child: TextFormField(
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color(
                                                      0xff313A56)), // Establece el color del texto.
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                  width: 10,
                                                  color: Color(0xFF1D1B45),
                                                )), // Elimina el borde del TextFormField
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                0), // Ajusta esta altura según tus necesidades
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),

                              Container(
                                width: 300,
                                height: 35,
                                child: Text(
                                  "Confirmar contraseña",
                                  style: TextStyle(
                                      color: Color(0xff313A56),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Noto Sans'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Container(
                                  width: 305,
                                  //// Márgenes horizontales de 20 puntos
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  padding: EdgeInsets.all(
                                      4.0), // // Relleno interno de 10 puntos
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255,
                                        255), // Color de fondo del TextFormField
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Bordes redondeados
                                  ),
                                  child: Container(
                                    height: 68,
                                    width: 200,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 290,
                                          child: Container(
                                            height: 45,
                                            child: TextFormField(
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color(
                                                      0xff313A56)), // Establece el color del texto.
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                  width: 10,
                                                  color: Color(0xFF1D1B45),
                                                )), // Elimina el borde del TextFormField
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                0), // Ajusta esta altura según tus necesidades
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 10,
                                    width: 110,
                                    child: Container(
                                      child: Checkbox(
                                        checkColor:
                                            Color.fromARGB(255, 255, 255, 255),
                                        activeColor: Color(0xff313A56),
                                        value: isChecked,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isChecked = value!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "Soy colaborador",
                                      style: TextStyle(
                                          fontFamily: 'Noto Sans',
                                          fontSize: 16,
                                          color: Color(0xff313A56)),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 30),

                              Container(
                                  width: 300,
                                  height: 40,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(top: 0.0, right: 12),
                                    child: ElevatedButton(
                                      onPressed: () => {
                                        navigateToNextPage(context),
                                      },
                                      child: Text(
                                        "Registrarse",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Noto Sans'),
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty
                                            .all<Color>(Color(
                                                0xff313A56)), // Establece el color de fondo
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Color.fromARGB(
                                                    255, 255, 255, 255)),
                                        minimumSize: MaterialStateProperty
                                            .all<Size>(Size(200,
                                                50)), // Establece el color del texto}
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),

                              SizedBox(height: 0),
                            ])),
                  );
                })));
  }
}

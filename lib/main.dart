import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tienda_login/pages/Acceder.dart';
import 'package:tienda_login/pages/Inicio.dart';
import 'package:tienda_login/pages/RegisterPage.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(LoginApp()));
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //crea una instancia de la clase TextEditingController llamada controllerUser.
  //Esta instancia se utiliza para controlar y gestionar un campo de entrada de texto
  TextEditingController controllerUser = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();
  final List<Widget> screens = [Acceder(), RegisterPage()];

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    return MediaQuery(
        data: query.copyWith(textScaleFactor: 1.0),
        child: MaterialApp(
          home: Scaffold(
            // La siguiente línea deshabilita la redimensión automática del contenido cuando aparece el teclado en la pantalla.
            resizeToAvoidBottomInset: false,
            // Configura el contenido principal de la pantalla dentro de un widget Form.
            body: Form(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                ),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Container(
                      child: Image.asset('assets/MarN.png' // Ancho deseado
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            15, 0, 0, 0), // Establece el margen
                        width: 260,
                        height:
                            48, // Establece el relleno (ajústalo según tus necesidades)

                        child: Center(
                          child: Text(
                            "¡Bienvenido!",
                            style: TextStyle(
                                color: Color(0xfff313A56),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Noto Sans'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    //Container para el usuario
                    Container(
                      width: 299,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  child: screens[0]));
                        },
                        child: Text(
                          "Iniciar sesión",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Noto Sans'),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xff313A56)),
                            minimumSize:
                                MaterialStateProperty.all<Size>(Size(900, 600)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            shadowColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(0, 255, 255, 255)
                                    .withOpacity(0.5))),
                      ),
                    ),

                    SizedBox(height: 32),
                    Container(
                      width: 299,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () => {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  child: screens[1]))
                        },
                        child: Text(
                          "Registrarse",
                          style: TextStyle(
                              color: Color(0xff313A56),
                              fontSize: 16,
                              fontFamily: 'Noto Sans'),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 255, 255, 255)),
                            minimumSize:
                                MaterialStateProperty.all<Size>(Size(900, 600)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(color: Color(0xffF9DE5B)),
                              ),
                            ),
                            shadowColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(0, 255, 255, 255)
                                    .withOpacity(0.5))),
                        /*style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFFF9DE5B)), // Establece el color de fondo
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFFF313A56)),
                          minimumSize: MaterialStateProperty.all<Size>(
                              Size(200, 50)), // Establece el color del texto}
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0), 
                            ),
                          ),
                          
                        ),*/
                      ),
                    ),
                    SizedBox(
                      height: 140,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

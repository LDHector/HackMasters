import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tienda_login/pages/Inicio.dart';
import 'package:tienda_login/pages/RegisterPage.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter + Mysql',
      home: LoginPage(),
      //Se están definiendo rutas de navegación en una aplicación Flutter, donde '/powerPage'
      //muestra la página 'Power' y '/vendedoresPage' muestra la página 'Vendedores'.
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
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF1D1B45),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            15, 0, 0, 0), // Establece el margen
                        width: 260,
                        height:
                            48, // Establece el relleno (ajústalo según tus necesidades)
                        child: Text(
                          "¡Bienvenido!",
                          style: TextStyle(
                              color: Color(0xFFF9DE5B),
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Noto Sans'),
                        ),
                      ),
                    ),
                    // Agrega el TextFormField dentro de un Container para controlar su apariencia
                    //Container para el usuario
                    Container(
                      width: 300,
                      height: 35,
                      child: Text(
                        "Usuario",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Noto Sans'),
                      ),
                    ),
                    Container(
                      width: 305,
                      //// Márgenes horizontales de 20 puntos
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      padding: EdgeInsets.all(
                          4.0), // // Relleno interno de 10 puntos
                      decoration: BoxDecoration(
                        color: Color(
                            0xFF37315E), // Color de fondo del TextFormField
                        borderRadius:
                            BorderRadius.circular(10.0), // Bordes redondeados
                      ),
                      child: Container(
                        height: 46,
                        width: 290,
                        child: TextFormField(
                          //Asociamos un controlador llamado controllerUser al TextFormField. Esto permite controlar y acceder al contenido del campo de entrada.
                          controller: controllerUser,
                          style: TextStyle(
                              color: Colors
                                  .white), // Establece el color del texto.
                          decoration: InputDecoration(
                            icon: Icon(
                              //Agregamos un ícono al lado izquierdo del campo de entrada.
                              Icons.account_box_sharp,
                              color: Color(0xFF1D1B45),
                            ),
                            // Establecemos un texto de sugerencia dentro del campo de entrada. En este caso, el texto es "Usuario".
                            // Establecemos el color del texto de sugerencia en negro con una opacidad del 50%.
                            // Eliminamos el borde del TextFormField para que no tenga un borde visible.
                            border: InputBorder
                                .none, // Elimina el borde del TextFormField
                          ),
                        ),
                      ),
                    ),
                    // Agrega espacio entre los dos campos de entrada
                    SizedBox(height: 45.0),

                    Container(
                      width: 300,
                      height: 35,
                      child: Text(
                        "Contraseña",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Noto Sans'),
                      ),
                    ),
                    //Container para la password
                    Container(
                      width: 305,
                      //// Márgenes horizontales de 20 puntos
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      padding: EdgeInsets.all(
                          4.0), // // Relleno interno de 10 puntos
                      decoration: BoxDecoration(
                        color: Color(
                            0xFF37315E), // Color de fondo del TextFormField
                        borderRadius:
                            BorderRadius.circular(10.0), // Bordes redondeados
                      ),
                      child: Container(
                        width: 290,
                        height: 46,
                        child: TextFormField(
                          //Asociamos un controlador llamado controllerUser al TextFormField. Esto permite controlar y acceder al contenido del campo de entrada.
                          controller: controllerPass,
                          style: TextStyle(
                              color: Colors
                                  .white), // Establece el color del texto.
                          decoration: InputDecoration(
                            icon: Icon(
                              //Agregamos un ícono al lado izquierdo del campo de entrada.
                              Icons.key,
                              color: Color(0xFF1D1B45),
                            ),

                            // Eliminamos el borde del TextFormField para que no tenga un borde visible.
                            border: InputBorder
                                .none, // Elimina el borde del TextFormField
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Container(
                        child: Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: ElevatedButton(
                        onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()))
                        },
                        child: Text(
                          "Registrarse",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Noto Sans',
                              color: Color(0xFF1D1B45)),
                        ),
                        style: ButtonStyle(
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
                        ),
                      ),
                    )),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

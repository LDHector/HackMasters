import 'package:flutter/material.dart';
import 'package:tienda_login/pages/Inicio.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    return MediaQuery(
        data: query.copyWith(textScaleFactor: 1.0),
        child: Scaffold(
            appBar: AppBar(
              title: Text(" "),
              backgroundColor: Color(0xFF1D1B45),
            ),
            body: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Center(
                    child: Container(
                        padding: EdgeInsets.only(top: 20.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFF1D1B45),
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: 6),
                              Container(
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      15, 0, 0, 0), // Establece el margen
                                  width: 296,
                                  height:
                                      75, // Establece el relleno (ajústalo según tus necesidades)

                                  child: Stack(
                                    children: [
                                      Positioned(
                                          width: 296,
                                          height: 75,
                                          top: -0,
                                          child: Container(
                                            child: Text(
                                              "¡Únete a nosotros!",
                                              style: TextStyle(
                                                  color: Color(0xFFF9DE5B),
                                                  fontSize: 31,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Noto Sans'),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(height: 10),
                              Container(
                                width: 300,
                                height: 35,
                                child: Text(
                                  "Nombre del emprendimiento",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
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
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Bordes redondeados
                                ),
                                child: Container(
                                  width: 290,
                                  height: 46,
                                  child: TextFormField(
                                    //Asociamos un controlador llamado controllerUser al TextFormField. Esto permite controlar y acceder al contenido del campo de entrada.
                                    //   controller: controllerUser,
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

                                      // Eliminamos el borde del TextFormField para que no tenga un borde visible.
                                      border: InputBorder
                                          .none, // Elimina el borde del TextFormField
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: 300,
                                height: 35,
                                child: Text(
                                  "Tipo de negocio",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
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
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Bordes redondeados
                                ),
                                child: Container(
                                  height: 46,
                                  width: 290,
                                  child: TextFormField(
                                    //Asociamos un controlador llamado controllerUser al TextFormField. Esto permite controlar y acceder al contenido del campo de entrada.
                                    //   controller: controllerUser,
                                    style: TextStyle(
                                        color: Colors
                                            .white), // Establece el color del texto.
                                    decoration: InputDecoration(
                                      icon: Icon(
                                        //Agregamos un ícono al lado izquierdo del campo de entrada.
                                        Icons.business_center,
                                        color: Color(0xFF1D1B45),
                                      ),

                                      // Establecemos un texto de sugerencia dentro del campo de entrada. En este caso, el texto es "Usuario".
                                      //un borde visible.
                                      border: InputBorder
                                          .none, // Elimina el borde del TextFormField
                                    ),
                                  ),
                                ),
                              ),
                              //Email
                              SizedBox(height: 20),
                              Container(
                                width: 300,
                                height: 35,
                                child: Text(
                                  "Telefono de contacto",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
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
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Bordes redondeados
                                ),
                                child: Container(
                                  height: 46,
                                  width: 290,
                                  child: TextFormField(
                                    //Asociamos un controlador llamado controllerUser al TextFormField. Esto permite controlar y acceder al contenido del campo de entrada.
                                    //   controller: controllerUser,
                                    style: TextStyle(
                                        color: Colors
                                            .white), // Establece el color del texto.
                                    decoration: InputDecoration(
                                      icon: Icon(
                                        //Agregamos un ícono al lado izquierdo del campo de entrada.
                                        Icons.phone,
                                        color: Color(0xFF1D1B45),
                                      ),
                                      hintText: '+505',
                                      hintStyle: TextStyle(color: Colors.white),
                                      // Establecemos un texto de sugerencia dentro del campo de entrada. En este caso, el texto es "Usuario".
                                      //un borde visible.
                                      border: InputBorder
                                          .none, // Elimina el borde del TextFormField
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),

                              //Contraseña
                              Container(
                                width: 300,
                                height: 35,
                                child: Text(
                                  "Correo electrónico",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
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
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Bordes redondeados
                                ),
                                child: Container(
                                  height: 46,
                                  width: 290,
                                  child: TextFormField(
                                    //Asociamos un controlador llamado controllerUser al TextFormField. Esto permite controlar y acceder al contenido del campo de entrada.
                                    //   controller: controllerUser,
                                    style: TextStyle(
                                        color: Colors
                                            .white), // Establece el color del texto.
                                    decoration: InputDecoration(
                                      icon: Icon(
                                        //Agregamos un ícono al lado izquierdo del campo de entrada.
                                        Icons.email,
                                        color: Color(0xFF1D1B45),
                                      ),
                                      // Establecemos un texto de sugerencia dentro del campo de entrada. En este caso, el texto es "Usuario".

                                      // Eliminamos el borde del TextFormField para que no tenga un borde visible.
                                      border: InputBorder
                                          .none, // Elimina el borde del TextFormField
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),

                              //Confirmar contraseña
                              Container(
                                width: 300,
                                height: 35,
                                child: Text(
                                  "Contraseña",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
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
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Bordes redondeados
                                ),
                                child: Container(
                                  height: 46,
                                  width: 290,
                                  child: TextFormField(
                                    //Asociamos un controlador llamado controllerUser al TextFormField. Esto permite controlar y acceder al contenido del campo de entrada.
                                    //   controller: controllerUser,
                                    style: TextStyle(
                                        color: Colors
                                            .white), // Establece el color del texto.
                                    decoration: InputDecoration(
                                      icon: Icon(
                                        //Agregamos un ícono al lado izquierdo del campo de entrada.
                                        Icons.key,
                                        color: Color(0xFF1D1B45),
                                      ),
                                      // Establecemos un texto de sugerencia dentro del campo de entrada. En este caso, el texto es "Usuario".

                                      border: InputBorder
                                          .none, // Elimina el borde del TextFormField
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),

                              Container(
                                  child: Padding(
                                padding: EdgeInsets.only(top: 30.0),
                                child: ElevatedButton(
                                  onPressed: () => {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Inicio()),
                                      (route) =>
                                          false, // Esto eliminará todas las rutas anteriores
                                    )
                                  },
                                  child: Text(
                                    "Continuar",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Noto Sans'),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(Color(
                                            0xFFF9DE5B)), // Establece el color de fondo
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color(0xFF1D1B45)),
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(Size(
                                            200,
                                            50)), // Establece el color del texto}
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                              SizedBox(height: 124),
                            ])),
                  );
                })));
  }
}

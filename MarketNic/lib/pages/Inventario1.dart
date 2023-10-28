import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tienda_login/pages/AgregarProductos1.dart';
import 'package:tienda_login/pages/Estadisticas2.dart';
import 'package:tienda_login/pages/Inicio.dart';
import 'package:tienda_login/pages/Tareas.dart';
import 'package:page_transition/page_transition.dart';

class Product {
  String codigo;
  String nombre;
  String cantidad;
  String precio;
  String descripcion;

  Product(
      this.codigo, this.nombre, this.cantidad, this.precio, this.descripcion);
}

class Inventario1 extends StatelessWidget {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
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

    final query = MediaQuery.of(context);
    Future<List<Product>> getProducts() async {
      List<Product> products = [];

      QuerySnapshot querySnapshot = await db.collection("Productos").get();
      querySnapshot.docs.forEach((doc) {
        products.add(Product(
          doc["Codigo"],
          doc["Nombre"],
          doc["Cantidad"],
          doc["Precio"],
          doc["Descripcion"],
        ));
      });

      return products;
    }

    final List<Widget> screens = [Inicio(), Tareas(), AgregarProductos1()];

    return MediaQuery(
      data: query.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
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
                padding: EdgeInsets.only(left: 20.0),
                child: IconButton(
                  onPressed: () {
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
              preferredSize: Size.fromHeight(40.0),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                ),
                child: Divider(
                  height: 1,
                  color: Colors.black,
                  thickness: 3,
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    'Productos',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1D1B45),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: screens[2],
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20, right: 20),
                    child: Text(
                      'Añadir Productos',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF1D1B45),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 135.0),
              child: Container(
                width: 250,
                height: 600,
                child: FutureBuilder<List<Product>>(
                  future: getProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error fetching data'));
                    } else if (snapshot.data == null ||
                        snapshot.data!.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 120.0),
                        child: Center(child: Text('Sin registros')),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          Product product = snapshot.data![index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: double.infinity,
                              height: 110,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  Image.network(
                                    'https://cdn2.actitudfem.com/660x625/filters:format(webp):quality(75)/media/files/images/2021/08/tipos-de-anillos-y-su-significado.jpg', // Cambia esto por la URL de tu imagen
                                    fit: BoxFit
                                        .cover, // Ajusta la imagen para cubrir el espacio asignado
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.nombre,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Disponibles: ${product.cantidad}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        '\$${product.precio}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        product.descripcion,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Color(0xFF1D1B45),
          iconSize: 40,
          currentIndex: 0,
          onTap: (index) {
            if (index == 0) {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: screens[index],
                ),
              );
            } else if (index == 2) {
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
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline, color: Color(0xFF1D1B45)),
              label: ' Productos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_outlined),
              label: 'Tareas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Perfil',
            ),
          ],
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}

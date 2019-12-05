import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

import 'Favoritos.dart';
import 'Feed.dart';
import 'Reposteos.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  //Lista de posteos
  List<Posteo> posteos = [];

  //Lista de posteos agregados a favoritos.
  List<Posteo> favoritos = [];

  //Lista de posteos agregados a reposteados.
  List<Posteo> reposteados = [];

  // Nos indica que página fue seleccionada de la bottomNavigationBar.
  int selectedPage = 1;

  // Esta lista contiene las diferentes pantallas que vamos a mostrar en el
  // body del Scaffold, dependiendo de la página seleccionada.
  List<Widget> pages = [];

  // Lista de items de la BottomNavigationBar.
  var items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite, color: Colors.white),
      activeIcon: Icon(Icons.favorite, color: Colors.greenAccent),
      title: Text(
        "Favoritos",
        style: TextStyle(fontSize: 12, color: Colors.white),
      ),
      backgroundColor: Color.fromRGBO(244, 240, 204, 1),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home, color: Colors.white),
      activeIcon: Icon(Icons.home, color: Colors.greenAccent),
      title: Text(
        "Feed",
        style: TextStyle(fontSize: 12, color: Colors.white),
      ),
      backgroundColor: Color.fromRGBO(244, 240, 204, 1),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.repeat, color: Colors.white),
      activeIcon: Icon(Icons.repeat, color: Colors.greenAccent),
      title: Text(
        "Reposteos",
        style: TextStyle(fontSize: 12, color: Colors.white),
      ),
      backgroundColor: Color.fromRGBO(244, 240, 204, 1),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    //Genero los posteos que van a ser mostrados en el feed
    posteos = generarPosteos();

    //Creo las pantallas
    pages.addAll([
      Favoritos(favoritos),
      Feed(posteos, favoritos, reposteados),
      Reposteos(reposteados),
    ]);

    return Scaffold(
      appBar: AppBar(
        title: Text("InforSanLuis 2019"),
      ),
      // Se dibuja una página diferente en función de lo seleccionado
      body: Container(
        color: Colors.black,
        child: SafeArea(
          top: false,
          child: IndexedStack(
            index: selectedPage,
            children: pages,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: selectedPage,
        iconSize: 24,
        selectedItemColor: Color.fromRGBO(51, 51, 51, 1),
        unselectedItemColor: Color.fromRGBO(51, 51, 51, 0.5),
        onTap: (int index) {
          // Uso del setState para redibujar el Widget.
          setState(() => selectedPage = index);
        },
        backgroundColor: Colors.blueGrey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  //Genera los posteos que van a ser mostrados en el feed
  List<Posteo> generarPosteos() {
    List<Posteo> p = [];
    List<String> usuarios = [
      '@JuanPerez',
      '@PedroMiranda',
      '@LuisNievas',
      '@JorgeRuiz',
      '@MarioGonzalez'
    ];

    //Por cada usuario, genero un posteo
    for (int i = 0; i < usuarios.length; i++) {
      String usuario = usuarios[i];

      //Genero la imagen del usuario del posteo con una imagen traida de internet
      Widget imagen = Container(
        width: 50,
        height: 50,

        //Para que la imagen sea redonda le creo un BoxDecoration con shape BoxShape.circle
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            //Hago que la imagen se ajuste al circulo
            fit: BoxFit.fill,

            //Traigo una imagen de internet
            image: NetworkImage(
              'https://picsum.photos/250?image=$i',
            ),
          ),
        ),
      );

      //Genero el contenido del posteo con contenido generado aleatoriamente
      String contenido = lorem(paragraphs: 1, words: 15);

      p.add(Posteo(usuario, imagen, contenido));
    }
    return p;
  }
}

//Clase que almacena toda la informacion de un posteo
class Posteo {
  String usuario;
  Widget imagen;
  String contenido;

  Posteo(this.usuario, this.imagen, this.contenido);
}

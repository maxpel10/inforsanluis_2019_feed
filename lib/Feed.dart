import 'package:flutter/material.dart';

import 'MyApp.dart';
import 'Posteo.dart';

class Feed extends StatefulWidget {
  final List<Posteo> posteos;
  List<Posteo> favoritos;
  List<Posteo> reposteados;

  //Recibe por parámetro la lista de posteos, los posteos favoritos y los reposteados desde My App
  Feed(this.posteos, this.favoritos, this.reposteados);

  //Crea el estado de la pantalla
  @override
  State<StatefulWidget> createState() =>
      FeedState(posteos, favoritos, reposteados);
}

class FeedState extends State<Feed> {
  final List<Posteo> posteos;
  List<Posteo> favoritos;
  List<Posteo> reposteados;

  //Recibe por parámetro la lista de posteos, los posteos favoritos y los reposteados desde Feed
  FeedState(this.posteos, this.favoritos, this.reposteados);

  //Construye la pantalla
  @override
  Widget build(BuildContext context) {
    return ListView.separated(

        //Cantidad de veces que va a iterar sobre el itemBuilder
        itemCount: posteos.length,

        //Separador entre posteos
        separatorBuilder: (BuildContext context, int index) =>
            Container(child: Divider(color: Colors.white)),

        //Constructor de cada posteo
        itemBuilder: (BuildContext ctxt, int index) {
          return Container(
            //Utilizo un padding para darle un espaciado entre el container y el contenido del posteo
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),

                //Utilizo un column para poner a sus hijos uno debajo de otro.
                child: Column(
                  children: <Widget>[
                    //Cada posteo es un list tile. El leading es la imagen del usuario, el title es el nombre de usuario y el subtitle el contenido del posteo
                    ListTile(
                      //Defino el comportamiento que debe tener cuando un posteo es presionado
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PosteoEspecifico(
                                  posteos[index], favoritos, reposteados)),
                        );
                      },

                      //Inserto la imagen del usuario en el leading del listTile
                      leading: posteos[index].imagen,

                      //Inserto el nombre usuario en el title del listTile
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text(
                          posteos[index].usuario,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),

                      //Inserto el contenido del posteo en el subtitle del listTile
                      subtitle: Text(
                        posteos[index].contenido,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    //TODO: Agregar iconos(favoritos y reposteo) y darle funcionalidad.
                  ],
                )),
          );
        });
  }
}

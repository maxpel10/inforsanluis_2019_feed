import 'package:flutter/material.dart';

import 'MyApp.dart';

class PosteoEspecifico extends StatefulWidget {
  final Posteo posteo;
  List<Posteo> favoritos;
  List<Posteo> reposteados;

  PosteoEspecifico(this.posteo, this.favoritos, this.reposteados);

  @override
  State<StatefulWidget> createState() =>
      PosteoEspecificoState(posteo, favoritos, reposteados);
}

class PosteoEspecificoState extends State<PosteoEspecifico> {
  final Posteo posteo;
  List<Posteo> favoritos;
  List<Posteo> reposteados;

  PosteoEspecificoState(this.posteo, this.favoritos, this.reposteados);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Posteo'),
        ),

        //Utilizo un sized box para que el container ocupe toda la pantalla
        body: SizedBox.expand(
          child: Container(
            color: Colors.black,
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 50),

                //Utilizo un column para que sus hijos se ubiquen uno debajo del otro.
                child: Column(
                  children: <Widget>[
                    //Creo el listile que va a mostrar toda la info del posteo pasado por el constructor.
                    ListTile(
                      leading: posteo.imagen,
                      title: Text(
                        posteo.usuario,
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      subtitle: Text(
                        posteo.contenido,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    //TODO: Agregar iconos(favoritos y reposteo) y información adicional como por ejemplo la hora y lugar
                    //de posteo. No necesariamente la información tiene que ser distinta para cada posteo. Es decir,
                    //pueden ser campos de texto estáticos.

                    //TODO: Darle funcionalidad a los iconos de favoritos y reposteo.
                  ],
                )),
          ),
        ));
  }
}

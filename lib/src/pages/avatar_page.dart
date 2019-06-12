import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatars'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Stan_Lee_by_Gage_Skidmore_3.jpg/220px-Stan_Lee_by_Gage_Skidmore_3.jpg',
              ),
              radius: 20.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.indigo,
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage(
            'https://www.eldiario.es/fotos/Stan-Lee-lanzando-presentacion-Spiderman_EDIIMA20181112_0851_19.jpg',
          ),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}

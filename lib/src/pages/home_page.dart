import 'package:flutter/material.dart';
import 'package:project/src/providers/peliculas_providers.dart';
import 'package:project/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Peliculas en cines'),
        backgroundColor: Colors.orangeAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _swiperTarget()
          ],
        ),
      )
      
       
    );
  }

   Widget _swiperTarget(){

    final peliculasProvider = PeliculasProvider();
    peliculasProvider.getEnCines();

    return CardSwiper(
      peliculas: [1,2,3,4,5],
    );
  }
}
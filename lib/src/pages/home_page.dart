import 'package:flutter/material.dart';
import 'package:project/src/providers/peliculas_providers.dart';
import 'package:project/src/widgets/card_swiper_widget.dart';
import 'package:project/src/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {

    final peliculasProvider = PeliculasProvider();


  @override
  Widget build(BuildContext context) {

    peliculasProvider.getPopulares();

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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperTarget(),
            _footer(context)
          ],
        ),
      )
      
       
    );
  }

   Widget _swiperTarget(){

     return FutureBuilder(
      future: peliculasProvider.getPopulares(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot){
        if(snapshot.hasData){
        return CardSwiper(
          peliculas: snapshot.data,);
          
        }else {
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator()));
        }
        
      }
     );
  
   // peliculasProvider.getEnCines();
//
   // return CardSwiper(
   //   peliculas: [1,2,3,4,5],
   // );
  }
  Widget _footer(BuildContext context){
  return Container(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('Populares', style: Theme.of(context).textTheme.subhead)),
         SizedBox(height: 5.0,),

         StreamBuilder(
          stream: peliculasProvider.popularesStream,
          builder: (BuildContext context, AsyncSnapshot<List> snapshot){
            if(snapshot.hasData){
              return MovieHorizontal(
                peliculas: snapshot.data,
                siguientePagina: peliculasProvider.getPopulares,
                );
            }else{
            return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    ),
  );
}


}


import 'package:flutter/material.dart';
import 'package:wisatabandung/detail_screen.dart';
import 'package:wisatabandung/model/tourism_place.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Wisata Bandung size ${MediaQuery
              .of(context)
              .size
              .width}"),
        ),
        body: LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints){
          if(constraints.maxWidth <= 600){
            return const TourismPlaceList();

          }else if(constraints.maxWidth <= 1200){
            return const TourismPlaceGrid(gridCount: 4,);
          }else{
            return const TourismPlaceGrid(gridCount: 6,);
          }
        })
    );
  }
}

class TourismPlaceList extends StatelessWidget {
  const TourismPlaceList({super.key});


  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      final TourismPlace place = tourismPlaceList[index];
      return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailScreen(place: place,);
          }));
        },
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 1,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Hero(
                        tag: place.name,
                        child: Image.asset(place.imageAsset),
                      ))),
              Expanded(
                flex: 2,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          place.name,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(place.location),
                      ],
                    )),
              )
            ],
          ),
        ),
      );
    }, itemCount: tourismPlaceList.length,);
  }

}

class TourismPlaceGrid extends StatelessWidget {
  final int gridCount;
  const TourismPlaceGrid({super.key,required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.count(
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          crossAxisCount: gridCount,
          children: tourismPlaceList.map((place) {
            return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailScreen(place: place);
                  }));
                },
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Hero(
                              tag: place.name,
                              child: Image.asset(
                                place.imageAsset,
                                fit: BoxFit.cover,
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(place.name,
                            style: const TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: Text(place.location),
                      ),
                    ],
                  ),
                ));
          }).toList(),
        ));
  }

}
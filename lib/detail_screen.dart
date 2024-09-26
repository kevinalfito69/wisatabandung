import 'package:flutter/material.dart';

const informationTextStyle =  TextStyle(fontFamily: 'Oxygen');

class DetailScreen extends StatelessWidget{

  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(leading: IconButton(onPressed: (){Navigator.pop(context);}, tooltip: "Back", icon: const Icon(Icons.arrow_back)) ,title: const Text("Back"),),
        body: SafeArea(child:
        SingleChildScrollView(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset('images/farm-house.jpg'),
                Container(
                    margin: const EdgeInsets.only(top: 16.0),
                    child: const Text("farm house lembang",textAlign: TextAlign.center, style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'Staatliches',
                      fontWeight: FontWeight.bold,
                    ),)),
                Container(

                  margin: const EdgeInsets.symmetric(vertical: 16.0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.calendar_month),
                          SizedBox(height: 8.0,),
                          Text(
                            'Open Everyday',
                            style: informationTextStyle,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.watch_later_outlined),
                          SizedBox(height: 8.0,),
                          Text(
                              "09:20 - 18-30",
                              style: informationTextStyle)
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.monetization_on_outlined),
                          SizedBox(height: 8.0,),
                          Text(
                              "Rp25.000",
                              style: informationTextStyle
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: const Text("Berada di jalur utama Bandung-Lembang, Farm House menjadi objek wisata yang tidak pernah sepi pengunjung. Selain karena letaknya strategis, kawasan ini juga menghadirkan nuansa wisata khas Eropa. Semua itu diterapkan dalam bentuk spot swafoto Instagramable.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Oxygen'
                      ),
                    )),
                SizedBox(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(padding:const EdgeInsets.all(4.0), child: ClipRRect(borderRadius: BorderRadius.circular(10), child:Image.network('https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg'))),
                      Padding(padding:const EdgeInsets.all(4.0), child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.network('https://media-cdn.tripadvisor.com/media/photo-w/13/f0/22/f6/photo3jpg.jpg'))),
                      Padding(padding:const EdgeInsets.all(4.0), child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.network('https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'))),
                    ],
                  ),
                )

              ],)
        )
        )
    );
  }

}




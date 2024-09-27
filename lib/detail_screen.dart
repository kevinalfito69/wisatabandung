import 'package:flutter/material.dart';
import 'package:wisatabandung/model/tourism_place.dart';

const informationTextStyle = TextStyle(fontFamily: 'Oxygen');

class DetailScreen extends StatelessWidget {
  final TourismPlace place;

  const DetailScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints){
      if(constraints.maxWidth > 800){
        return DetailWebPage(place: place);
      }else{
        return DetailMobilePage(place: place,);
      }
    });
  }
}

class DetailWebPage extends StatefulWidget{
  final TourismPlace place;

  const DetailWebPage({super.key, required this.place});

  @override
  State<DetailWebPage> createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Padding(padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 64),child:
      Center(
        child: SizedBox(
          width: 1200,
          child: SingleChildScrollView(child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Wisata Bandung',
                style: TextStyle(
                  fontFamily: 'Staatliches',
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 32,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child:
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Hero(tag: widget.place.name, child: Image.asset(widget.place.imageAsset)),
                      ),
                      const SizedBox(height: 16,),
                      Scrollbar(controller:_scrollController ,child: Container(
                        height: 150,
                        padding: const EdgeInsets.only(bottom: 16),
                        child: ListView(
                          controller: _scrollController,
                          scrollDirection: Axis.horizontal,
                          children: widget.place.imageUrls.map((url) {
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(url),
                              ),
                            );
                          }).toList(),
                        ),
                      )),
                    ],
                  )
                  ),
                  const SizedBox(width: 32,),
                  Expanded(child: Card(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children:[
                          Text(
                            widget.place.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 30.0,
                              fontFamily: 'Staatliches',
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: <Widget>[
                                  const Icon(Icons.calendar_today),
                                  const SizedBox(width: 8.0),
                                  Text(
                                    widget.place.openDays,
                                    style: informationTextStyle,
                                  ),
                                ],
                              ),
                              const FavoriteButton(),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              const Icon(Icons.access_time),
                              const SizedBox(width: 8.0),
                              Text(
                                widget.place.openTime,
                                style: informationTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            children: [
                              const Icon(Icons.monetization_on),
                              const SizedBox(width: 8.0),
                              Text(
                                widget.place.ticketPrice,
                                style: informationTextStyle,
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              widget.place.description,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'Oxygen',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),)
                ],
              )
            ],
          ),),),
        ),
      )
      ,
    );
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class DetailMobilePage extends StatelessWidget{
  final TourismPlace place;

  const DetailMobilePage({super.key, required this.place});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      children: [
                        Hero(tag: place.name, child: Image.asset(place.imageAsset)),
                        SafeArea(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                      backgroundColor: Colors.black26,
                                      child: IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(Icons.arrow_back, color: Colors.white,))),
                                  const FavoriteButton()
                                ],
                              ),

                            )),

                      ],
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          place.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 30.0,
                            fontFamily: 'Staatliches',
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              const Icon(Icons.calendar_month),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                place.openDays,
                                style: informationTextStyle,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Icon(Icons.watch_later_outlined),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(place.openTime, style: informationTextStyle)
                            ],
                          ),
                          Column(
                            children: [
                              const Icon(Icons.monetization_on_outlined),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(place.ticketPrice, style: informationTextStyle)
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          place.description,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(fontSize: 16.0, fontFamily: 'Oxygen'),
                        )),
                    SizedBox(
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: place.imageUrls.map((url) {
                          return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(url)));
                        }).toList(),
                      ),
                    )
                  ],
                ))));
  }
  
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();

}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
  return  CircleAvatar(backgroundColor: Colors.black26, child:  IconButton(
    icon:  Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: isFavorite ? Colors.pink : Colors.white,),
    onPressed: () {setState(() {
      isFavorite = !isFavorite;
    });},
  ));
  }
}
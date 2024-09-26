
import 'package:flutter/material.dart';
import 'package:wisatabandung/detail_screen.dart';

class MainScreen extends StatelessWidget{
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wisata Bandung"),),
      body: InkWell(onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const DetailScreen();
        }));
      },
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Expanded(flex:1,child: ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.asset('images/farm-house.jpg'),) ),
              const Expanded(flex: 2,child: Padding(padding: EdgeInsets.all(8.0), child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Farm House Lembang',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Lembang'),
                ],
              )),)

            ],
          ),
        ),
      )
    );
  }

}
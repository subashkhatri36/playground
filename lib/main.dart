import 'package:flutter/material.dart';
import 'package:playground/walk_through/model/walk_through_model.dart';
import 'package:playground/walk_through/walk_through_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WalkThroughPage(
        walkThroughList: [
          WalkThroughModel(
            mapImage:
                'https://www.pngplay.com/wp-content/uploads/6/Australia-Map-Flag-Vector-PNG.png',
            image:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRz4AMqZWH-aIJvWRJIVWFYLFT9vwsrHjq1_Yop5oD9jwLotvI4_jm56zuohsudi_ywTYQ&usqp=CAU',
            countryColor: 'blue',
            description:
                'It is not possible other than via a macro. There is an outstanding feature request -- IDEABKL-5806 Automatically trigger code formatter on file save -- for such an action. There a bit of discussion on the ticket you may want to read. I recommend you vote for it. It is however a 4 year old request. And based on comments by JetBrains, it does not appear like it is a high priority item. Additional votes may change that. priority item. Additional votes may change that priority item. Additional votes may change that priority item. Additional votes may change that',
            country: 'Country Name',
          ),
          WalkThroughModel(
            mapImage:
                'https://www.pngplay.com/wp-content/uploads/6/Australia-Map-Flag-Vector-PNG.png',
            image:
                'https://previews.123rf.com/images/ferli/ferli1203/ferli120300112/12809570-felice-studente-di-college-sorridente-con-laptop-isolato-su-sfondo-bianco.jpg',
            countryColor: 'blue',
            description:
                'It is not possible other than via a macro. There is an outstanding feature request -- IDEABKL-5806 Automatically trigger code formatter on file save -- for such an action. There a bit of discussion on the ticket you may want to read. I recommend you vote for it. It is however a 4 year old request. And based on comments by JetBrains, it does not appear like it is a high priority item. Additional votes may change that. priority item. Additional votes may change that priority item. Additional votes may change that priority item. Additional votes may change that',
            country: 'Country Name',
          ),
        ],
        onPressed: () {},
      ),
    );
  }
}

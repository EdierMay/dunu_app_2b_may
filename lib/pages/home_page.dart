import 'package:dunu_app_2b_may/utils/my_tab.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> myTabs = [
    //donutab
    MyTab(
      iconPath: 'lib/icons/icons/donut.png',
    ),
    //burguertab
    MyTab(
      iconPath: 'lib/icons/icons/burger.png',
    ),
    //smooothietab
    MyTab(
      iconPath: 'lib/icons/icons/smoothie.png',
    ),
    //pancaketab
    MyTab(
      iconPath: 'lib/icons/icons/pancakes.png',
    ),
    //pizzatab
    MyTab(
      iconPath: 'lib/icons/icons/pizza.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            //icono izquierdo
            leading: Icon(
              Icons.menu,
              color: Colors.grey[800],
            ),
            //icono derecho
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: Icon(Icons.person),
              )
            ],
          ),
          body: Column(
            children: [
              //texto principal
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
                child: Row(
                  children: [
                    Text("I want to ", style: TextStyle(fontSize: 32)),
                    Text("Eat",
                        style: TextStyle(
                            //tamaño de letra
                            fontSize: 32,
                            //texto en negritas
                            fontWeight: FontWeight.bold,
                            //subrayado
                            decoration: TextDecoration.underline))
                  ],
                ),
              ),
              //tabbar
              TabBar(tabs: myTabs)
              //tabbarview
              //carrito
            ],
          )),
    );
  }
}

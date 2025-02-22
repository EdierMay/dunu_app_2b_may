import 'package:dunu_app_2b_may/utils/donut_Tile.dart';
import 'package:dunu_app_2b_may/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class DonutTab extends StatelessWidget {
 
  // Lista de donas
  final List donutsOnsale =[
    //[donutFlavor, donutPrice, donotColor,imageName]
    ["Ice Cream", "36", Colors.blue, "lib/images/icecream_donut.png"],
    ["Strawberry", "45", Colors.red, "lib/images/strawberry_donut.png"],
    ["Grape Ape", "84", Colors.purple, "lib/images/grape_donut.png"],
    ["Choco", "95", Colors.brown, "lib/images/chocolate_donut.png"],
   
  ];
 
 
  DonutTab({super.key});
 
  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      // elementos en nuestra lista
      itemCount: donutsOnsale.length,
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //numero de columnas
        crossAxisCount: 2),
      itemBuilder: (context, index){
        return DonutTile(
          donutFlavor: donutsOnsale[index][0],
          donutPrice: donutsOnsale[index][1],
          donutColor: donutsOnsale[index][2],
          donutName: donutsOnsale[index][3],
        );
 
      };
    );
  }
}

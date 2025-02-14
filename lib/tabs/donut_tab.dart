import 'package:flutter/material.dart';

class DonutTab extends StatelessWidget {
  //lista de donas
  final List dontsOnSale = [
    //[donutFlavor, donutPrice, donutColor, imagenName]
    ["Ice Cream", "36", Colors.blue, "lib/images/icecream_donut.pgn"],
    ["Strawberry", "45", Colors.red, "lib/images/strawberry_donut.pgn"],
    ["Grape Ape", "84", Colors.purple, "lib/images/grape_donut.pgn"],
    ["Choco", "95", Colors.brown, "lib/images/chocolate_donut.pgn"],
  ];

  DonutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(

      itemCount:donutsOnsale.length,
      padding: const EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //Número de columnas 
        crossAxisCount: crossAxisCount: 2),
      itemBuilder: (context, index) {
        return DonutTile(
          donutFlavor: donutsOnSale[index] [0],
          donutPrice: donutsOnSale[index] [1],
          donutColor: donutsOnSale[index] [2],
          imageName: donutsOnSale[index] [3],

        )
      }
    ) 
      

}

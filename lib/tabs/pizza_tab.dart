import 'package:dunu_app_2b_may/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class PizzaTab extends StatelessWidget {
  final List donutsOnsale = [
    //[donutFlavor, donutStore, donutPrice, donotColor,imageName]
    [
      "Ice Cream",
      "Krispy Kreme",
      "36",
      Colors.blue,
      "lib/images/icecream_donut.png"
    ],
    [
      "Strawberry",
      "Dunkin Donuts",
      "45",
      Colors.red,
      "lib/images/strawberry_donut.png"
    ],
    ["Grape Ape", "Costco", "84", Colors.purple, "lib/images/grape_donut.png"],
    ["Choco", "Walmart", "95", Colors.brown, "lib/images/chocolate_donut.png"],
    [
      "Ice Cream",
      "Krispy Kreme",
      "36",
      Colors.blue,
      "lib/images/icecream_donut.png"
    ],
    [
      "Strawberry",
      "Dunkin Donuts",
      "45",
      Colors.red,
      "lib/images/strawberry_donut.png"
    ],
    ["Grape Ape", "Costco", "84", Colors.purple, "lib/images/grape_donut.png"],
    ["Choco", "Walmart", "95", Colors.brown, "lib/images/chocolate_donut.png"],
  ];
  PizzaTab({super.key});

  @override
  Widget build(BuildContext context) {
    //Para acomodar ellementos en cuadricula //GridView
    return GridView.builder(
      // cuantos elementos tengo
      // elementos en nuestra lista //itemCount
      itemCount: donutsOnsale.length,
      padding: const EdgeInsets.all(8.0),
      //prepa 1: organiza como distribuir elementos en la cuadricula //gridDelegate
      // sliver permite crear listas y scrolls eficientes con efectos personalizados y optimizados //sliver
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //numero de columnas //crossAxisCount
          crossAxisCount: 2,
          //relacion de aspecto (proporcion)
          childAspectRatio: 1 / 1.3),
      itemBuilder: (context, index) {
        return DonutTile(
          donutFlavor: donutsOnsale[index][0],
          donutStore: donutsOnsale[index][1],
          donutPrice: donutsOnsale[index][2],
          donutColor: donutsOnsale[index][3],
          imageName: donutsOnsale[index][4],
        );
      },
    );
  }
}

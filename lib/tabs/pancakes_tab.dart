import 'package:dunu_app_2b_may/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class PancakesTab extends StatelessWidget {
  final List donutsOnsale = [
    //[donutFlavor, donutStore, donutPrice, donotColor,imageName]

    [
      "Classic Pancakes",
      "IHop",
      "36",
      Colors.blue,
      "lib/images/classic_pancakes.png"
    ],
    [
      "Chocolate Pancakes",
      "Denny's",
      "45",
      Colors.brown,
      "lib/images/chocolate_pancakes.png"
    ],
    [
      "Strawberry Pancakes",
      "Pancake House",
      "84",
      Colors.red,
      "lib/images/strawberry_pancakes.png"
    ],
    [
      "Banana Pancakes",
      "Waffle House",
      "95",
      Colors.yellow,
      "lib/images/banana_pancakes.png"
    ],
    [
      "Blueberry Pancakes",
      "Bob Evans",
      "52",
      Colors.blue,
      "lib/images/blueberry_pancakes.png"
    ],
    [
      "Nutella Pancakes",
      "Cracker Barrel",
      "64",
      Colors.brown,
      "lib/images/nutella_pancakes.png"
    ],
    [
      "Cinnamon Pancakes",
      "Perkins",
      "78",
      Colors.orange,
      "lib/images/cinnamon_pancakes.png"
    ],
    [
      "Caramel Pancakes",
      "Village Inn",
      "55",
      Colors.brown,
      "lib/images/caramel_pancakes.png"
    ],
  ];

  final Function addItemToCart;
  PancakesTab({super.key, required this.addItemToCart});

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
        return GestureDetector(
          onTap: () {
            final donut = donutsOnsale[index];
            final donutName = donut[0];
            final donutPrice =
                double.parse(donut[2]); // Convierte el precio a double
            addItemToCart(donutName, donutPrice); // Agrega al carrito
          },
          child: DonutTile(
            donutFlavor: donutsOnsale[index][0],
            donutStore: donutsOnsale[index][1],
            donutPrice: donutsOnsale[index][2],
            donutColor: donutsOnsale[index][3],
            imageName: donutsOnsale[index][4],
            onTap: () {},
          ),
        );
      },
    );
  }
}

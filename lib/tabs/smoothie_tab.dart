import 'package:dunu_app_2b_may/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class SmoothieTab extends StatelessWidget {
  final List donutsOnsale = [
    //[donutFlavor, donutStore, donutPrice, donotColor,imageName]

    [
      "Strawberry Smoothie",
      "Smoothie King",
      "36",
      Colors.red,
      "lib/images/strawberry_smoothie.png"
    ],
    [
      "Mango Smoothie",
      "Jamba Juice",
      "45",
      Colors.orange,
      "lib/images/mango_smoothie.png"
    ],
    [
      "Blueberry Smoothie",
      "Tropical Smoothie",
      "84",
      Colors.blue,
      "lib/images/blueberry_smoothie.png"
    ],
    [
      "Green Smoothie",
      "Pressed Juicery",
      "95",
      Colors.green,
      "lib/images/green_smoothie.png"
    ],

    [
      "Pineapple Smoothie",
      "Naked Juice",
      "52",
      Colors.yellow,
      "lib/images/pineapple_smoothie.png"
    ],
    [
      "Acai Smoothie",
      "Smoothie King",
      "64",
      Colors.purple,
      "lib/images/acai_smoothie.png"
    ],
    [
      "Peach Smoothie",
      "Jamba Juice",
      "78",
      Colors.yellow,
      "lib/images/peach_smoothie.png"
    ],
    [
      "Raspberry Smoothie",
      "Tropical Smoothie",
      "55",
      Colors.pink,
      "lib/images/raspberry_smoothie.png"
    ],
  ];

  final Function addItemToCart;
  SmoothieTab({super.key, required this.addItemToCart});

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
          ),
        );
      },
    );
  }
}

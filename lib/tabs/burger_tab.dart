import 'package:dunu_app_2b_may/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class BurgerTab extends StatelessWidget {
  // Lista de donas
  final List donutsOnsale = [
    //[donutFlavor, donutStore, donutPrice, donotColor,imageName]

    [
      "Cheeseburger",
      "McDonald's",
      "36",
      Colors.yellow,
      "lib/images/cheeseburger.png"
    ],
    [
      "Bacon Burger",
      "Burger King",
      "45",
      Colors.red,
      "lib/images/bacon_burger.png"
    ],
    [
      "Veggie Burger",
      "Costco",
      "84",
      Colors.green,
      "lib/images/veggie_burger.png"
    ],
    [
      "Classic Burger",
      "Walmart",
      "95",
      Colors.brown,
      "lib/images/classic_burger.png"
    ],
    [
      "Mushroom Swiss",
      "Five Guys",
      "52",
      Colors.orange,
      "lib/images/mushroom_swiss_burger.png"
    ],
    [
      "BBQ Burger",
      "Shake Shack",
      "64",
      Colors.deepOrange,
      "lib/images/bbq_burger.png"
    ],
    [
      "Chicken Burger",
      "Chick-fil-A",
      "78",
      Colors.pink,
      "lib/images/chicken_burger.png"
    ],
    [
      "Fish Burger",
      "Hardee's",
      "55",
      Colors.blue,
      "lib/images/fish_burger.png"
    ],
  ];

  final Function addItemToCart;
  BurgerTab({super.key, required this.addItemToCart});

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

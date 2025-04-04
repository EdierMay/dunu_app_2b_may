import 'package:dunu_app_2b_may/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class PizzaTab extends StatelessWidget {
  final List donutsOnsale = [
    //[donutFlavor, donutStore, donutPrice, donotColor,imageName]

    [
      "Margherita Pizza",
      "Domino's",
      "36",
      Colors.red,
      "lib/images/margherita_pizza.png"
    ],
    [
      "Pepperoni Pizza",
      "Papa John's",
      "45",
      Colors.orange,
      "lib/images/pepperoni_pizza.png"
    ],
    [
      "Veggie Pizza",
      "Pizza Hut",
      "84",
      Colors.green,
      "lib/images/veggie_pizza.png"
    ],
    [
      "BBQ Chicken Pizza",
      "Little Caesars",
      "95",
      Colors.brown,
      "lib/images/bbq_chicken_pizza.png"
    ],
    [
      "Hawaiian Pizza",
      "Marco's Pizza",
      "52",
      Colors.yellow,
      "lib/images/hawaiian_pizza.png"
    ],
    [
      "Meat Lovers Pizza",
      "Papa Murphy's",
      "64",
      Colors.redAccent,
      "lib/images/meat_lovers_pizza.png"
    ],
    [
      "Four Cheese Pizza",
      "Blaze Pizza",
      "78",
      Colors.yellowAccent,
      "lib/images/four_cheese_pizza.png"
    ],
    [
      "Supreme Pizza",
      "Round Table Pizza",
      "55",
      Colors.deepPurple,
      "lib/images/supreme_pizza.png"
    ],
  ];

  final Function addItemToCart;
  PizzaTab({super.key, required this.addItemToCart, required void Function(String name, double price) addToCart});

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

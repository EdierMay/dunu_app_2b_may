import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DonutTile extends StatelessWidget {
  final String donutFlavor;
  final String donutStore;
  final String donutPrice;
  //dynamic sera un tipo de color
  final dynamic donutColor;
  final String imageName;
  const DonutTile(
      {super.key,
      required this.donutFlavor,
      required this.donutStore,
      required this.donutPrice,
      this.donutColor,
      required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
            color: donutColor[50], borderRadius: BorderRadius.circular(24)),
        child: Column(
          children: [
            // PriceTag precio de la dona
            Row(
              //alinea a la derecha
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: donutColor[200],
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(24),
                          bottomLeft: Radius.circular(24))),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                  child: Text('\$$donutPrice',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: donutColor[800])),
                )
              ],
            ),

            //Donut Picture imagen de la dona
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 34),
              child: Image.asset(imageName),
            ),

            //donut text, texto de la dona
            Text(donutFlavor,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            SizedBox(
              height: 4,
            ),
            // agregar texto de la tienda
            Text(
              donutStore,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xFFBDBDBD), // Gris para el nombre de la tienda
              ),
            ),
            SizedBox(
              height: 4,
            ),
            //Love icon + add button, icono de me encanta e icono de agregar
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Acción cuando se toca el ícono de corazón
                      print("Corazón tocado");
                    },
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.pink[400],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Acción cuando se toca el texto "Add"
                      print("Texto 'Add' tocado");
                    },
                    child: const Text(
                      "Add",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

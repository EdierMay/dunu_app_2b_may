import 'package:flutter/material.dart';

class DonutTile extends StatelessWidget {
  final String donutFlavor;
  final String donutPrice;
  //dynamic sera un tipo de color
  final dynamic donutColor;
  final String imageName;
  const DonutTile(
      {super.key,
      required this.donutFlavor,
      required this.donutPrice,
      this.donutColor,
      required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: donutColor[100], borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: [
          //PriceTag
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: donutColor[150],
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

          //Donut Picture
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 34),
            child: Image.asset(imageName),
          )

          //Donut text

          //Love icon + and button
        ],
      ),
    );
  }
}

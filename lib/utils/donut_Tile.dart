// ignore: file_names
// ignore: file_names
// ignore: file_names
import 'package:flutter/material.dart';

class DonutTile extends StatelessWidget {
  final String donutFlavor;
  final String donutPrice;
  final String donutStore;
  final Map<int, Color>? donutColor; // Cambio a Map<int, Color>
  final String imageName;
  final VoidCallback onTap;

  const DonutTile(
      {super.key,
      required this.donutFlavor,
      required this.donutPrice,
      this.donutColor,
      required this.imageName,
      required this.donutStore,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
              color: donutColor?[50] ?? Colors.grey, // Manejo de null
              borderRadius: BorderRadius.circular(24)),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: donutColor?[200] ??
                          Colors.grey[300], // Manejo de null
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(24),
                        bottomLeft: Radius.circular(24),
                        topLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                    child: Text(
                      '\$ $donutPrice',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: donutColor?[800] ?? Colors.black),
                    ),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 44),
                child: Image.asset(imageName),
              ),
              Text(
                donutFlavor,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: donutColor?[600] ?? Colors.black),
              ),
              const SizedBox(height: 4),
              Text(
                donutStore,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: donutColor?[200] ?? Colors.black),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      color: Colors.pink[400],
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: Text(
                        "Add",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[800],
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
      ),
    );
  }
}

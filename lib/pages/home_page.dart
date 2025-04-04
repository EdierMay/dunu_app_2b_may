//Utilidades
import 'package:flutter/material.dart';
import 'package:dunu_app_2b_may/common/color_extension.dart';
import 'package:dunu_app_2b_may/common_widget/navigate_drawer.dart';

//Tabs
import 'package:dunu_app_2b_may/tabs/burger_tab.dart';
import 'package:dunu_app_2b_may/tabs/donut_tab.dart';
import 'package:dunu_app_2b_may/tabs/pancakes_tab.dart';
import 'package:dunu_app_2b_may/tabs/pizza_tab.dart';
import 'package:dunu_app_2b_may/tabs/smoothie_tab.dart';
import 'package:dunu_app_2b_may/utils/my_tab.dart';

//Screens
import 'package:dunu_app_2b_may/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: prefer_final_fields
  List<Map<String, dynamic>> _cartItems = [];
  double _totalPrice = 0.0;

  void addToCart(String name, double price) {
    setState(() {
      _cartItems.add({"name": name, "price": price});
      _totalPrice += price;
    });
  }

  List<Widget> myTabs = [
    MyTab(iconPath: 'lib/icons/icons/donut.png'),
    MyTab(iconPath: 'lib/icons/icons/burger.png'),
    MyTab(iconPath: 'lib/icons/icons/smoothie.png'),
    MyTab(iconPath: 'lib/icons/icons/pancakes.png'),
    MyTab(iconPath: 'lib/icons/icons/pizza.png')
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu, color: Colors.grey[800]),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
              child: Row(
                children: [
                  Text("Tengo el deseo de ingerir  \nel sustento vital", style: TextStyle(fontSize: 28)),
                ],
              ),
            ),
            TabBar(tabs: myTabs),
            Expanded(
              child: TabBarView(
                children: [
                  DonutTab(addToCart: addToCart),
                  BurgerTab(addToCart: addToCart),
                  SmoothieTab(addToCart: addToCart, addItemToCart: null,),
                  PancakesTab(addToCart: addToCart, addItemToCart: null,),
                  PizzaTab(addToCart: addToCart, addItemToCart: null,),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      children: [
                        Text(
                          '\${_cartItems.length} Items | \$${_totalPrice.toStringAsFixed(2)}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Delivery Charges Included",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TColor.primary,
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                    ),
                    child: const Text('View Cart', style: TextStyle(color: Colors.white)),
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

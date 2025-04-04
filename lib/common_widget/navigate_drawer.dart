import 'package:flutter/material.dart';
import 'package:dunu_app_2b_may/common/color_extension.dart';

//Screens
import 'package:dunu_app_2b_may/pages/profile_page.dart';
import 'package:dunu_app_2b_may/pages/home_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(),
            child: Center(
              child: SizedBox(
                height: 80,
                child: Image.asset(
                  "lib/icons/icons/Logo_color.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: TColor.secondary),
            title: Text("Inicio"),
            onTap: () {
              context.push(const HomePage());
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart, color: TColor.secondary),
            title: Text("Carrito"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.person, color: TColor.secondary),
            title: Text("Perfil"),
            onTap: () {
              context.push(const ProfileScreen());
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: TColor.secondary),
            title: Text("Configuraciones"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(16),
                  backgroundColor: TColor.primary,
                ),
                child: Icon(Icons.close, color: Colors.white, size: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

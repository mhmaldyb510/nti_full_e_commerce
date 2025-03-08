import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  final ValueChanged<int> onPageChanged;

  const MenuScreen({
    super.key,
    required this.onPageChanged,
  });

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            ListTile(
              tileColor: index == 0 ? Colors.white : Colors.transparent,
              onTap: () {
                setState(() => index = 0);
                widget.onPageChanged(index);
              },
              leading: Icon(
                Icons.home,
                color: index == 0 ? Colors.indigo : Colors.white,
              ),
              title: Text(
                'Home',
                style:
                    TextStyle(color: index == 0 ? Colors.indigo : Colors.white),
              ),
            ),
            ListTile(
              tileColor: index == 1 ? Colors.white : Colors.transparent,
              onTap: () {
                setState(() => index = 1);
                widget.onPageChanged(index);
              },
              leading: Icon(
                Icons.shopping_cart,
                color: index == 1 ? Colors.indigo : Colors.white,
              ),
              title: Text('Cart',
                  style: TextStyle(
                      color: index == 1 ? Colors.indigo : Colors.white)),
            ),
            ListTile(
              tileColor: index == 2 ? Colors.white : Colors.transparent,
              onTap: () {
                setState(() => index = 2);
                widget.onPageChanged(index);
              },
              leading: Icon(
                Icons.favorite,
                color: index == 2 ? Colors.indigo : Colors.white,
              ),
              title: Text('Wishlist',
                  style: TextStyle(
                      color: index == 2 ? Colors.indigo : Colors.white)),
            ),
            ListTile(
              tileColor: index == 3 ? Colors.white : Colors.transparent,
              onTap: () {
                setState(() => index = 3);
                widget.onPageChanged(index);
              },
              leading: Icon(
                Icons.person,
                color: index == 3 ? Colors.indigo : Colors.white,
              ),
              title: Text(
                'Profile',
                style:
                    TextStyle(color: index == 3 ? Colors.indigo : Colors.white),
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}

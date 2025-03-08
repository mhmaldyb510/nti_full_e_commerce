import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:nti_full_e_commerce/features/cart/views/widgets/cart_provider.dart';
import 'package:nti_full_e_commerce/features/home/views/widgets/home_screen_provider.dart';
import 'menu_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({
    super.key,
  });

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final ZoomDrawerController zoomDrawerController = ZoomDrawerController();
  int currentPage = 0;
  List<Widget> pages = [
    const HomeScreenProvider(),
    const CartProvider(id: '01056710052789'),
  ];
  List<String> pageTitles = [
    'Home',
    'Cart',
  ];

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: zoomDrawerController,
      menuScreen: MenuScreen(
        onPageChanged: (page) {
          setState(() => currentPage = page);
          zoomDrawerController.close?.call();
        },
      ),
      mainScreen: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.black,
          leading: IconButton(
            onPressed: () => zoomDrawerController.open?.call(),
            icon: const Icon(Icons.menu),
          ),
          centerTitle: true,
          title: Text(
            pageTitles[currentPage],
          ),
        ),
        body: pages[currentPage],
      ),
      borderRadius: 24.0,
      showShadow: true,
      angle: 0.0,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha(120),
          blurRadius: 24,
          offset: Offset(0, 12),
        ),
      ],
      menuBackgroundColor: Colors.indigo,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.slowMiddle,
      mainScreenTapClose: true,
      menuScreenTapClose: true,
    );
  }
}

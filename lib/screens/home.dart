import 'package:flutter/material.dart';
import 'package:groceries/screens/profile.dart';
import 'package:groceries/screens/favorites.dart';
import 'package:groceries/screens/menu.dart';
import 'package:groceries/screens/shopping_bag.dart';
import 'package:groceries/screens/landing.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    LandingScreen(),
    FavoritesScreen(),
    ShoppingBagScreen(),
    MenuScreen(),
    ProfileScreen(),
  ];

  Widget _buildBottomNav(){
     return Container(
        decoration: BoxDecoration(
          color: Color(0xFFF2F7F2),
          boxShadow: [
            BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, -5),
            ),
          ],
        ),
       child: SafeArea(
         child: Padding(
           padding: const EdgeInsets.symmetric(vertical: 8.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               _buildNavItem(0, Icons.home_outlined),
               _buildNavItem(1, Icons.favorite_border),
               _buildShoppingBagItem(),
               _buildNavItem(3, Icons.menu),
               _buildNavItem(4, Icons.person_outline),
             ],
           ),
         ),
       ),
    );
  }

  Widget _buildNavItem(int index, IconData icon) {
    return IconButton(
      icon: Icon(
        icon,
        color: _selectedIndex == index
            ? Colors.black
            : Colors.black.withOpacity(0.5),
        size: 24,
      ),
        onPressed: () {
          _onItemTapped(index);
        }
    );
  }

  Widget _buildShoppingBagItem() {
    return InkWell(
      onTap: () => _onItemTapped(2),
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: Color(0xFF5CB585),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color(0xFF5CB585).withOpacity(0.3),
              blurRadius: 8,
              spreadRadius: 2,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Icon(
          Icons.shopping_bag_outlined,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNav(),
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
    );
  }
}

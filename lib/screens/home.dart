import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../components/discount_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const _greenColor = Color(0xFF2FAA7A);
  static const _greyBackground = Color(0xFFEAF3ED);
  static const _borderRadius = BorderRadius.all(Radius.circular(12.0));

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();

  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildIconRow() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.filter_list, color: Colors.black),
        Icon(Icons.notifications_none_outlined, color: Colors.black),
      ],
    );
  }

  Widget _buildHeaderText() {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        textAlign: TextAlign.left,
        text: const TextSpan(
          style: TextStyle(fontSize: 32.0, fontFamily: 'Manrope', color: Colors.black),
          children: [
            TextSpan(text: 'Your Pocket', style: TextStyle(color: HomeScreen._greenColor)),
            TextSpan(text: '-Friendly', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: '\nGrocery Shopping', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'search',
              border: const OutlineInputBorder(borderRadius: HomeScreen._borderRadius),
              enabledBorder: const OutlineInputBorder(borderRadius: HomeScreen._borderRadius),
              focusedBorder: OutlineInputBorder(
                borderRadius: HomeScreen._borderRadius,
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.7), width: 2.0),
              ),
              fillColor: Colors.grey[200],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          decoration: const BoxDecoration(
            color: HomeScreen._greenColor,
            borderRadius: HomeScreen._borderRadius,
          ),
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.0),
          child: const Icon(Icons.tune, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildCategoryButton(String text, {bool isActive = false}) {
    return Container(
      decoration: BoxDecoration(
        color: isActive ? HomeScreen._greenColor : Colors.white,
        borderRadius: HomeScreen._borderRadius,
        border: isActive
            ? null
            : Border.all(color: HomeScreen._greenColor, width: 1.5),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      margin: const EdgeInsets.only(right: 8.0),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Manrope',
          color: isActive ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      height: 45,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildCategoryButton('All', isActive: true),
          _buildCategoryButton('Vegetable'),
          _buildCategoryButton('Fruit Item'),
          _buildCategoryButton('Trending'),
        ],
      ),
    );
  }

  Widget _buildDiscountCard() {
    return Container(
      width: 300.0,
      margin: const EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        color: HomeScreen._greyBackground,
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/groceries3.jpg', width: 60.0),
            const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Discount Up To', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
                Text('50%', style: TextStyle(color: HomeScreen._greenColor, fontSize: 40.0, fontWeight: FontWeight.bold)),
                Text('For The Combo Packeg', style: TextStyle(fontSize: 14.0)),
              ],
            ),
            Image.asset('assets/images/groceries3.jpg', width: 60.0),
          ],
        ),
      ),
    );
  }

  Widget _buildDiscountList() {
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) => _buildDiscountCard(),
      ),
    );
  }

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
      onPressed: () => _onItemTapped(index),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
              _buildIconRow(),
              const SizedBox(height: 30),
              _buildHeaderText(),
              const SizedBox(height: 30),
              _buildSearchBar(),
              const SizedBox(height: 20),
              _buildCategoryList(),
              const SizedBox(height: 20),
              Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 180,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: 4,
                        itemBuilder: (context, index) => const DiscountCard(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: 4,
                      effect: const ExpandingDotsEffect(
                        activeDotColor: Color(0xFF2FAA7A),
                        dotHeight: 8,
                        dotWidth: 8,
                        spacing: 6,
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 20,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'Best Offer',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      color: HomeScreen._greenColor
                    )
                  ),
                ]

              ),
              const SizedBox(height: 20,),
              Container(
                color: Colors.white,
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  itemCount: 3, // Number of cards
                  itemBuilder: (context, index) {
                    return Padding(
                      // Only add right padding for all items except the last one
                      padding: EdgeInsets.only(
                          right: index < 2 ? 8.0 : 0.0,
                          left: index > 0 ? 0.0 : 0.0
                      ),
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.asset('assets/images/groceries3.jpg', width: 100.0),
                              SizedBox(height: 10),
                              Container(
                                width: 100,
                                child: Text(
                                  'Chicken Breast Frozen',
                                  style: TextStyle(
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.bold
                                  ),
                                  softWrap: true,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          )
        ),
      ),
    );
  }
}

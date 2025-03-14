import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _greenColor = Color(0xFF2FAA7A);
  static const _greyBackground = Color(0xFFEAF3ED);
  static const _borderRadius = BorderRadius.all(Radius.circular(12.0));

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
            TextSpan(text: 'Your Pocket', style: TextStyle(color: _greenColor)),
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
              border: const OutlineInputBorder(borderRadius: _borderRadius),
              enabledBorder: const OutlineInputBorder(borderRadius: _borderRadius),
              focusedBorder: OutlineInputBorder(
                borderRadius: _borderRadius,
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.7), width: 2.0),
              ),
              fillColor: Colors.grey[200],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          decoration: const BoxDecoration(
            color: _greenColor,
            borderRadius: _borderRadius,
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
        color: isActive ? _greenColor : Colors.white,
        borderRadius: _borderRadius,
        border: isActive
            ? null
            : Border.all(color: _greenColor, width: 1.5),
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
        color: _greyBackground,
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
                Text('50%', style: TextStyle(color: _greenColor, fontSize: 40.0, fontWeight: FontWeight.bold)),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
              _buildDiscountList(),
            ],
          ),
        ),
      ),
    );
  }
}

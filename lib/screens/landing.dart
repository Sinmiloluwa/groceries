import 'package:flutter/material.dart';
import '../components/discount_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  static const _greenColor = Color(0xFF2FAA7A);
  static const _greyBackground = Color(0xFFEAF3ED);
  static const _borderRadius = BorderRadius.all(Radius.circular(12.0));

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                const SizedBox(
                  height: 20,
                ),
                const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Best Offer',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      Text('View All',
                          style: TextStyle(color: LandingScreen._greenColor)),
                    ]),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.white,
                  height: 150,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      itemCount: 3, // Number of cards
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              right: index < 2 ? 8.0 : 0.0,
                              left: index > 0 ? 0.0 : 0.0),
                          child: Card(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.asset('assets/images/groceries3.jpg',
                                      width: 100.0),
                                  SizedBox(height: 10),
                                  Container(
                                    width: 100,
                                    child: Text(
                                      'Chicken Breast Frozen',
                                      style: TextStyle(
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.bold),
                                      softWrap: true,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
          style: TextStyle(
              fontSize: 32.0, fontFamily: 'Manrope', color: Colors.black),
          children: [
            TextSpan(
                text: 'Your Pocket',
                style: TextStyle(color: LandingScreen._greenColor)),
            TextSpan(
                text: '-Friendly',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(
                text: '\nGrocery Shopping',
                style: TextStyle(fontWeight: FontWeight.bold)),
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
              border: const OutlineInputBorder(
                  borderRadius: LandingScreen._borderRadius),
              enabledBorder: const OutlineInputBorder(
                  borderRadius: LandingScreen._borderRadius),
              focusedBorder: OutlineInputBorder(
                borderRadius: LandingScreen._borderRadius,
                borderSide:
                    BorderSide(color: Colors.grey.withOpacity(0.7), width: 2.0),
              ),
              fillColor: Colors.grey[200],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          decoration: const BoxDecoration(
            color: LandingScreen._greenColor,
            borderRadius: LandingScreen._borderRadius,
          ),
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.0),
          child: SizedBox(
            height: 25,
            width: 25,
            child: IconButton(
              icon: const Icon(Icons.tune, color: Colors.white),
              onPressed: () => _showBottomSheet(context),
              alignment: Alignment.center, // Centers the icon
              padding: EdgeInsets.zero,    // Removes default padding
            ),
          )
        ),
      ],
    );
  }

  Widget _buildCategoryButton(String text, {bool isActive = false}) {
    return Container(
      decoration: BoxDecoration(
        color: isActive ? LandingScreen._greenColor : Colors.white,
        borderRadius: LandingScreen._borderRadius,
        border: isActive
            ? null
            : Border.all(color: LandingScreen._greenColor, width: 1.5),
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
        color: LandingScreen._greyBackground,
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
                Text('Discount Up To',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
                Text('50%',
                    style: TextStyle(
                        color: LandingScreen._greenColor,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold)),
                Text('For The Combo Package', style: TextStyle(fontSize: 14.0)),
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

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white, // Custom background color
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: const Text ('Filter', style: TextStyle(fontFamily: 'Manrope', fontSize: 23, fontWeight: FontWeight.bold),),
              ),
              const SizedBox(height: 10,),
              const Text(
                'Categories',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              _buildCategoryList(),
              const SizedBox(height: 10),
              const Text(
                'Gender',
                style: TextStyle(fontSize: 20),
              ),
            SizedBox(
              height: 45,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCategoryButton('All', isActive: true),
                  _buildCategoryButton('Man'),
                  _buildCategoryButton('Woman'),
                ],
              ),
            ),
              const SizedBox(height: 10),
              const Text(
                'Store By',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 45,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategoryButton('popular', isActive: true),
                    _buildCategoryButton('most recent'),
                    _buildCategoryButton('price high'),
                  ],
                ),
              ),
              const Text(
                'Rating',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 45,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategoryButton( '🌟All', isActive: true),
                    _buildCategoryButton('🌟5'),
                    _buildCategoryButton('🌟4'),
                    _buildCategoryButton('🌟3'),
                    _buildCategoryButton('🌟2'),
                    _buildCategoryButton('🌟1'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: LandingScreen._greenColor,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20)
                      ),
                      child: const Text('Cancel', style: TextStyle(
                          color: Colors.white
                      ),)
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: LandingScreen._greenColor,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20)
                      ),
                      child: const Text('Confirm', style: TextStyle(
                        color: Colors.white
                      ),)
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<String> _menuList = ['one', 'two', 'three', 'four'];
  String? dropdownValue; // Initialize correctly

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              AppBar(
                leading: Navigator.canPop(context)
                    ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                )
                    : null,
                title: const Text('Profile'),
              ),
              const SizedBox(height: 15),
              Container(
                width: 60.0,
                height: 60.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/groceries3.jpg',
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Jon Braham',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatCard('1.25k', 'Total Order'),
                  _buildStatCard('56', 'Order Cancel'),
                  _buildStatCard('258', 'Order Pending'),
                ],
              ),
              const SizedBox(height: 10),
              _buildDropDown('Edit Profile', Icons.person_add),
              _buildDropDown('Setting', Icons.settings),
              _buildDropDown('Payment Method', Icons.payment),
              _buildDropDown('Security', Icons.security),
              _buildDropDown('Language', Icons.language),
              const SizedBox(height: 20,),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Icon(Icons.logout,color: Colors.red,),
                      ),
                      const SizedBox(width: 2,),
                      Text('Log out', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 15, fontFamily: 'Manrope'),)
                    ],
                  )
                 
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String count, String label) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: Colors.black12,
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.01),
            blurRadius: 2.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            count,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropDown(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black12, // Bottom border color
            width: 1.0, // Border thickness
          ),
        ),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        value: dropdownValue,
        hint: Row(
          children: [
            Icon(icon, size: 20, color: Colors.black),
            SizedBox(width: 10),
            Text(text, style: const TextStyle(color: Colors.black)),
          ],
        ),
        underline: const SizedBox(), // Removes default underline
        onChanged: (String? value) {
          setState(() {
            dropdownValue = value!;
          });
        },
        items: _menuList
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
              value: value,
              child: Text(value)
          );
        }).toList(),
      ),
    );
  }
}



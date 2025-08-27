import 'package:flutter/material.dart';

import '../../../core/app_colors.dart'; // make sure mainColor is defined here
import '../../../feature/Tasks/presentation/screens/home_screen/home_screen.dart';
import '../../../feature/quote/view/screen/qoute_screen/qoute_screen.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  final List<Map<String, dynamic>> screens = [
    {"title": "To Do", "screen": HomeScreen()},
    {"title": "Quotes", "screen": QouteScreen()},
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          screens[currentIndex]["title"],
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600,color: Colors.white),
        ),
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(child: screens[currentIndex]["screen"]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_quote_rounded),
            label: "Quotes",
          ),
        ],
      ),
    );
  }
}

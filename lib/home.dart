import 'package:flutter/material.dart';
import 'package:solar_flutter/daily.dart';
import 'package:solar_flutter/realtime.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Buttom Navigation Bar',
      home: Scaffold(
        body: const [
          Center(
            child: Realtime(),
          ),
          Center(
            child: Daily(),
          ),
          Center(
            child: Text(
              'Settings',
            ),
          ),
        ][selectedPageIndex],
        bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.orange[200],
        selectedIndex: selectedPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              selectedPageIndex = index;
            });
          },
          destinations: const <NavigationDestination>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.sunny),
              icon: Icon(Icons.wb_sunny_outlined),
              label: 'Daily',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.settings),
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:html';

import 'package:coffee_app_ui/util/coffee_tile.dart';
import 'package:coffee_app_ui/util/drink_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List of drink or coffee types
  final List drinkType = [
    // Format: [drink, value]
    [
      'Coffee',
      true,
    ],
    [
      'Mocktails',
      false,
    ],
    [
      'Beer',
      false,
    ],
    [
      'Tea',
      false,
    ],
    [
      'Snacks',
      false,
    ],
  ];

  // User event for tapping on listview
  void drinkTypeSelected(int index) {
    setState(() {
      // Falsify every listview selection
      for (int i = 0; i < drinkType.length; i++) {
        drinkType[i][1] = false;
      }
      drinkType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
        ],
      ),
      body: Column(children: [
        // Find the best coffee for you
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            "Find the Best Coffee For You",
            style: GoogleFonts.bebasNeue(
              fontSize: 55,
            ),
          ),
        ),

        SizedBox(height: 25),

        // Search Bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Get caffeinated...',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600),
              ),
            ),
          ),
        ),

        SizedBox(height: 25),

        // Horizontal listview of coffee types
        Container(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: drinkType.length,
            itemBuilder: (context, index) {
              return DrinkType(
                drinkType: drinkType[index][0],
                isSelected: drinkType[index][1],
                onTap: () {
                  drinkTypeSelected(index);
                },
              );
            },
          ),
        ),

        // Horizontal listview of coffee containers
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeeTile(
                drinkImagePath: 'lib/images/kwon-junho_latte.jpg',
                drinkName: 'Latte',
                drinkPrice: '24.K',
              ),
              CoffeeTile(
                drinkImagePath: 'lib/images/kwon-junho_macchiato.jpg',
                drinkName: 'Macchiato',
                drinkPrice: '26.K',
              ),
              CoffeeTile(
                drinkImagePath: 'lib/images/one-zen_americano.jpg',
                drinkName: 'Americano',
                drinkPrice: '22.K',
              ),
              CoffeeTile(
                drinkImagePath: 'lib/images/guy-kavanagh_espresso.jpg',
                drinkName: 'Espresso',
                drinkPrice: '18.K',
              ),
              CoffeeTile(
                drinkImagePath: 'lib/images/oak-bond-coffee-co_beer-glass.jpg',
                drinkName: 'Coffee Beer',
                drinkPrice: '16.K',
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

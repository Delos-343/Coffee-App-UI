// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DrinkType extends StatelessWidget {
  final String drinkType;
  final bool isSelected;
  final VoidCallback onTap;

  DrinkType({
    required this.drinkType,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Text(
          drinkType,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.orange : Colors.grey[500],
          ),
        ),
      ),
    );
  }
}

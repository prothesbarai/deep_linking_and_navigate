import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const CustomBottomBar({super.key, required this.currentIndex, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      color: Color(0xff40c2e2),
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            IconButton(
              icon: const Icon(Icons.category),
              color: currentIndex == 0 ? Colors.white : Colors.white70,
              onPressed: () => onTap(0),
            ),

            IconButton(
              icon: const Icon(Icons.card_membership),
              color: currentIndex == 1 ? Colors.white : Colors.white70,
              onPressed: () => onTap(1),
            ),

            const SizedBox(width: 40),

            IconButton(
              icon: const Icon(Icons.message),
              color: currentIndex == 2 ? Colors.white : Colors.white70,
              onPressed: () => onTap(2),
            ),

            IconButton(
              icon: const Icon(Icons.dashboard),
              color: currentIndex == 3 ? Colors.white : Colors.white70,
              onPressed: () => onTap(3),
            ),
          ],
        ),
      ),
    );
  }
}

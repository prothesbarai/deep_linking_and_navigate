import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const CustomBottomBar({super.key, required this.currentIndex, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        elevation: 0,
        selectedItemColor: Colors.red,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.card_membership), label: "Membership"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Message"),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Dashboard"),
        ]
    );
  }
}


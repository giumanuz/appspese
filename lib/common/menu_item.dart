import 'package:flutter/material.dart';

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  static const List<MenuItem> firstItems = [
    MenuItem(text: 'Vacanza in Sardegna', icon: Icons.sunny),
    MenuItem(text: 'Vacanza in Giappone', icon: Icons.sunny),
    MenuItem(text: 'Vacanza a Gallipoli', icon: Icons.sunny),
  ];
  static const List<MenuItem> secondItems = [
    MenuItem(text: 'Settings', icon: Icons.settings),
    MenuItem(text: 'Log Out', icon: Icons.logout),
  ];

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: const Color(0xFFEEEEEE), size: 22),
        const SizedBox(
          width: 10,
        ),
        Text(
          item.text,
          style: const TextStyle(
            color: Color(0xFFEEEEEE),
          ),
        ),
      ],
    );
  }

  static onChanged(BuildContext context, MenuItem item) {
    if (item.text == 'Log Out') {
      //TODO: implement logout
    } else if (item.text == 'Settings') {
      //TODO: implement settings
    } else {
      //TODO: implement holiday
    }
  }
}

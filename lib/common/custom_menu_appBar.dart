import 'package:appspese/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:appspese/common/menu_item.dart';

class CustomButtonTest extends StatefulWidget {
  const CustomButtonTest({Key? key}) : super(key: key);

  @override
  State<CustomButtonTest> createState() => _CustomButtonTestState();
}

class ShowMenuCustom extends StatelessWidget {
  const ShowMenuCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ...MenuItems.firstItems
                .map((item) => buildCustomMenuItem(item))
                .toList(),
            const SizedBox(
              height: 10,
            ),
            ...MenuItems.secondItems
                .map((item) => buildCustomMenuItem(item))
                .toList(),
          ],
        ),
      ),
    );
  }

  buildCustomMenuItem(MenuItem item) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Icon(item.icon, color: const Color(0xFFEEEEEE), size: 15),
          const SizedBox(
            width: 10,
          ),
          Text(
            item.text,
            style: TextStyle(
              color: Colors.grey[800],
              fontFamily: 'Oxygen-Regular',
              fontSize: 15,
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomButtonTestState extends State<CustomButtonTest> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return ShowMenuCustom();
          },
        );
      },
      icon: Icon(
        Icons.list,
        color: Colors.grey[800],
        size: 30,
      ),
    );
  }
}

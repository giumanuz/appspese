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
    int heightSingleItem = 60;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 56, 20, 0),
        child: Container(
          height: (MenuItems.secondItems.length + MenuItems.firstItems.length) *
                  heightSingleItem +
              10,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey[300]!,
              width: 3,
            ),
            shape: BoxShape.rectangle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.grey[200]!,
                Colors.grey[300]!,
              ],
            ),
          ),
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            children: [
              ...MenuItems.firstItems
                  .map((item) => buildCustomMenuItem(item))
                  .toList(),
              ...MenuItems.secondItems
                  .map((item) => buildCustomMenuItem(item))
                  .toList(),
            ],
          ),
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

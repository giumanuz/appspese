import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CustomButtonTest extends StatefulWidget {
  const CustomButtonTest({Key? key}) : super(key: key);

  @override
  State<CustomButtonTest> createState() => _CustomButtonTestState();
}

class _CustomButtonTestState extends State<CustomButtonTest> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        dropdownWidth: 200,
        isExpanded: true,
        customButton: Center(
            child: Icon(
          Icons.list,
          size: 30,
          color: Colors.grey[800],
        )),
        customItemsHeights: [
          ...List<double>.filled(MenuItems.firstItems.length, 48),
          8,
          ...List<double>.filled(MenuItems.secondItems.length, 48),
        ],
        items: [
          ...MenuItems.firstItems.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems(item),
            ),
          ),
          const DropdownMenuItem<Divider>(enabled: false, child: Divider()),
          ...MenuItems.secondItems.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems(item),
            ),
          ),
        ],
        onChanged: (value) {
          MenuItems.onChanged(context, value as MenuItem);
        },
        itemHeight: 48,
        itemPadding: const EdgeInsets.symmetric(horizontal: 10),
        dropdownPadding: const EdgeInsets.only(),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.redAccent,
        ),
        dropdownElevation: 8,
        offset: const Offset(0, 12.5),
      ),
    );
  }
}

class MenuItem {
  final GlobalKey state = GlobalKey();
  final String text;
  final IconData icon;

  MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems extends StatelessWidget {
  static List<MenuItem> firstItems = [
    MenuItem(text: 'Vacanza in Sardegna', icon: Icons.sunny),
    MenuItem(text: "Vacanza in Giappo", icon: Icons.sunny),
    MenuItem(text: 'Vacanza a Gallipoli', icon: Icons.sunny),
  ];
  static List<MenuItem> secondItems = [
    MenuItem(text: 'Aggiungi viaggio', icon: Icons.add_circle_outline),
    MenuItem(text: 'Settings', icon: Icons.settings),
    MenuItem(text: 'Log Out', icon: Icons.logout),
  ];
  final MenuItem item;
  const MenuItems(this.item, {super.key});

  static onChanged(BuildContext context, MenuItem item) {
    if (item.text == 'Log Out') {
      //TODO: implement logout
    } else if (item.text == 'Settings') {
      //TODO: implement settings
    } else {
      //TODO: implement holiday
    }
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return Dismissible(
        key: item.state,
        onDismissed: (onDismissed) {
          print("dismissed");
        },
        child: Container(
            width: 180,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(item.icon, color: Colors.white, size: 20)),
                SizedBox(
                  width: 150,
                  child: Text(
                    item.text,
                    maxLines: 1,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Colors.white, overflow: TextOverflow.ellipsis),
                  ),
                ),
                const Spacer()
                // ValueNotifier(_value)
                // ValueListenableBuilder(valueListenable: valueListenable, builder: builder)
              ],
            )));
  }
}

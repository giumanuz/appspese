import 'package:appspese/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:appspese/common/menu_item.dart';

class CustomButtonTest extends StatefulWidget {
  const CustomButtonTest({Key? key}) : super(key: key);

  @override
  State<CustomButtonTest> createState() => _CustomButtonTestState();
}

class _CustomButtonTestState extends State<CustomButtonTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            customButton: const Icon(
              Icons.list,
              size: 46,
              color: Color(0xFF424242),
            ),
            //customItemsHeights: [],
            items: [
              // MenuItems.firstItems
              //     .map(
              //       (item) => DropdownMenuItem(
              //         value: item,
              //         child: MenuItems.buildItem(item),
              //       ),
              //     )
              //     .toList(),
              // const DropdownMenuItem(enabled: false, child: Divider()),
              // MenuItems.secondItems
              //     .map((item) => DropdownMenuItem(
              //           value: item,
              //           child: MenuItems.buildItem(item),
              //         ))
              //     .toList(),
            ],
            onChanged: (value) {
              MenuItems.onChanged(context, value as MenuItem);
            },
            itemHeight: 48,
            itemPadding: const EdgeInsets.only(left: 16, right: 16),
            dropdownWidth: 160,
            dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.grey[600],
            ),
            dropdownElevation: 8,
            offset: const Offset(0, 8),
          ),
        ),
      ),
    );
  }
}

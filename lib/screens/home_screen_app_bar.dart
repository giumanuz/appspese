import 'package:flutter/material.dart';
import 'package:appspese/common/menu_item.dart';

class HomeScreenAppBar extends StatelessWidget with PreferredSizeWidget {
  final String holidayName;

  const HomeScreenAppBar(this.holidayName, {Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: textHolidayName(),
      centerTitle: true,
      backgroundColor: Colors.grey[400],
      elevation: 0.0,
      leading: CustomButtonTest(),
    );
  }

  Text textHolidayName() {
    return Text(
      holidayName,
      style: TextStyle(
        color: Colors.grey[800],
        fontSize: 20.0,
        fontFamily: 'Oxygen-Regular',
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

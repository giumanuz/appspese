import 'package:flutter/material.dart';

import 'package:appspese/common/custom_menu_appBar.dart';

class HomeScreenAppBar extends StatelessWidget with PreferredSizeWidget {
  final String holidayName;

  const HomeScreenAppBar(this.holidayName, {Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: textHolidayName(),
      centerTitle: true,
      backgroundColor: Colors.grey[400],
      elevation: 0.0,
      leading: ShowMenuCustom(),
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
}

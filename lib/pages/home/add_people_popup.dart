import 'package:flutter/material.dart';

import 'package:appspese/common/custom_dialog.dart';

class AddPeoplePopUp extends StatefulWidget {
  const AddPeoplePopUp({Key? key}) : super(key: key);

  @override
  State<AddPeoplePopUp> createState() => _AddPeoplePopUpState();
}

class _AddPeoplePopUpState extends State<AddPeoplePopUp> {
  @override
  Widget build(BuildContext context) {
    return const CustomDialog();
  }
}

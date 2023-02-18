import 'package:appspese/common/constants.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:appspese/common/drop_down_box.dart';
import 'package:appspese/common/personalCard.dart';
import 'package:spinner_date_time_picker/spinner_date_time_picker.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({Key? key}) : super(key: key);

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  List<String> listaNomi = [];
  riempiLista() {
    for (int i = 0; i < esempioCards.length; i++) {
      listaNomi.add(esempioCards[i].name);
    }
  }

  late String choosedFrom;
  final amountString = TextEditingController();
  int amount = 0;
  String category = 'Discoteca';
  String data = '';
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    data = '${today.day}/${today.month}/${today.year}';

    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: Text(
          'Aggiungi Spesa',
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: 20.0,
            fontFamily: 'Oxygen-Regular',
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            size: 36,
          ),
          color: Colors.grey[800],
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              //TODO: aggiungi azione
            },
            icon: const Icon(
              Icons.check,
              size: 28,
            ),
            color: Colors.green[800],
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            child: Center(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                  child: DropdownButtonFormField2(
                    decoration: InputDecoration(
                      //Add isDense true and zero Padding.
                      //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      //Add more decoration as you want here
                      //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                    ),
                    isExpanded: true,
                    hint: const Text(
                      'Selezione il pagante',
                      style: TextStyle(fontSize: 14),
                    ),
                    icon: const Icon(
                      Icons.person,
                      color: Colors.black45,
                    ),
                    iconSize: 30,
                    buttonHeight: 60,
                    buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    items: esempioCards
                        .map((item) => DropdownMenuItem<String>(
                              value: item.name,
                              child: Text(
                                item.name,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Per favore, seleziona il pagante.';
                      }
                    },
                    onChanged: (value) {
                      //Do something when changing the item if you want.
                    },
                    onSaved: (value) {
                      choosedFrom = value.toString();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                  child: DropdownButtonFormField2(
                    decoration: InputDecoration(
                      //Add isDense true and zero Padding.
                      //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      //Add more decoration as you want here
                      //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                    ),
                    isExpanded: true,
                    hint: const Text(
                      'Seleziona la categoria',
                      style: TextStyle(fontSize: 14),
                    ),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 30,
                    buttonHeight: 60,
                    buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    items: esempioCards
                        .map((item) => DropdownMenuItem<String>(
                              value: item.name,
                              child: Text(
                                item.name,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select gender.';
                      }
                    },
                    onChanged: (value) {
                      //Do something when changing the item if you want.
                    },
                    onSaved: (value) {
                      choosedFrom = value.toString();
                    },
                  ),
                ),
              ]),
            ),
          )),
    );
  }
}

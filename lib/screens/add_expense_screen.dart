import 'package:appspese/common/constants.dart';
import 'package:flutter/material.dart';

import 'package:appspese/common/personalCard.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({Key? key}) : super(key: key);

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  String choosedFrom = esempioCards[0].name;
  int amount = 0;
  String category = 'Discoteca';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(
            Icons.chevron_left,
            size: 36,
          ),
          color: Colors.grey[800],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.check,
              size: 28,
            ),
            color: Colors.green[800],
          ),
        ],
      ),
      body: Scaffold(
        backgroundColor: Colors.grey[800],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            child: Column(
              children: [
                DropdownButtonFormField(
                  items: esempioCards.map((PersonalCard card) {
                    return DropdownMenuItem(
                      value: card.name,
                      child: Text(card.name),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    choosedFrom = value!;
                  },
                  value: choosedFrom,
                  decoration: InputDecoration(
                    labelText: 'Seleziona il nome',
                    labelStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey[400]!,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey[400]!,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Inserisci l'importo in euro",
                    labelStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey[400]!,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey[400]!,
                      ),
                    ),
                  ),
                  onSaved: (String? value) {
                    String valueWithoutDot = value!.replaceAll('.', '');
                    amount = int.parse(valueWithoutDot);
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Inserisci un importo';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField(
                    items: categoriesToIcon.keys.map((String category) {
                      return DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      category = value!;
                    },
                    value: category,
                    decoration: InputDecoration(
                      labelText: 'Seleziona la categoria',
                      labelStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey[400]!,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey[400]!,
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:appspese/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:appspese/common/drop_down_box.dart';
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
          child: Column(
            children: [
              const SizedBox(height: 40.0),
              FormField(
                builder: (FormFieldState state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Seleziona il nome',
                      labelStyle: TextStyle(
                        color: Colors.grey[400],
                        fontFamily: 'Oxygen-Regular',
                        fontSize: 20.0,
                      ),
                      icon: const Icon(Icons.person, color: Color(0xFFE57373)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[400]!),
                        gapPadding: 10.0,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    isEmpty: choosedFrom == '',
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        isDense: true,
                        dropdownColor: Colors.grey[600], //colore sfondo popup
                        iconSize: 30.0,
                        iconEnabledColor: Color(0xFFE57373),
                        enableFeedback: true,
                        elevation: 10,
                        itemHeight: 70.0,
                        icon: const Icon(Icons.arrow_drop_down),
                        items: esempioCards.map((PersonalCard card) {
                          return DropdownMenuItem(
                            key: Key(card.name),
                            value: card.name,
                            alignment: Alignment.centerLeft,
                            enabled: true,
                            child: Text(
                              card.name,
                              style: TextStyle(
                                color: Colors.grey[200],
                                fontFamily: 'Oxygen-Regular',
                                fontSize: 23.0,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            choosedFrom = value!;
                          });
                        },
                        value: choosedFrom,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 40.0),
              FormField(
                builder: (FormFieldState state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                      labelText: "Seleziona l'importo",
                      labelStyle: TextStyle(
                        color: Colors.grey[400],
                        fontFamily: 'Oxygen-Regular',
                        fontSize: 20.0,
                      ),
                      icon: const Icon(Icons.euro, color: Color(0xFFE57373)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[400]!),
                        gapPadding: 10.0,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    isEmpty: amount == 0,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onSaved: (String? value) {
                        String valueWithoutDot = value!.replaceAll('.', '');
                        valueWithoutDot = valueWithoutDot.replaceAll(',', '');
                        amount = int.parse(valueWithoutDot);
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Inserisci un importo';
                        }
                        return null;
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 40.0),
              FormField(
                builder: (FormFieldState state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Seleziona la categoria',
                      labelStyle: TextStyle(
                        color: Colors.grey[400],
                        fontFamily: 'Oxygen-Regular',
                        fontSize: 20.0,
                      ),
                      icon:
                          const Icon(Icons.category, color: Color(0xFFE57373)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[400]!),
                        gapPadding: 10.0,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    isEmpty: category == '',
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        isDense: true,
                        dropdownColor: Colors.grey[600], //colore sfondo popup
                        iconSize: 30.0,
                        iconEnabledColor: Color(0xFFE57373),
                        enableFeedback: true,
                        elevation: 10,
                        itemHeight: 70.0,
                        icon: const Icon(Icons.arrow_drop_down),
                        items: categoriesToIcon.keys.map((String categoryName) {
                          return DropdownMenuItem(
                            value: categoryName,
                            alignment: Alignment.centerLeft,
                            enabled: true,
                            child: Text(
                              categoryName,
                              style: TextStyle(
                                color: Colors.grey[200],
                                fontFamily: 'Oxygen-Regular',
                                fontSize: 23.0,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            category = value!;
                          });
                        },
                        value: category,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

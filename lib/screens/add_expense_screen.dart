import 'package:appspese/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:appspese/common/drop_down_box.dart';
import 'package:appspese/common/personalCard.dart';
import 'package:spinner_date_time_picker/spinner_date_time_picker.dart';
import 'package:intl/intl.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({Key? key}) : super(key: key);

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  String choosedFrom = esempioCards[0].name;
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
              addImportBox(),
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
              const SizedBox(height: 40.0),
              selectDateBox(context),
              const SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }

  FormField<dynamic> selectDateBox(BuildContext context) {
    return FormField(
      builder: (FormFieldState state) {
        return InputDecorator(
          decoration: InputDecoration(
            labelText: 'Seleziona la data',
            labelStyle: TextStyle(
              color: Colors.grey[400],
              fontFamily: 'Oxygen-Regular',
              fontSize: 20.0,
            ),
            icon: const Icon(Icons.date_range, color: Color(0xFFE57373)),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]!),
              gapPadding: 10.0,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          isEmpty: data == '',
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              alignment: Alignment.center,
              backgroundColor: Colors.grey[700],
              animationDuration: const Duration(milliseconds: 500),
              elevation: 10.0,
              foregroundColor: Colors.grey[200],
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              textStyle: const TextStyle(
                fontSize: 20.0,
                fontFamily: 'Oxygen-Regular',
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      backgroundColor: Colors.grey[400],
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      insetAnimationCurve: Curves.bounceIn,
                      insetPadding: const EdgeInsets.symmetric(vertical: 20.0),
                      shadowColor: Colors.grey[800],
                      child: SpinnerDateTimePicker(
                        minimumDate: DateTime(today.year - 100, 12, 31),
                        initialDateTime: DateTime.now(),
                        maximumDate: DateTime.now(),
                        didSetTime: (DateTime dateChoosen) {
                          String giorno = dateChoosen.day.toString();
                          String mese = dateChoosen.month.toString();
                          String anno = dateChoosen.year.toString();
                          setState(() {
                            data = '$giorno/$mese/$anno';
                            //TODO: chiedere a Valerio se e' possibile cambaire i tasti dello Spinner e come si salva la data
                          });
                        },
                      ),
                    );
                  });
            },
            child: Text(data),
          ),
        );
      },
    );
  }

  TextFormField addImportBox() {
    return TextFormField(
      style: TextStyle(
        color: Colors.grey[200],
        fontFamily: 'Oxygen-Regular',
        fontSize: 20.0,
      ),
      controller: amountString,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            amountString.clear();
          },
          icon: const Icon(Icons.clear),
          color: Color(0xFFE57373),
        ),
        labelText: 'Inserisci l\'importo',
        labelStyle: TextStyle(
          color: Colors.grey[400],
          fontFamily: 'Oxygen-Regular',
          fontSize: 20.0,
        ),
        icon: const Icon(Icons.attach_money, color: Color(0xFFE57373)),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[400]!),
          gapPadding: 10.0,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      onSaved: (String? value) {
        int count = 0;
        for (int i = 0; i < value!.length; i++) {
          if (value[i] == '.' || value[i] == ',') {
            count = value.length - i - 1;
            break;
          }
        }
        String valueWithoutDot = value!.replaceAll('.', '');
        valueWithoutDot = valueWithoutDot.replaceAll(',', '');
        amount = int.parse(valueWithoutDot);
        if (count == 1) {
          amount *= 10;
        } else if (count == 0) {
          amount *= 100;
        }
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Inserisci un importo'; //TODO: aggiungi messaggio di errore
        }
        return null;
      },
    );
  }
}

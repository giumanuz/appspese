import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  final List<String> genderItems = [
    'Maschio',
    'Femmina',
  ];

  final addPersoName = TextEditingController();
  String addedPerson = '';
  String selectedGender = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width - 40,
          height: 250,
          decoration: const BoxDecoration(
            color: Color(0xFFEEEEEE),
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Aggiungi persona',
                style: TextStyle(
                  color: Color(0xFF424242),
                  fontSize: 24.0,
                  fontFamily: 'Oxygen-Regular',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 3, 20, 20),
                child: TextFormField(
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  onChanged: (text) {
                    addedPerson = text;
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        addPersoName.clear();
                      },
                      icon: const Icon(Icons.clear),
                      color: Color(0xFFE57373),
                    ),
                    border: InputBorder.none,
                    hintText: 'Inserisci il nome',
                    hintStyle: const TextStyle(
                      color: Color(0xFF424242),
                      fontSize: 20.0,
                      fontFamily: 'Oxygen-Regular',
                    ),
                    alignLabelWithHint: true,
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    constraints: const BoxConstraints(
                      maxHeight: 30,
                    ),
                    counterStyle: const TextStyle(
                      color: Color(0xFF424242),
                      fontSize: 20.0,
                      fontFamily: 'Oxygen-Regular',
                    ),
                  ),
                  controller: addPersoName,
                  style: const TextStyle(
                    color: Color(0xFF424242),
                    fontSize: 20.0,
                    fontFamily: 'Oxygen-Regular',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                child: DropdownButtonFormField2(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  isExpanded: true,
                  hint: const Text(
                    'Seleziona il genere',
                    style: TextStyle(
                      color: Color(0xFF424242),
                      fontSize: 20.0,
                      fontFamily: 'Oxygen-Regular',
                    ),
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Color(0xFF424242),
                  ),
                  iconSize: 30,
                  buttonHeight: 60,
                  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[200],
                    shape: BoxShape.rectangle,
                  ),
                  items: genderItems
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(item,
                                style: const TextStyle(
                                  color: Color(0xFF424242),
                                  fontSize: 20.0,
                                  fontFamily: 'Oxygen-Regular',
                                )),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Per favore, seleziona il genere';
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value.toString();
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Annulla',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 18.0,
                          fontFamily: 'Oxygen-Regular',
                        ),
                      )),
                  TextButton(
                      onPressed: () {
                        if (addedPerson != '' && selectedGender != '') {
                          Navigator.pop(context, {
                            'name': addedPerson,
                            'sesso': selectedGender == 'Maschio' ? 0 : 1,
                          });
                        }
                      },
                      child: const Text(
                        'Aggiungi',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 18.0,
                          fontFamily: 'Oxygen-Regular',
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

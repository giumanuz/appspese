import 'package:flutter/material.dart';

class AddPeoplePopUp extends StatefulWidget {
  const AddPeoplePopUp({Key? key}) : super(key: key);

  @override
  State<AddPeoplePopUp> createState() => _AddPeoplePopUpState();
}

class _AddPeoplePopUpState extends State<AddPeoplePopUp> {
  String addedPerson = '';
  int sesso = 0;

  TextField inputFormAddPerson() {
    return TextField(
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Inserisci il nome',
      ),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18.0,
        fontFamily: 'Oxygen-Regular',
      ),
      onChanged: (text) {
        addedPerson = text;
      },
    );
  }

  TextButton annullaButton(BuildContext context) {
    return TextButton(
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
        ));
  }

  TextButton aggiungiButton() {
    return TextButton(
        onPressed: () {
          if (addedPerson != '') {
            Navigator.pop(context, {
              'name': addedPerson,
              'sesso': sesso,
            });
          }
        },
        child: const Text(
          'Aggiungi',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 18.0,
            fontFamily: 'Oxygen-Regular',
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Aggiungi persona',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
          fontFamily: 'Oxygen-Regular',
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [inputFormAddPerson(), choosingGenrePerson()],
      ),
      alignment: Alignment.center,
      actions: [
        annullaButton(context),
        aggiungiButton(),
      ],
    );
  }

  Row choosingGenrePerson() {
    return Row(children: [
      Flexible(
        flex: 1,
        child: ListTile(
          title: const Text(
            'M',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.0,
              fontFamily: 'Oxygen-Regular',
            ),
          ),
          leading: Radio(
            value: 0,
            groupValue: sesso,
            onChanged: (value) {
              setState(() {
                sesso = value as int;
              });
            },
          ),
        ),
      ),
      Flexible(
        flex: 1,
        child: ListTile(
          title: const Text(
            'F',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.0,
              fontFamily: 'Oxygen-Regular',
            ),
          ),
          leading: Radio(
            value: 1,
            groupValue: sesso,
            onChanged: (value) {
              setState(() {
                sesso = value as int;
              });
            },
          ),
        ),
      ),
    ]);
  }
}

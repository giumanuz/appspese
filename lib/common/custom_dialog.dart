import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  final addPersoName = TextEditingController();

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
              TextFormField(
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
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.only(left: 10),
                  constraints: BoxConstraints(
                    maxHeight: 30,
                  ),
                  counterStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontFamily: 'Oxygen-Regular',
                  ),
                ),
                controller: addPersoName,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontFamily: 'Oxygen-Regular',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                    'M',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontFamily: 'Oxygen-Regular',
                    ),
                  ),
                  Text(
                    'F',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontFamily: 'Oxygen-Regular',
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Annulla',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 18.0,
                          fontFamily: 'Oxygen-Regular',
                        ),
                      )),
                  TextButton(
                      onPressed: () {},
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

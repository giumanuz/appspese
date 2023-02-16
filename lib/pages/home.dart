import 'package:appspese/common/my_card.dart';
import 'package:flutter/material.dart';
import 'package:appspese/services/personalCard.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<PersonalCard> cards = [
    PersonalCard(
      name: 'Giuliu',
      amount: 0.00,
      photo: 'man.png',
    ),
    PersonalCard(
      name: 'Cats',
      amount: 0.00,
      photo: 'women.png',
    ),
    PersonalCard(
      name: 'EdoTM',
      amount: 0.00,
      photo: 'man.png',
    ),
    PersonalCard(
      name: 'Daniele',
      amount: -2.265,
      photo: 'man.png',
    ),
    PersonalCard(
      name: 'Er Capretta',
      amount: 0.00,
      photo: 'women.png',
    ),
    PersonalCard(
      name: 'VMC',
      amount: 0.00,
      photo: 'man.png',
    ),
    PersonalCard(
      name: 'Alessio',
      amount: 0.00,
      photo: 'women.png',
    ),
    PersonalCard(
      name: 'Daniele',
      amount: -2.265,
      photo: 'man.png',
    ),
    PersonalCard(
      name: 'Er Capretta',
      amount: 0.00,
      photo: 'women.png',
    ),
    PersonalCard(
      name: 'VMC',
      amount: 0.00,
      photo: 'man.png',
    ),
    PersonalCard(
      name: 'Alessio',
      amount: 0.00,
      photo: 'women.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: myAppBar(context),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
        child: Column(children: [
          bilancioName(),
          const SizedBox(height: 10.0),
          buildPeopleContainer(context),
          const SizedBox(height: 10.0),
          rowButtonSistmaConti(context),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    showDialog(
                            context: context,
                            builder: (context) => const AddPeoplePopUp())
                        .then((value) {
                      if (verificaCondizione(value['name'], cards)) {
                        setState(() {
                          cards.add(PersonalCard(
                              photo: 'man.png',
                              name: value['name'],
                              amount: 0.0));
                        });
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) => const AlertDialog(
                                  title: Text('Errore'),
                                  content: Text('Nome già presente'),
                                ));
                      }
                    });
                  },
                  alignment: Alignment.bottomLeft,
                  icon: Icon(
                    Icons.person_add,
                    color: Colors.grey[400],
                    size: 60.0,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.grey[400],
                    size: 60.0,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.attach_money,
                    color: Colors.grey[400],
                    size: 60.0,
                  )),
            ],
          ),
        ]),
      )),
    );
  }

  AppBar myAppBar(BuildContext context) {
    return AppBar(
      title: textHolidayName(),
      centerTitle: true,
      backgroundColor: Colors.grey[400],
      elevation: 0.0,
      leading: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/settings');
        },
        icon: const Icon(Icons.menu),
        color: Colors.black,
      ),
    );
  }

  Text textHolidayName() {
    return const Text(
      'Nome Vacanza',
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontFamily: 'Oxygen-Regular',
      ),
    );
  }

  Row rowButtonSistmaConti(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [buttonSistemaConti(context)],
    );
  }

  Text bilancioName() {
    return const Text(
      'Bilancio',
      style: TextStyle(
        color: Color(0xFFBDBDBD),
        fontSize: 20.0,
        fontFamily: 'Oxygen-Regular',
      ),
    );
  }

  ElevatedButton buttonSistemaConti(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/adjustPayment');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[850],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.fromLTRB(20.0, 2.0, 20.0, 2.0),
        child: Text(
          'Sistema i conti',
          style: TextStyle(
            color: Color(0xFFBDBDBD),
            fontSize: 20.0,
            fontFamily: 'Oxygen-Light',
          ),
        ),
      ),
    );
  }

  Container buildPeopleContainer(BuildContext context) {
    return Container(
      height: cards.length <= 8
          ? cards.length * 64.0
          : MediaQuery.of(context).size.height * 0.578,
      width: MediaQuery.of(context).size.width * 1.1,
      decoration: BoxDecoration(
        // color: Colors.grey[400],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(child: buildPeopleList()),
    );
  }

  ListView buildPeopleList() {
    return ListView.builder(
        shrinkWrap: true,
        physics: cards.length <= 8
            ? const NeverScrollableScrollPhysics()
            : const AlwaysScrollableScrollPhysics(),
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return MyCard(
              card: cards[index],
              onDismissed: (_) => setState(() => cards.removeAt(index)));
        });
  }

  bool verificaCondizione(value, List<PersonalCard> cards) {
    for (var i = 0; i < cards.length; i++) {
      if (cards[i].name == value) {
        return false;
      }
    }
    return true;
  }
}

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
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Inserisci il nome della persona da aggiungere',
      ),
      style: TextStyle(
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
        children: [
          inputFormAddPerson(),
          Row(children: [
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
            Flexible(
              flex: 1,
              child: ListTile(
                title: const Text(
                  'A',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontFamily: 'Oxygen-Regular',
                  ),
                ),
                leading: Radio(
                  value: 2,
                  groupValue: sesso,
                  onChanged: (value) {
                    setState(() {
                      sesso = value as int;
                    });
                  },
                ),
              ),
            ),
          ])
        ],
      ),
      alignment: Alignment.center,
      actions: [
        annullaButton(context),
        aggiungiButton(),
      ],
    );
  }
}

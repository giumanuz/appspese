
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
          child: Column(
            children: [
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
                        showDialog(context: context, builder: (context) => AlertDialog(
                          title: const Text(
                              'Aggiungi persona',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: 'Oxygen-Regular',
                            ),
                          ),
                          content: TextFormField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Inserisci il nome della persona da aggiungere',
                            ),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontFamily: 'Oxygen-Regular',
                            ),
                          ),
                          alignment: Alignment.center,
                          actions: [
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
                            )
                            ),
                            TextButton(
                              onPressed: () {
                                showDialog(context: context, builder: (context) => AlertDialog(
                                  title: const Text(
                                      'Scegli il genere',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontFamily: 'Oxygen-Regular',
                                    ),
                                  ),
                                  content: Icon(Icons.person_add, color: Colors.grey[400], size: 10.0,),
                                  actions: [
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
                                    )
                                    ),
                                  ],
                                )
                                );
                              },
                              child: const Text(
                                  'Scegli genere',
                              style: TextStyle(
                                color: Colors.indigo,
                                fontSize: 18.0,
                                fontFamily: 'Oxygen-Regular',
                              ),
                            )
                            ),
                            TextButton(
                              onPressed: () {

                              },
                              child: const Text(
                                  'Aggiungi',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18.0,
                                fontFamily: 'Oxygen-Regular',
                              ),
                            )
                            ),
                          ],

                        )
                        );
                      },
                      alignment: Alignment.bottomLeft,
                      icon: Icon(Icons.person_add, color: Colors.grey[400], size: 60.0,)
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.shopping_cart, color: Colors.grey[400], size: 60.0,)
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.attach_money, color: Colors.grey[400], size: 60.0,)
                  ),
                ],
              ),
            ]
          ),
        )
      ),

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
              children: [
                buttonSistemaConti(context)
              ],
            );
  }

  Text bilancioName() {
    return const Text(
              'Bilancio',
              style: TextStyle(
                color: Color (0xFFBDBDBD),
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
                  child:
                    const Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 2.0, 20.0, 2.0),
                    child: Text(
                      'Sistema i conti',
                      style: TextStyle(
                        color: Color (0xFFBDBDBD),
                        fontSize: 20.0,
                        fontFamily: 'Oxygen-Light',
                      ),
                    ),
                  ),
                );
  }

  Container buildPeopleContainer(BuildContext context) {
    return Container(
              height: cards.length <= 8 ? cards.length * 64.0 : MediaQuery.of(context).size.height * 0.578,
              width: MediaQuery.of(context).size.width * 1.1,
              decoration: BoxDecoration(
                // color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: buildPeopleList()
              ),
            );
  }

  ListView buildPeopleList() {
    return ListView.builder(
                    shrinkWrap: true,
                    physics: cards.length <= 8 ? const NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics(),
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        direction: DismissDirection.endToStart,
                        key: Key(cards[index].name),
                        background: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.red,
                          ),
                          child: const Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        onDismissed: (direction) {
                          setState(() {
                            cards.removeAt(index);
                          });
                        },
                        child: Card(
                          child: ListTile(
                            onTap: () {
                              Navigator.pushNamed(context, '/personalPayment');
                            },
                            title: Text(
                              cards[index].name,
                            ),
                            trailing: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '${cards[index].amount.toStringAsFixed(2)} €',
                                ),
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontFamily: 'Oxygen-Regular',
                                ),
                              ),
                            ),
                            leading: CircleAvatar(
                              backgroundImage: AssetImage('assets/${cards[index].photo}'),
                            ),
                          ),
                        ),
                      );
                    }
                );
  }
}

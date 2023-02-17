import 'package:appspese/common/title_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:appspese/common/personalCard.dart';
import 'package:appspese/common/my_card.dart';
import 'package:appspese/pages/home/add_people_popup.dart';
import 'package:appspese/common/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const TitlePageWidget('Bilancio'),
      buildPeopleList(),
      const SizedBox(
        height: 20,
      ),
      rowButtonSistmaConti(context),
      threeButtonRow(context),
      const SizedBox(
        height: 20,
      )
    ]);
  }

  SizedBox threeButtonRow(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          addPersonButton(context),
          addExpenseButton(),
          addPaymentButton(),
        ],
      ),
    );
  }

  SizedBox addPaymentButton() {
    return SizedBox(
      width: 70,
      child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.attach_money,
            color: Colors.grey[400],
            size: 60.0,
          )),
    );
  }

  SizedBox addExpenseButton() {
    return SizedBox(
      width: 70,
      child: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/addExpense');
          },
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.grey[400],
            size: 60.0,
          )),
    );
  }

  SizedBox addPersonButton(BuildContext context) {
    return SizedBox(
      width: 70,
      child: IconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => const AddPeoplePopUp()).then((value) {
              if (value == null) {
                return;
              }
              if (verificaCondizione(value['name'], esempioCards)) {
                setState(() {
                  String photoSesso = '';
                  if (value['sesso'] == 0) {
                    photoSesso = 'man.png';
                  } else if (value['sesso'] == 1) {
                    photoSesso = 'women.png';
                  }
                  esempioCards.add(PersonalCard(
                      photo: photoSesso, name: value['name'], amount: 0));
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
    );
  }

  Row rowButtonSistmaConti(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [buttonSistemaConti(context)],
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

  Expanded buildPeopleList() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView.builder(
            shrinkWrap: true,
            physics: esempioCards.length <= 8
                ? const NeverScrollableScrollPhysics()
                : const AlwaysScrollableScrollPhysics(),
            itemCount: esempioCards.length,
            itemBuilder: (context, index) {
              return MyCard(
                  card: esempioCards[index],
                  onDismissed: (_) =>
                      setState(() => esempioCards.removeAt(index)));
            }),
      ),
    );
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

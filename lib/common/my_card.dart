import 'package:appspese/services/personalCard.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final PersonalCard card;
  final DismissDirectionCallback? onDismissed;

  const MyCard({required this.card, Key? key, this.onDismissed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget card_widget = Card(
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, '/personalPayment');
        },
        title: Text(
          card.name,
        ),
        trailing: SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '${card.amount.toStringAsFixed(2)} €',
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
          backgroundImage: AssetImage('assets/${card.photo}'),
        ),
      ),
    );

    if (card.amount != 0) return card_widget;

    return Dismissible(
      direction: DismissDirection.endToStart,
      key: Key(card.name),
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
      onDismissed: onDismissed,
      child: card_widget,
    );
  }
}

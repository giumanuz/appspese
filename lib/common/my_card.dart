import 'package:appspese/common/personalCard.dart';
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
        trailing: Text(
          '${(card.amount / 100).toStringAsFixed(2)} €',
          style: TextStyle(
            color: card.amount < 0 ? Colors.red : Colors.green,
            fontSize: 20.0,
            fontFamily: 'Oxygen-Regular',
          ),
          textAlign: TextAlign.right,
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
          borderRadius: BorderRadius.circular(6.0),
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

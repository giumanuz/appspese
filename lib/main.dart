import 'package:flutter/material.dart';
import 'package:appspese/pages/home.dart';
import 'package:appspese/pages/loading.dart';
import 'package:appspese/pages/personalPayment.dart';
import 'package:appspese/pages/settings.dart';
import 'package:appspese/pages/totalPayment.dart';
import 'package:appspese/pages/adjustPayment.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/settings': (context) => Settings(),
      '/personalPayment': (context) => PersonalPayment(),
      '/totalPayment': (context) => TotalPayment(),
      '/adjustPayment' : (context) => AdjustPayment(),
    },
  ));
}




// Container(
// height : cards.length * 64.0,
// width: MediaQuery.of(context).size.width * 1.3,
// child: Center(
// child: ListView.builder(
// shrinkWrap: true,
// physics: const NeverScrollableScrollPhysics(),
// itemCount: cards.length,
// itemBuilder: (context, index) {
// return Card(
// child: ListTile(
// onTap: () {
// Navigator.pushNamed(context, '/personalPayment');
// },
// title: Text(
// cards[index].name,
// ),
// trailing: SizedBox(
// width: MediaQuery.of(context).size.width * 0.2,
// child: TextField(
// decoration: InputDecoration(
// border: InputBorder.none,
// hintText: '${cards[index].amount.toStringAsFixed(2)} €',
// ),
// textAlign: TextAlign.right,
// style: const TextStyle(
// color: Colors.black,
// fontSize: 20.0,
// fontFamily: 'Oxygen-Regular',
// ),
// ),
// ),
// leading: CircleAvatar(
// backgroundImage: AssetImage('assets/${cards[index].photo}'),
// ),
// ),
// );
// }
// )
// ),
// ),
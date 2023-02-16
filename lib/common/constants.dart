import 'package:flutter/material.dart';
import 'package:appspese/common/payment.dart';
import 'package:appspese/common/personalCard.dart';

List<PersonalCard> esempioCards = [
  PersonalCard(
    name: 'Giuliu',
    amount: 0,
    photo: 'man.png',
  ),
  PersonalCard(
    name: 'Cats',
    amount: 000,
    photo: 'women.png',
  ),
  PersonalCard(
    name: 'Berlino',
    amount: 000,
    photo: 'man.png',
  ),
];

List<Payment> esempiPayments = [
  // Payment(
  //     from: 'Giuliu', amount: 3000, category: 'Discoteca', data: '01/01/1212', to: {'Giuliu': 1000, 'Cats': 1000, 'Berlino': 1000}),
  // Payment(from: 'Cats', amount: 4000, category: 'Spesa', data: '02/01/1212', to: {'Giuliu': 1000, 'Cats': 2000, 'Berlino': 1000}),
  // Payment(
  //     from: 'Berlino', amount: 5, category: 'Porno', data: '03/01/1212', to: {'Berlino': 2, 'Cats': 3}),
];

Map<String, IconData> categoriesToIcon = {
  'Discoteca': Icons.music_note,
  'Porno': Icons.accessible_outlined,
  'Spesa': Icons.shopping_cart,
  'Telefono': Icons.phone,
  'Trasporto': Icons.airplanemode_active,
  'Casa': Icons.home,
  'Ristorante': Icons.restaurant,
  'Regalo': Icons.card_giftcard,
  'Pagamento': Icons.payment
};

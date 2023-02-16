import 'package:flutter/material.dart';
import 'package:appspese/common/payment.dart';
import 'package:appspese/common/personalCard.dart';

List<PersonalCard> esempioCards = [
  PersonalCard(
    name: 'Giuliu',
    amount: 4.53,
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

List<Payment> esempiPayments = [
  Payment(
      from: 'Giuliu', amount: 23.50, category: 'Discoteca', data: '01/01/1212'),
  Payment(from: 'Cats', amount: 2, category: 'Spesa', data: '02/01/1212'),
  Payment(
      from: 'Berlino', amount: 239.50, category: 'Porno', data: '03/01/1212'),
  Payment(
      from: 'EdoTM', amount: 90, category: 'Ristorante', data: '04/01/1212'),
  Payment(
      from: 'Capretta',
      amount: 23343.45,
      category: 'Pagamento',
      data: '01/01/1212'),
  Payment(
      from: 'Giuliu', amount: 267, category: 'Telefono', data: '02/01/1212'),
  Payment(
      from: 'Cats', amount: 23.50, category: 'Trasporto', data: '05/01/1212'),
  Payment(from: 'Cats', amount: 27.00, category: 'Regalo', data: '02/01/1212'),
  Payment(from: 'Berlino', amount: 27.0, category: 'Casa', data: '02/01/1212'),
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

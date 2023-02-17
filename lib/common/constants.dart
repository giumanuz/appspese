import 'package:flutter/material.dart';
import 'package:appspese/common/payment.dart';
import 'package:appspese/common/personalCard.dart';
import 'package:appspese/common/menu_item.dart';

List<PersonalCard> esempioCards = [
  PersonalCard(
    name: 'Giuliu',
    amount: 0,
    photo: 'man.png',
  ),
  PersonalCard(
    name: 'Cats',
    amount: 456,
    photo: 'women.png',
  ),
  PersonalCard(
    name: 'Berlino',
    amount: -456,
    photo: 'man.png',
  ),
  PersonalCard(
    name: 'VMC',
    amount: 0,
    photo: 'man.png',
  ),
  PersonalCard(
    name: 'Alessio',
    amount: 0,
    photo: 'women.png',
  ),
  PersonalCard(
    name: 'Riccardo',
    amount: 0,
    photo: 'man.png',
  ),
  PersonalCard(
    name: 'EdoTM',
    amount: 0,
    photo: 'man.png',
  ),
  PersonalCard(
    name: 'Daniele',
    amount: 0,
    photo: 'women.png',
  ),
  PersonalCard(
    name: 'Er Capretta',
    amount: 0,
    photo: 'man.png',
  ),
  PersonalCard(
    name: 'Franko',
    amount: 0,
    photo: 'man.png',
  ),
  PersonalCard(
    name: 'Kratos',
    amount: 0,
    photo: 'women.png',
  ),
  PersonalCard(
    name: 'La Tigre',
    amount: 0,
    photo: 'man.png',
  ),
  PersonalCard(
    name: 'a',
    amount: 0,
    photo: 'man.png',
  ),
  PersonalCard(
    name: 's',
    amount: 0,
    photo: 'women.png',
  ),
  PersonalCard(
    name: 'd',
    amount: 0,
    photo: 'man.png',
  ),
  PersonalCard(
    name: 'f',
    amount: 0,
    photo: 'man.png',
  ),
  PersonalCard(
    name: 'g',
    amount: 0,
    photo: 'women.png',
  ),
  PersonalCard(
    name: 'h',
    amount: 0,
    photo: 'man.png',
  ),
];

List<Payment> esempiPayments = [
  Payment(
      from: 'Giuliu',
      amount: 3000,
      category: 'Discoteca',
      data: '01/01/1212',
      to: {'Giuliu': 1000, 'Cats': 1000, 'Berlino': 1000}),
  Payment(
      from: 'Cats',
      amount: 4000,
      category: 'Spesa',
      data: '02/01/1212',
      to: {'Giuliu': 1000, 'Cats': 2000, 'Berlino': 1000}),
  Payment(
      from: 'Berlino',
      amount: 5,
      category: 'Porno',
      data: '03/01/1212',
      to: {'Berlino': 2, 'Cats': 3}),
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

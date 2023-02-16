import 'package:flutter/material.dart';

class PersonalCard {
  final String photo;
  final String name;
  int amount;

  PersonalCard({required this.photo, required this.name, required this.amount});

  void addAmount(int amount) {
    this.amount += amount;
  }
}

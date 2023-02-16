import 'package:flutter/material.dart';

class PersonalCard {
  final String photo;
  final String name;
  double amount;

  PersonalCard({required this.photo, required this.name, required this.amount});

  void addAmount(double amount) {
    this.amount += amount;
  }

}
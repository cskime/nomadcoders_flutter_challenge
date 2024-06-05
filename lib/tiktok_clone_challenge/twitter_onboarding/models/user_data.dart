import 'package:flutter/material.dart';

@immutable
class UserData {
  const UserData({
    required this.name,
    required this.phoneOrEmail,
    required this.dateOfBirth,
  });

  final String name;
  final String phoneOrEmail;
  final String dateOfBirth;
}

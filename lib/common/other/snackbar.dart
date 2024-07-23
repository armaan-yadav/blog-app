import 'package:flutter/material.dart';

SnackBar createCustomSnackBar(String message, [bool isFailure = false]) {
  return SnackBar(
    clipBehavior: Clip.hardEdge,
    width: double.infinity,
    behavior: SnackBarBehavior.floating,
    duration: Durations.extralong4,
    content: Text(
      message,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
    backgroundColor: !isFailure
        ? Color.fromARGB(255, 64, 144, 66)
        : const Color.fromARGB(255, 169, 55, 46),
  );
}

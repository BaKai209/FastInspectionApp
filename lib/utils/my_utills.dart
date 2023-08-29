
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

void showErrorMessage(BuildContext context, {String title='Error',required String message}){
   snackBar(
        context,
        title: title,
        content: Text(
          message,
          style: const TextStyle(fontSize: 14),
        ),
        backgroundColor: Colors.redAccent,
        duration: const Duration(seconds: 5),
      );
}

void showSuccessMessage(BuildContext context, {String title='Success',required String message}){
   snackBar(
        context,
        title: title,
        content: Text(
          message,
          style: const TextStyle(fontSize: 14),
        ),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 5),
      );
}
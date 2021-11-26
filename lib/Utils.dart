import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Utils {
  static void showSnackBar(BuildContext ctx, String text, Color color) => {
        ScaffoldMessenger.of(ctx)
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(
            backgroundColor: color,
            content: Text(text),
          ))
      };
  static DateTime? toDateTime(Timestamp? value) {
    if (value == null ) return null;

    return value.toDate();
  }

  static dynamic fromDateTimeToJson(DateTime? date){
    if (date == null) return null;
  }
}

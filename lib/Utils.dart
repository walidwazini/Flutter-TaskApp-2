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
}

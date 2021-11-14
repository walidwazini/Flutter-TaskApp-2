import 'package:flutter/material.dart';

class Utils {
  static void showSnackBar(BuildContext ctx, String text) => {
        ScaffoldMessenger.of(ctx)
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(
            content: Text(text),
          ))
      };
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInputFormatterNumberOrEmail extends TextInputFormatter {
  final TextEditingController controller;

  CustomInputFormatterNumberOrEmail(this.controller);
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    List<String> text = <String>[];
    print(newValue.text);
    if (newValue.text[0].contains(RegExp(r'[7-9+]'))) {
      final digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]+'), '');
      final digitsOnlyChar = digitsOnly.split('');
      for (var i = 0; i < digitsOnlyChar.length; i++) {
        if (i == 0) {
          if (digitsOnlyChar[0] == "7" || digitsOnlyChar[0] == "8") {
            text.add("+7 (");
          } else {
            text.add("+7 (");
            text.add(digitsOnlyChar[i]);
          }
        } else if (i == 4) {
          text.add(") ");
          text.add(digitsOnlyChar[i]);
        } else if (i == 7 || i == 9) {
          text.add("-");
          text.add(digitsOnlyChar[i]);
        } else if (i > 10) {
          break;
        } else {
          text.add(digitsOnlyChar[i]);
        }
      }
    } else {
      final digitsOnly = newValue.text;
      final digitsOnlyChar = digitsOnly.split('');
      for (var i = 0; i < digitsOnlyChar.length; i++) {
        text.add(digitsOnlyChar[i]);
      }
    }
    final resultText = text.join();
    return TextEditingValue(
      text: resultText,
      selection: TextSelection.collapsed(
        offset: resultText.length,
      ),
    );
  }
}

class CustomInputFormatterNumber extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    List<String> text = <String>[];
    final digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]+'), '');
    final digitsOnlyChar = digitsOnly.split('');
    for (var i = 0; i < digitsOnlyChar.length; i++) {
      if (i == 0) {
        if (digitsOnlyChar[0] == "7" || digitsOnlyChar[0] == "8") {
          text.add("+7 (");
        } else {
          text.add("+7 (");
          text.add(digitsOnlyChar[i]);
        }
      } else if (i == 4) {
        text.add(") ");
        text.add(digitsOnlyChar[i]);
      } else if (i == 7 || i == 9) {
        text.add("-");
        text.add(digitsOnlyChar[i]);
      } else if (i > 10) {
        break;
      } else {
        text.add(digitsOnlyChar[i]);
      }
    }
    final resultText = text.join();
    return TextEditingValue(
      text: resultText,
      selection: TextSelection.collapsed(
        offset: resultText.length,
      ),
    );
  }
}

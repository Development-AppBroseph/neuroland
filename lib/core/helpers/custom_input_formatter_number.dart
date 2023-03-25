import 'package:flutter/services.dart';
import 'package:regexpattern/regexpattern.dart';

class CustomInputFormatterNumber extends TextInputFormatter {
  final bool numberAndEmail;

  CustomInputFormatterNumber({required this.numberAndEmail});
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    List<String> text = <String>[];
    bool number = newValue.text.contains(RegExp(r'[\d]+'));
    bool email = newValue.text.contains(RegExp(r'[а-я]+'));
    if (numberAndEmail && number) {
      final digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]+'), '');
      final digitsOnlyChar = digitsOnly;
      for (var i = 0; i < digitsOnlyChar.length; i++) {
        if (i == 0) {
          if (digitsOnlyChar[0] == "7" || digitsOnlyChar[0] == "8") {
            text.add("+7 (");
          } else {
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

class TextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text,
      // selection: newValue.,
    );
  }
}

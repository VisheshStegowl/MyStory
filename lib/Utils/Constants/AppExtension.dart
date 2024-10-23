import 'dart:convert';
import 'dart:typed_data';

import 'package:get/get.dart';

extension NameInitials on String {
  ///Geting Initials String for Contect Name Avatar
  String getInitials() {
    List<String> nameParts = split(' ');
    if (nameParts.length < 2) {
      if (nameParts.isNotEmpty && nameParts != '') {
        String firstInitial = nameParts[0][0].capitalize ?? '';
        String secondInitial = nameParts[0][1].isNotEmpty
            ? nameParts[0][1].capitalize ?? ''
            : nameParts[0][0].capitalize ?? '';
        return '$firstInitial$secondInitial';
      } else {
        return '';
      }
    }
    String firstInitial = nameParts[0][0].capitalize ?? '';
    String secondInitial = nameParts[1][0].capitalize ?? '';

    return '$firstInitial$secondInitial';
  }
}

Uint8List stringToUint8List(String input) {
  return base64.decode(input);
}



import 'package:flutter_riverpod/flutter_riverpod.dart';

final validatorsProvider = Provider<Validators>((ref) {
  return Validators();
});

class Validators {
  final _phoneRegex =
      r"^(\+\d{1,2}\s?)?1?\-?\.?\s?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$";


  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone field can't be empty";
    } else if (value.length != 9 && value.length != 10) {
      return "Please enter a valid phone number";
    }
    return null;
  }

  String? validateName(String? name) {
    return validate(name, "Full name field can't be empty");
  }

  String? validate(String? value, String errorMessage) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }else if(value.toString().startsWith(" ")){
      return 'Please Enter valid name*';
    }
    return null;
  }

}
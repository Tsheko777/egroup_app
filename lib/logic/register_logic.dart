import 'package:egroup_app/api/register.dart';
import 'package:flutter/material.dart';

class RegisterLogic {
  String register(
    BuildContext context,
    TextEditingController email,
    TextEditingController accountNumber,
    TextEditingController firstName,
    TextEditingController lastName,
    TextEditingController cellNumber,
    TextEditingController province,
    TextEditingController surburb,
    TextEditingController city,
    TextEditingController streetNumber,
    TextEditingController streetName,
    TextEditingController idNumber,
    TextEditingController password,
    TextEditingController password2,
    Function setError,
    Function setLoading,
  ) {
    if (email.text == "") {
      setError("Please enter email address");
    } else if (accountNumber.text == "") {
      setError("Please enter account number");
    } else if (firstName.text == "") {
      setError("Please enter your firstname");
    } else if (lastName.text == "") {
      setError("Please enter your lastanme");
    } else if (cellNumber.text == "") {
      setError("Please enter your cellnumber");
    } else if (province.text == "") {
      setError("Please enter your province");
    } else if (surburb.text == "") {
      setError("Please enter your surburb");
    } else if (city.text == "") {
      setError("Please enter your city");
    } else if (streetNumber.text == "") {
      setError("Please enter your street number");
    } else if (streetName.text == "") {
      setError("Please enter your street name");
    } else if (idNumber.text == "") {
      setError("Please enter your id number");
    } else if ((password.text == "" || password2.text == "") ||
        (password.text != password2.text)) {
      setError("Password does not match");
    } else {
      var data = {
        'email': email.text,
        'accountNumber': accountNumber.text,
        'firstname': firstName.text,
        'lastname': lastName.text,
        'cellNumber': cellNumber.text,
        'province': province.text,
        'surburb': surburb.text,
        'city': city.text,
        'streetNumber': streetNumber.text,
        'streetName': streetName.text,
        'idNumber': idNumber.text,
        'password': password.text,
        'password_confirmation': password2.text,
      };
      setLoading(true);
      RegisterRequest().register(data, context, setLoading, setError);
    }
    return "";
  }
}

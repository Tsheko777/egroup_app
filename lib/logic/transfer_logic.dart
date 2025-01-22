import 'package:egroup_app/api/transactions.dart';
import 'package:flutter/material.dart';

class TransferLogic {
  Future<String> transfer(
      BuildContext context,
      String bank,
      TextEditingController accountName,
      TextEditingController accountNumber,
      TextEditingController beneficiaryRef,
      TextEditingController myRef,
      TextEditingController amount,
      Function setLoading) async {
    if (bank == "") {
      return "Please select bank";
    } else if (accountName.text == "") {
      return "Please enter account name";
    } else if (accountNumber.text == "") {
      return "Please enter account number";
    } else if (beneficiaryRef.text == "") {
      return "Please enter benficiary reference";
    } else if (myRef.text == "") {
      return "Please enter your reference";
    } else if (amount.text == "") {
      return "Please enter amount";
    } else {
      var data = {
        "bank": bank,
        "accountName": accountName.text,
        "accountNumber": accountNumber.text,
        "beneficiaryReference": beneficiaryRef.text,
        "myReference": myRef.text,
        "amount": amount.text
      };
      setLoading(true);
      var result =
          await TransactionRequest().transfer(context, data, setLoading);
      return result;
    }
  }
}

// ignore_for_file: unnecessary_overrides, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class GerneralState extends ChangeNotifier {
  String error = "";
  bool loading = false;
  var transactins;

  setError(value) {
    error = value;
    notifyListeners();
  }

  setLoading(value) {
    loading = value;
    notifyListeners();
  }

  setTransations(value) {
    transactins = value;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

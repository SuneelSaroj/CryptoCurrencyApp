import 'dart:async';

import 'package:cryeptotracker/models/api.dart';
import 'package:cryeptotracker/models/crypto_madel.dart';
import 'package:flutter/cupertino.dart';

class CryptoProvider with ChangeNotifier {
  bool isLoading = true;
  List<CrytoModel> market = [];

  CryptoProvider() {
    fetchData();
  }

  void fetchData() async {
    List<dynamic> _markets = await API.getMarket();

    List<CrytoModel> temp = [];
    for (var crypto in _markets) {
      CrytoModel newCrypto = CrytoModel.fromJSON(crypto);
      temp.add(newCrypto);
    }
    market = temp;
    isLoading = false;
    notifyListeners();

    Timer(const Duration(seconds: 1), () {
      fetchData();
      // print('data found');
    });
  }
}

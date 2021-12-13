// import 'package:cryeptotracker/models/crypto_madel.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class API {
  static Future<List<dynamic>> getMarket() async {
    Uri cryptoUrl = Uri.parse(
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=30&page=1&sparkline=fals");

    var response = await http.get(cryptoUrl);
    var decodeResponse = jsonDecode(response.body);
    List<dynamic> markets = decodeResponse as List<dynamic>;
    return markets;
  }
}

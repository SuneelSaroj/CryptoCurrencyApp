class CrytoModel {
  String? id;
  String? symbol;
  String? name;
  String? image;
  double? currentPrice;
  double? marketCap;
  int? marketCapRank;
  double? high_24h;
  double? low_24h;
  double? priceChange24;
  double? priceChangePercentage24;
  double? circulatingSupply;
  double? ath;
  double? atl;

  CrytoModel(
      {required this.id,
      required this.symbol,
      required this.name,
      required this.currentPrice,
      required this.marketCap,
      required this.marketCapRank,
      required this.image,
      required this.high_24h,
      required this.low_24h,
      required this.priceChange24,
      required this.priceChangePercentage24,
      required this.circulatingSupply,
      required this.ath,
      required this.atl});

  factory CrytoModel.fromJSON(Map<String, dynamic> map) {
    return CrytoModel(
      id: map['id'],
      symbol: map['symbol'],
      marketCap: double.parse(map['market_cap'].toString()),
      name: map['name'],
      marketCapRank: map['market_cap_rank'],
      image: map['image'],
      currentPrice: double.parse(map['current_price'].toString()),
      high_24h: double.parse(map['high_24h'].toString()),
      low_24h: double.parse(map['low_24h'].toString()),
      priceChange24: double.parse(map['price_change_24h'].toString()),
      priceChangePercentage24: map['price_change_percentage_24h'],
      circulatingSupply: map['circulating_supply'],
      ath: double.parse(map['ath'].toString()),
      atl: double.parse(map['atl'].toString()),
    );
  }
}

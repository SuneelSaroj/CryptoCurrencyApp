import 'package:cryeptotracker/models/crypto_madel.dart';
import 'package:cryeptotracker/provider/crypto_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Live Crypto"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          padding: const EdgeInsets.only(
            // top: 5,
            // right: 20,
            left: 5,
            bottom: 0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Consumer<CryptoProvider>(
                  builder: (context, cryptoProvider, child) {
                    if (cryptoProvider.isLoading == true) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (cryptoProvider.market.isNotEmpty) {
                        return ListView.builder(
                          physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics(),
                          ),
                          itemCount: cryptoProvider.market.length,
                          itemBuilder: (context, index) {
                            CrytoModel currentcrypto =
                                cryptoProvider.market[index];
                            return ListTile(
                                isThreeLine: true,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                selected: true,
                                selectedTileColor: Colors.grey[200],
                                contentPadding: const EdgeInsets.all(3),
                                leading: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  backgroundImage:
                                      NetworkImage(currentcrypto.image!),
                                ),
                                title: Text(
                                    "${currentcrypto.name!} #${currentcrypto.marketCapRank}"),

                                //minVerticalPadding: 2,
                                subtitle:
                                    Text(currentcrypto.symbol!.toUpperCase()),
                                trailing: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "₹" +
                                          currentcrypto.currentPrice!
                                              .toString(),
                                      style: const TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 19),
                                    ),
                                    Builder(builder: (context) {
                                      double priceChange =
                                          currentcrypto.priceChange24!;
                                      double priceChangePercent = currentcrypto
                                          .priceChangePercentage24!;

                                      // print(currentcrypto.priceChange24.toString());
                                      //  print(currentcrypto.priceChangePercentage24.toString());

                                      if (priceChange < 0) {
                                        return Text(
                                          "🔻${priceChangePercent.toStringAsFixed(2)}% (${priceChange.toStringAsFixed(2)})",
                                          style: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        );
                                      } else {
                                        return Text(
                                          "▲${priceChangePercent.toStringAsFixed(2)}% (${priceChange.toStringAsFixed(2)})",
                                          style: const TextStyle(
                                            color: Colors.green,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        );
                                      }
                                    })
                                  ],
                                ));
                          },
                        );
                      } else {
                        return const Text('failed to fetch data');
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

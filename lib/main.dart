import 'package:cryeptotracker/provider/crypto_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CryptoProvider>(
          create: (context) => CryptoProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LiveCrypto',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        home: const HomePage(),
      ),
    );
  }
}

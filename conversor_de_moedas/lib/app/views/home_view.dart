import 'package:conversor_de_moedas/app/components/currency_box.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String moeda = 'Real';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 100,
            left: 30,
            right: 30,
          ),
          child: Column(children: [
            Image.asset(
              'assets/images/conversor.png',
              width: 150,
              height: 150,
            ),
            SizedBox(height: 75),
            CurrencyBox(),
            SizedBox(height: 10),
            CurrencyBox(),
            SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
                onPrimary: Colors.black, // Background color
              ),
              onPressed: () {},
              child: Text('CONVERTER'),
            ),
          ]),
        ),
      ),
    );
  }
}

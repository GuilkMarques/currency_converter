import 'package:conversor_de_moedas/app/components/utils/submitconverter.dart';
import 'package:conversor_de_moedas/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  // final TextEditingController toText = TextEditingController();
  // final TextEditingController fromText = TextEditingController();

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CurrencyModel> currencies = [];
  CurrencyModel toCurrency =
      CurrencyModel(name: '', real: 0, dolar: 0, euro: 0, bitcoin: 0);
  CurrencyModel fromCurrency =
      CurrencyModel(name: '', real: 0, dolar: 0, euro: 0, bitcoin: 0);
  String moeda = 'Real';
  String moeda2 = 'Dolar';
  TextEditingController toText = TextEditingController();
  TextEditingController fromText = TextEditingController();

  Widget get current1 {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 65,
            child: DropdownButton(
                iconEnabledColor: Colors.amber,
                value: moeda,
                isExpanded: true,
                underline: Container(
                  height: 1,
                  color: Colors.amber,
                ),
                items: currencies
                    .map((e) => DropdownMenuItem(
                        value: e.name,
                        child: Text(
                          e.name,
                          overflow: TextOverflow.ellipsis,
                        )))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    moeda = value!;
                    toCurrency = currencies
                        .firstWhere((element) => element.name == value);
                  });
                }),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: TextFormField(
            controller: toText,
            decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber))),
          ),
        ),
      ],
    );
  }

  Widget get current2 {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 65,
            child: DropdownButton(
                iconEnabledColor: Colors.amber,
                value: moeda2,
                isExpanded: true,
                underline: Container(
                  height: 1,
                  color: Colors.amber,
                ),
                items: currencies
                    .map((e) => DropdownMenuItem(
                        value: e.name,
                        child: Text(
                          e.name,
                          overflow: TextOverflow.ellipsis,
                        )))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    moeda2 = value!;
                    fromCurrency = currencies
                        .firstWhere((element) => element.name == value);
                  });
                }),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: TextFormField(
            controller: fromText,
            decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber))),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 30, right: 30, top: 100.0, bottom: 20),
            child: Column(children: [
              Image.asset(
                'assets/images/conversor.png',
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 30),
              current1,
              const SizedBox(height: 20),
              current2,
              SizedBox(
                width: MediaQuery.of(context).size.width,
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    elevation: 10,
                  ),
                  onPressed: () {
                    setState(() {
                      fromText.text = submit(toText, toCurrency, fromCurrency);
                    });
                  },
                  child: const Text('CONVERTER')),
            ]),
          ),
        ),
      ),
    );
  }
}

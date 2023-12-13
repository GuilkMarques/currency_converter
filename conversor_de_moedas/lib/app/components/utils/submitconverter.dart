import 'package:conversor_de_moedas/app/models/currency_model.dart';
import 'package:flutter/material.dart';

String submit(TextEditingController toText, CurrencyModel toCurrency,
    CurrencyModel fromCurrency) {

  String fromText = '';

  // String text = toText.text;

  double value = double.tryParse(toText.text.replaceAll(',', '.')) ?? 1.0;
  double returnValue = 0;

  if (fromCurrency!.name == 'Real') {
    returnValue = value * toCurrency!.real;
  } else if (fromCurrency!.name == 'Dolar') {
    returnValue = value * toCurrency!.dolar;
  } else if (fromCurrency!.name == 'Euro') {
    returnValue = value * toCurrency!.euro;
  } else if (fromCurrency!.name == 'Bitcoin') {
    returnValue = value * toCurrency!.bitcoin;
  }

  fromText = returnValue.toStringAsFixed(2);

  return fromText;
}

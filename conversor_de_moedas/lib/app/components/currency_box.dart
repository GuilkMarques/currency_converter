import 'package:flutter/material.dart';

class CurrencyBox extends StatefulWidget {
  const CurrencyBox({super.key});

  @override
  State<CurrencyBox> createState() => _CurrencyBoxState();
}

class _CurrencyBoxState extends State<CurrencyBox> {
  String moeda = 'Real';

  @override
  Widget build(BuildContext context) {
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
                items: [
                  DropdownMenuItem(
                      value: 'Real',
                      child: Text(
                        'Real',
                        overflow: TextOverflow.ellipsis,
                      )),
                  DropdownMenuItem(
                      value: 'Dolar',
                      child: Text(
                        'Dolar',
                        overflow: TextOverflow.ellipsis,
                      ))
                ],
                onChanged: (value) {
                  setState(() {
                    moeda = value!;
                  });
                }),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: TextField(
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber))),
          ),
        ),
      ],
    );
  }
}

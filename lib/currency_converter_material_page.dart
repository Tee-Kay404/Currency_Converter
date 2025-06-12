import 'package:flutter/material.dart';

// 1. create a variable that stores the currency converter value
//2. cretae a function that multiplies the value given by the textfield by 1750
//3 . store the value in the variable that we created
//4. display the variable
class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    setState(() {
      result = double.parse(textEditingController.text) * 1730;
      textEditingController.clear();
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderSide: const BorderSide(width: 2.0, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(5));
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          elevation: 0,
          title: const Text('Currency Converter'),
          titleTextStyle: const TextStyle(fontSize: 30, color: Colors.white),
          centerTitle: false,
          actions: const [
            Text('Hello'),
          ]),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'NGN ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',
              style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
            //padding
            //container
            TextField(
                controller: textEditingController,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Pls enter the amount in Dollar',
                  hintStyle: const TextStyle(color: Colors.black),
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: true, signed: true)),
            //button

            // raised
            //appears  like a text
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
                onPressed: convert,
                style: ElevatedButton.styleFrom(
                  elevation: (15),
                  backgroundColor: (Colors.black),
                  foregroundColor: (Colors.white),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Convert')),
          ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../hello_bridge.dart';
import 'package:flutter/services.dart';

class SumPage extends StatefulWidget {
  const SumPage({super.key});

  @override
  State<SumPage> createState() => _SumPageState();
}

class _SumPageState extends State<SumPage> {
  final HelloBridge _helloBridge = HelloBridge();
  int? sum;

  final aController = TextEditingController();
  final bController = TextEditingController();

  void addNumbers() {
    try {
      int a = int.parse(aController.text);
      int b = int.parse(bController.text);
      setState(() {
        sum = _helloBridge.getSum(a, b);
      });
    } catch (error) {
      setState(() {
        sum = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 200,
        child: Column(
          children: [
            Text('Sum retrieved from C++',
                style: Theme.of(context).textTheme.displaySmall),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 50,
                  child: TextFormField(
                    textAlign: TextAlign.right,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(3),
                    ],
                    style: const TextStyle(fontSize: 25),
                    controller: aController,
                    keyboardType: TextInputType.number,
                  ),
                ),
                Text(
                  "+",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(
                  width: 50,
                  child: TextFormField(
                    textAlign: TextAlign.right,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(3),
                    ],
                    style: const TextStyle(fontSize: 25),
                    controller: bController,
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                      onPressed: addNumbers,
                      child: const Text(
                        "=",
                      )),
                ),
                Text(
                  sum != null ? sum.toString() : "",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

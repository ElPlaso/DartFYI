import 'package:flutter/material.dart';
import '../hello_bridge.dart';

class HelloPage extends StatefulWidget {
  const HelloPage({super.key});

  @override
  State<HelloPage> createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  final HelloBridge _helloBridge = HelloBridge();

  bool displayGreeting = false;

  void toggleGreeting() {
    setState(() {
      displayGreeting = !displayGreeting;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 250,
        child: Column(children: [
          Text(
            'Text retrieved from C++',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 15),
          Card(
            clipBehavior: Clip.hardEdge,
            color: displayGreeting
                ? Theme.of(context).colorScheme.inversePrimary
                : Theme.of(context).colorScheme.surfaceVariant,
            child: InkWell(
              onTap: () {
                toggleGreeting();
              },
              child: SizedBox(
                height: 100,
                child: Center(
                  child: Text(
                    displayGreeting ? _helloBridge.getHello() : "",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

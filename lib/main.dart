import 'package:flutter/material.dart';
import 'widgets/hello_page.dart';
import 'widgets/sum_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dart FYI',
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: const MyHomePage(title: 'Dart FYI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      ),
      body: Stack(
        children: <Widget>[
          Offstage(
            offstage: _selectedIndex != 0,
            child: TickerMode(
              enabled: _selectedIndex == 0,
              child: const HelloPage(),
            ),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: TickerMode(
              enabled: _selectedIndex == 1,
              child: const SumPage(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'Hello',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.functions),
            label: 'Sum',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

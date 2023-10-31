import 'package:flutter/material.dart';
import 'package:ink_core/ink_core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ink Core',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Palette.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ink Core Package'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text('Buttons'),
            Padding(
              padding: edgeInsets20,
              child: InkPrimaryButton(
                textColor: Colors.black,
                onPressed: () {},
                text: 'Primary button',
              ),
            ),
            Padding(
              padding: edgeInsets20,
              child: InkSecondaryButton(
                onPressed: () {},
                text: 'Secondary button',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

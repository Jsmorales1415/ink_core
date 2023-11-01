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
      body: const Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[ButtonsSection(), gap10, TextFieldsSection()],
          ),
        ),
      ),
    );
  }
}

class TextFieldsSection extends StatelessWidget {
  const TextFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Inputs'),
        const Padding(
          padding: edgeInsetsH20,
          child: InkTextField(title: 'Text field'),
        ),
        gap10,
        const Padding(
          padding: edgeInsetsH20,
          child: InkTextField(
            title: 'Disabled',
            enable: false,
          ),
        ),
        gap10,
        Padding(
          padding: edgeInsetsH20,
          child: InkTextField(
            title: 'Copy',
            copyToClipboard: true,
            onCopied: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Copied!'),
              ),
            ),
          ),
        ),
        gap10,
        Padding(
          padding: edgeInsetsH20,
          child: InkTextField(
            title: 'Password',
            hintText: 'Password here',
            hintTextColor: Palette.darkGrey.withOpacity(.3),
            obscureText: true,
          ),
        ),
        gap10,
      ],
    );
  }
}

class ButtonsSection extends StatelessWidget {
  const ButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
    );
  }
}

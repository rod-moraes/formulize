import 'package:flutter/material.dart';

class EditFormPage extends StatefulWidget {
  const EditFormPage({super.key});

  @override
  State<EditFormPage> createState() => _EditFormPageState();
}

class _EditFormPageState extends State<EditFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FORMULIZE'),
      ),
    );
  }
}
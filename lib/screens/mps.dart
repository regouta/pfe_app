import 'package:flutter/material.dart';

class Mps extends StatelessWidget {
  const Mps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('mps'),
      ),
      body: const Center(
        child: Text('This is the second page!'),
      ),
    );
  }
}

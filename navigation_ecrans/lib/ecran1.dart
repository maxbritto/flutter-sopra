import 'package:exemples_cours/ecran2.dart';
import 'package:flutter/material.dart';

class Ecran1 extends StatelessWidget {
  final List<String> _personnages = [
    "Ted",
    "Rebecca",
    "Keeley",
    "Roy",
    "Beard",
    "Jamie",
    "Nathan",
    "Higgins"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ecran 1"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Ecran2()));
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Ecran2()));
              },
              child: Text("Aller vers l'Ecran 2"),
            )
          ],
        ),
      ),
    );
  }
}

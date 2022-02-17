import 'package:flutter/material.dart';

class Ecran2 extends StatelessWidget {
  const Ecran2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Text("Ecran 2"),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Retour"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

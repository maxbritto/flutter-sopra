import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? _loadedData = null;
  bool _isLoading = false;
  _buttonClicked() async {
    setState(() {
      _isLoading = true;
    });
    final loadedData = await _fonctionDeChargement();
    setState(() {
      _isLoading = false;
      _loadedData = loadedData;
    });
  }

  Future<String> _fonctionDeChargement() {
    return Future.delayed(const Duration(seconds: 3), () => "<3 Flutter <3");
  }

  @override
  Widget build(BuildContext context) {
    final loadedData = _loadedData;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
              onPressed: _isLoading ? null : _buttonClicked,
              child: Text("Lancer le chargement")),
          if (loadedData != null) Text(loadedData),
          if (_isLoading) Center(child: const CircularProgressIndicator())
        ],
      ),
    );
  }
}

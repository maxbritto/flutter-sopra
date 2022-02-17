import 'package:exemples_cours/ecran2.dart';
import 'package:flutter/material.dart';

class Ecran1 extends StatelessWidget {
  final List<String> _nameList = [
    "Ted",
    "Rebecca",
    "Keeley",
    "Roy",
    "Beard",
    "Ted",
    "Rebecca",
    "Keeley",
    "Roy",
    "Beard",
    "Ted",
    "Rebecca",
    "Keeley",
    "Roy",
    "Beard",
    "Ted",
    "Rebecca",
    "Keeley",
    "Roy",
    "Beard",
    "Ted",
    "Rebecca",
    "Keeley",
    "Roy",
    "Beard",
    "Ted",
    "Rebecca",
    "Keeley",
    "Roy",
    "Beard",
    "Ted",
    "Rebecca",
    "Keeley",
    "Roy",
    "Beard",
    "Jamie",
    "Nathan",
    "Higgins"
  ];

  Widget _buildCell(BuildContext context, int index) {
    final name = _nameList[index];
    return ListTile(
      title: Text(name),
      subtitle: const Text("coucou"),
      leading: const Icon(Icons.people_outline),
      trailing: index % 2 == 0 ? const Icon(Icons.check_circle) : null,
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Ecran2(title: name),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ecran 1"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: _buildCell,
                  itemCount: _nameList.length),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Ecran2(
                              title: "Ecran 2",
                            )));
              },
              child: Text("Aller vers l'Ecran 2"),
            )
          ],
        ),
      ),
    );
  }
}

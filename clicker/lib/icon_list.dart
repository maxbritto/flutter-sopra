import 'package:flutter/material.dart';

class IconList extends StatelessWidget {
  const IconList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.ac_unit),
        Icon(Icons.ac_unit),
        Icon(Icons.ac_unit),
        Icon(Icons.ac_unit),
      ],
    );
  }
}

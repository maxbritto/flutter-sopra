import 'package:clicker/game_viewmodel.dart';
import 'package:flutter/material.dart';

import 'icon_list.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key, required this.viewModel}) : super(key: key);

  final GameViewModel viewModel;

  _textChanged(String newText) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: AnimatedBuilder(
            animation: viewModel,
            builder: (context, _) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('You have pushed the button this many times:'),
                  Text('${viewModel.counter}',
                      style: Theme.of(context).textTheme.headline4),
                  if (viewModel.counter > 3) const Text("Bravo!"),
                  const IconList(),
                  if (viewModel.isCounting == false)
                    ElevatedButton(
                        onPressed: viewModel.startGame,
                        child: const Text("Start Game")),
                  for (var i = 0; i < viewModel.counter; i++)
                    const Icon(Icons.accessibility)
                ],
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

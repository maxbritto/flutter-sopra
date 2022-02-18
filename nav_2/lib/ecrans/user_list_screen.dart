import 'package:flutter/material.dart';
import 'package:nav_2/ecrans/user_list_viewmodel.dart';

import '../data/user.dart';

class UserListScreen extends StatelessWidget {
  final UserListViewModel _viewModel;

  const UserListScreen(this._viewModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_viewModel.user.name),
      ),
      body: Center(
          child: AnimatedBuilder(
        animation: _viewModel,
        builder: (context, _) {
          if (_viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: _viewModel.userList.length,
              itemBuilder: (context, index) =>
                  _buildUserCell(_viewModel, index),
            );
          }
        },
      )),
    );
  }

  Widget _buildUserCell(UserListViewModel viewModel, int userIndex) {
    final user = viewModel.userList[userIndex];
    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.email),
      leading: const Icon(Icons.people_rounded),
    );
  }
}

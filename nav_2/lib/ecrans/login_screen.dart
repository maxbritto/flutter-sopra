import 'package:flutter/material.dart';
import 'package:nav_2/ecrans/login_viewmodel.dart';

class LoginScreen extends StatelessWidget {
  final LoginViewModel _viewModel;
  LoginScreen(this._viewModel, {Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bienvenue")),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: AutofillGroup(
            child: AnimatedBuilder(
                animation: _viewModel,
                builder: (context, _) {
                  return Column(
                    children: [
                      TextFormField(
                          decoration: const InputDecoration(
                              label: Text("Nom d'utilisateur")),
                          validator: _viewModel.errorMessageForEmailInput,
                          onSaved: _viewModel.userTypedUsername,
                          keyboardType: TextInputType.emailAddress,
                          autofillHints: const [
                            AutofillHints.username,
                            AutofillHints.email
                          ]),
                      TextFormField(
                          textInputAction: TextInputAction.send,
                          decoration: const InputDecoration(
                              label: Text("Mot de passe")),
                          validator: _viewModel.errorMessageForPasswordInput,
                          onSaved: _viewModel.userTypedPassword,
                          obscureText: true,
                          keyboardType: TextInputType.emailAddress,
                          autofillHints: const [
                            AutofillHints.username,
                            AutofillHints.email
                          ]),
                      ElevatedButton.icon(
                          onPressed: _viewModel.isLoading
                              ? null
                              : _submitButtonPressed,
                          icon: const Icon(Icons.login),
                          label: const Text("S'identifier")),
                      Text(_viewModel.userMessage),
                      if (_viewModel.isLoading)
                        const Center(child: CircularProgressIndicator()),
                    ],
                  );
                }),
          ),
        ),
      )),
    );
  }

  _submitButtonPressed() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      _viewModel.submitLogin();
    }
  }
}

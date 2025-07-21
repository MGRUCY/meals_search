import 'package:flutter/material.dart';

class NicknameForm extends StatefulWidget {
  final Function(String) onSaved;

  const NicknameForm({super.key, required this.onSaved});

  @override
  State<NicknameForm> createState() => _NicknameFormState();
}

class _NicknameFormState extends State<NicknameForm> {
  final _formKey = GlobalKey<FormState>();
  String _nickname = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Nickname'),
            validator: (value) =>
                value == null || value.isEmpty ? 'Enter a nickname' : null,
            onSaved: (value) => _nickname = value!,
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                widget.onSaved(_nickname);
              }
            },
            child: const Text('Confirm Nickname'),
          )
        ],
      ),
    );
  }
}

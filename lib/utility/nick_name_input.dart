import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NickNameInput extends StatefulWidget {
  const NickNameInput({super.key});

  @override
  State<NickNameInput> createState() => _NickNameInputState();
}

class _NickNameInputState extends State<NickNameInput> {
  final TextEditingController _nicknameController = TextEditingController();

  @override
  void dispose() {
    _nicknameController.dispose();
    super.dispose();
  }
  
  void _saveNickname() async {
    final nickname = _nicknameController.text.trim();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nickname', nickname);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Nickname saved: $nickname')),
    );
  }
    
    @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _nicknameController,
          decoration: const InputDecoration(labelText: 'Enter your nickname'),
        ),
        ElevatedButton(
          onPressed: _saveNickname,
          child: const Text('Save Favorite'),
        ),
      ],
    );
  }
}
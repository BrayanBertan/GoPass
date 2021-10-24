import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gopass_app/stores/signup_store.dart';

final signupStore = SignupStore();

class EventoCadastroPage extends StatefulWidget {
  const EventoCadastroPage({Key? key}) : super(key: key);

  @override
  _EventoCadastroPageState createState() => _EventoCadastroPageState();
}

class _EventoCadastroPageState extends State<EventoCadastroPage> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'Teste1';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(3, 155, 229, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Cadastro de eventos',
                  style: TextStyle(
                      fontSize: 40.0,
                      color: Color.fromRGBO(3, 155, 229, 1)),
                ),
                const SizedBox(
                  height: 25,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Observer(builder: (_) {
                      return TextField(
                        onChanged: signupStore.setNome,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nome',
                          isDense: true,
                          errorText: signupStore.nomeError,
                        ),
                      );
                    }),
                    Observer(builder: (_) {
                      return DropdownButton<String>(
                        value: dropdownValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>['Teste1', 'Teste2', 'Teste3', 'Teste4']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

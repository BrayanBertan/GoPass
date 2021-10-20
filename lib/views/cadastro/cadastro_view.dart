import 'dart:io';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gopass_app/stores/signup_store.dart';
import 'package:gopass_app/views/cadastro/componentes/image_options.dart';

final signupStore = SignupStore();

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  @override
  Widget build(BuildContext context) {
    File? _image;

    void onImageSelected(File image) async {
      Modular.to.pop();
      File tmpFile = File(image.path);
      signupStore.foto = tmpFile.path;
    }

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
                  'Cadastro de usuário',
                  style: TextStyle(
                      fontSize: 40.0, color: Color.fromRGBO(3, 155, 229, 1)),
                ),
                const SizedBox(
                  height: 50,
                ),
                Observer(builder: (_) {
                  return GestureDetector(
                    onTap: () => showModalBottomSheet(
                        context: context,
                        builder: (context) =>
                            ImageOptionsSheet(onImageSelected)),
                    child: CircleAvatar(
                        backgroundImage: signupStore.foto != null
                            ? FileImage(File(signupStore.foto!))
                            : ExactAssetImage('assets/images/avatar.png')
                                as ImageProvider,
                        minRadius: 75,
                        maxRadius: 100),
                  );
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Já possui conta?',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 16.0,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Modular.to.pushReplacementNamed('/login');
                      },
                      child: const Text(
                        'Entrar',
                        style: TextStyle(color: Color.fromRGBO(3, 155, 229, 1)),
                      ),
                    )
                  ],
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
                          labelText: 'Nome Completo',
                          prefixIcon: Icon(Icons.person),
                          isDense: true,
                          errorText: signupStore.nomeError,
                        ),
                      );
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Observer(builder: (_) {
                            return TextField(
                              onChanged: signupStore.setCpf,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                CpfInputFormatter(),
                              ],
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                labelText: 'Cpf',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.edit),
                                isDense: true,
                                errorText: signupStore.cpfError,
                              ),
                            );
                          }),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(child: Observer(builder: (_) {
                          return GestureDetector(
                            onTap: () async {
                              signupStore.nascimento = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now(),
                                locale: const Locale("pt"),
                              );
                            },
                            child: Card(
                              child: ListTile(
                                title: Text(signupStore.formatNascimento),
                                leading:
                                    Image.asset('assets/images/calendar.png'),
                              ),
                            ),
                          );
                        }))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: signupStore.setEmail,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                          isDense: true,
                          errorText: signupStore.emailError,
                        ),
                      );
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Observer(builder: (_) {
                            return TextField(
                              onChanged: signupStore.setSenha,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              decoration: InputDecoration(
                                  labelText: 'Senha',
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: Icon(Icons.remove_red_eye),
                                  isDense: true,
                                  errorText: signupStore.senhaError),
                            );
                          }),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Observer(builder: (_) {
                            return TextField(
                              onChanged: signupStore.setSenhaC,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              decoration: InputDecoration(
                                  labelText: 'Confirmar',
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: Icon(Icons.remove_red_eye),
                                  isDense: true,
                                  errorText: signupStore.senhaCError),
                            );
                          }),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Observer(builder: (_) {
                    return ElevatedButton(
                      onPressed: signupStore.isFormValid
                          ? () async {
                              signupStore.signUp().then((value) =>
                                  Modular.to.pushReplacementNamed('/login'));
                            }
                          : null,
                      child: const Text(
                        'Cadastrar',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

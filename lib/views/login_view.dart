import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gopass_app/stores/login_store.dart';
import 'package:gopass_app/stores/usuario_store.dart';
import 'package:mobx/mobx.dart';

final loginStore = Modular.get<LoginStore>();
final usuarioStore = Modular.get<UsuarioStore>();

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();

    when((_) => usuarioStore.usuario != null, () {
      Modular.to.pushReplacementNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(85, 218, 243, 1),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text(
                        'GoPass',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 60.0,
                            color: Color.fromRGBO(85, 218, 243, 1)),
                      ),
                      const CircleAvatar(
                          backgroundImage:
                              ExactAssetImage('assets/images/avatar.png'),
                          minRadius: 75,
                          maxRadius: 100),
                      const SizedBox(
                        height: 25,
                      ),
                      Observer(builder: (_) {
                        return TextField(
                          onChanged: loginStore.setEmail,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email),
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      Observer(builder: (_) {
                        return TextFormField(
                          onChanged: loginStore.setSenha,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: 'Senha',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: Icon(Icons.remove_red_eye),
                              errorText: loginStore.error),
                        );
                      }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Não possui conta?',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 16.0,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Modular.to.pushReplacementNamed('/cadastro');
                            },
                            child: const Text(
                              'Cadastrar',
                              style: TextStyle(
                                  color: Color.fromRGBO(85, 218, 243, 1)),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'assets/images/facebook.png',
                            width: 50,
                            height: 50,
                          ),
                          Image.asset(
                            'assets/images/instagram.png',
                            width: 50,
                            height: 50,
                          ),
                          Image.asset(
                            'assets/images/twitter.png',
                            width: 50,
                            height: 50,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(
                        color: Colors.black,
                        height: 30,
                      ),
                      Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Observer(builder: (_) {
                          return ElevatedButton(
                            onPressed: loginStore.login,
                            child: const Text(
                              'Entrar',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Observer(builder: (_) {
              return IgnorePointer(
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 1,
                  color: loginStore.isLoading
                      ? Colors.black26
                      : Colors.transparent,
                  child: Center(
                      child: Text(
                    loginStore.isLoading ? 'Verificando...' : '',
                    style: const TextStyle(
                        fontSize: 50, fontWeight: FontWeight.bold),
                  )),
                ),
                ignoring: !loginStore.isLoading,
              );
            })
          ],
        ));
  }
}

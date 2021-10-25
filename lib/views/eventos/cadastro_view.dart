import 'dart:io';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gopass_app/stores/signup_store.dart';
import 'package:gopass_app/views/cadastro/componentes/image_options.dart';

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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            const Text(
              'Cadastro de eventos',
              style: TextStyle(
                  fontSize: 40.0, color: Color.fromRGBO(3, 155, 229, 1)),
            ),
            const SizedBox(
              height: 25,
            ),
            Observer(builder: (_) {
              return GestureDetector(
                onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => ImageOptionsSheet(onImageSelected)),
                child: signupStore.foto != null
                    ? Image.file(
                        File(signupStore.foto!),
                        height: 300,
                      )
                    : Image.asset(
                        'assets/images/presentation.png',
                        height: 300,
                      ),
              );
            }),
            const SizedBox(
              height: 25,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Observer(builder: (_) {
                      return Expanded(
                          flex: 9,
                          child: TextField(
                            onChanged: signupStore.setNome,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Titulo',
                              isDense: true,
                              errorText: signupStore.nomeError,
                            ),
                          ));
                    }),
                    Expanded(flex: 1, child: Container()),
                    Expanded(
                      flex: 4,
                      child: TextButton(onPressed: () {
                        DatePicker.showDateTimePicker(context,
                            showTitleActions: true,
                            maxTime: DateTime.now(), onChanged: (date) {
                          print('change $date');
                        },
                            onConfirm: (date) {},
                            currentTime: DateTime.now(),
                            locale: LocaleType.pt);
                      }, child: Observer(
                        builder: (_) {
                          return Column(
                            children: [
                              Center(
                                child: Image.asset('assets/images/data.png'),
                              ),
                              Text(
                                '23/06/1998:23:00',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          );
                        },
                      )),
                    )
                  ],
                ),
                Center(
                  child: Text(
                    'Tipo de evento',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
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
                Wrap(
                  children: [
                    Center(
                      child: Text(
                        'Lotação míma e máxima',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Observer(builder: (_) {
                      return ListTile(
                        leading: Text('100'),
                        title: Transform(
                          alignment: FractionalOffset.center,
                          // Rotate sliders by 90 degrees
                          transform: new Matrix4.identity()
                            ..rotateZ(180 * 3.1415927 / 180),
                          child: RangeSlider(
                            values: RangeValues(100, 200),
                            onChanged: (RangeValues novo) {},
                            min: 0,
                            max: 300,
                            divisions: 20,
                          ),
                        ),
                        trailing: Text('200'),
                      );
                    }),
                  ],
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                    flex: 7,
                    child: Observer(builder: (_) {
                      return TextField(
                        onChanged: signupStore.setNome,
                        maxLines: 3,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Endereço',
                          isDense: true,
                          errorText: signupStore.nomeError,
                        ),
                      );
                    })),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 3,
                    child: Observer(builder: (_) {
                      return TextField(
                        onChanged: signupStore.setNome,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          RealInputFormatter(),
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Preço',
                          isDense: true,
                          errorText: signupStore.nomeError,
                        ),
                      );
                    }))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Observer(builder: (_) {
              return TextField(
                onChanged: signupStore.setNome,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Descrição',
                  isDense: true,
                  errorText: signupStore.nomeError,
                ),
              );
            }),
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
    );
  }
}

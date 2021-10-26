import 'dart:io';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gopass_app/stores/evento_store.dart';
import 'package:gopass_app/views/cadastro/componentes/image_options.dart';

final eventoStore = EventoStore();

class EventoCadastroPage extends StatefulWidget {
  const EventoCadastroPage({Key? key}) : super(key: key);

  @override
  _EventoCadastroPageState createState() => _EventoCadastroPageState();
}

class _EventoCadastroPageState extends State<EventoCadastroPage> {
  @override
  void initState() {
    eventoStore.getAllCategorias();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    File? _image;

    void onImageSelected(File image) async {
      Modular.to.pop();
      File tmpFile = File(image.path);
      eventoStore.foto = tmpFile.path;
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
                child: eventoStore.foto != null
                    ? Image.file(
                        File(eventoStore.foto!),
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
                          child: TextFormField(
                            initialValue: eventoStore.nome,
                            onChanged: eventoStore.setNome,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Titulo',
                              isDense: true,
                              errorText: eventoStore.nomeError,
                            ),
                          ));
                    }),
                    Expanded(flex: 1, child: Container()),
                    Expanded(
                      flex: 4,
                      child: TextButton(
                          onPressed: () {
                            DatePicker.showDateTimePicker(context,
                                showTitleActions: true,
                                minTime:
                                    DateTime.now().subtract(Duration(days: 1)),
                                onConfirm: (date) {
                              eventoStore.setData(date);
                            },
                                currentTime:
                                    eventoStore.dataEvento ?? DateTime.now(),
                                locale: LocaleType.pt);
                          },
                          child: Column(
                            children: [
                              Center(
                                child: Image.asset('assets/images/data.png'),
                              ),
                              Observer(builder: (_) {
                                return Text(
                                  eventoStore.formartDataEvento,
                                  style: TextStyle(fontSize: 12),
                                );
                              }),
                            ],
                          )),
                    )
                  ],
                ),
                const Center(
                  child: Text(
                    'Tipo de evento',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Observer(builder: (_) {
                  return DropdownButton<int>(
                    items: eventoStore.categorias
                        .map(
                          ((element) => DropdownMenuItem(
                                value: element.id,
                                child: Center(
                                  child: Text(
                                    element.nome!,
                                  ),
                                ),
                              )),
                        )
                        .toList(),
                    onChanged: (valor) {
                      eventoStore.setCategoria(valor!);
                    },
                    value: eventoStore.categoria,
                    isExpanded: true,
                  );
                }),
                Wrap(
                  children: [
                    const Center(
                      child: Text(
                        'Lotação míma e máxima',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Observer(builder: (_) {
                      return ListTile(
                        leading: Text('${eventoStore.lotacao.start}'),
                        title: RangeSlider(
                          values: eventoStore.lotacao,
                          onChanged: (RangeValues novo) {
                            eventoStore.setLotacao(novo);
                          },
                          min: 0,
                          max: 300,
                          divisions: 20,
                        ),
                        trailing: Text('${eventoStore.lotacao.end}'),
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
                        onChanged: eventoStore.setEndereco,
                        maxLines: 3,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Endereço',
                          isDense: true,
                          errorText: eventoStore.enderecoError,
                        ),
                      );
                    })),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 3,
                    child: Observer(builder: (_) {
                      return TextField(
                        onChanged: eventoStore.setPreco,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          RealInputFormatter(),
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Preço',
                          isDense: true,
                          errorText: eventoStore.precoError,
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
                onChanged: eventoStore.setDescricao,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Descrição',
                  isDense: true,
                  errorText: eventoStore.descricaoError,
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
                  onPressed: eventoStore.isFormValid
                      ? () async {
                          eventoStore.cadastro().then((value) => showDialog(
                              context: context,
                              builder: (_) {
                                return Dialog(
                                  child: Padding(
                                    padding: EdgeInsets.all(30),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset('assets/images/tick.png'),
                                        Text(
                                          'Evento salvo com sucesso',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 30),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }));
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

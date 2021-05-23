import 'dart:ui';

import 'package:eLocations_app/components/categoria_text.dart';
import 'package:eLocations_app/components/cidade_text.dart';
import 'package:eLocations_app/components/descricao_text.dart';
import 'package:eLocations_app/components/endereco_text.dart';
import 'package:eLocations_app/components/estado_text.dart';
import 'package:eLocations_app/components/titulo_text.dart';
import 'package:eLocations_app/data/db_estabelecimentos.dart';
import 'package:eLocations_app/views/estabelecimentos_imagens.dart';
import 'package:flutter/material.dart';
import 'package:eLocations_app/models/estabelecimentos.dart';

class EstabelecimentoForm extends StatefulWidget {
  EstabelecimentoForm({Key key}) : super(key: key);
  @override
  _EstabelecimentoFormState createState() => _EstabelecimentoFormState();
}

class _EstabelecimentoFormState extends State<EstabelecimentoForm> {
  _EstabelecimentoFormState();

  DbEstabelecimentos dbEstabelecimentos = DbEstabelecimentos();
  final _addFormKey = GlobalKey<FormState>();

  final _tituloController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _cidadeController = TextEditingController();
  final _estadoController = TextEditingController();
  final _categoriaController = TextEditingController();

  var _itemSelecionado = 'Selecione o estado:';
  var _categoriaSelecionada = 'Selecione a categoria: ';

  void _dropDownItemSelected(String novoItem) {
    setState(() {
      this._itemSelecionado = novoItem;
    });
  }

  void _dropDownItemSelectedCategoria(String novoItemC) {
    setState(() {
      this._categoriaSelecionada = novoItemC;
    });
  }

  var _estados = [
    'Selecione o estado:',
    'AC - Acre',
    'AL - Alagoas',
    'AP - Amapá',
    'AM - Amazonas',
    'BA - Bahia',
    'CE - Ceará',
    'DF - Distrito Federal',
    'ES - Espírito Santo',
    'GO - Goiás',
    'MA - Maranhão',
    'MT - Mato Grosso',
    'MS - Mato Grosso do Sul',
    'MG - Minas Gerais',
    'PA - Pará',
    'PB - Paraíba',
    'PR - Paraná',
    'PE - Pernambuco',
    'PI - Piauí',
    'RJ - Rio de Janeiro',
    'RN - Rio Grande do Norte',
    'RS - Rio Grande do Sul',
    'RO - Rondônia',
    'RR - Roraima',
    'SC - Santa Catarina',
    'SP - São Paulo',
    'SE - Sergipe',
    'TO - Tocantins'
  ];

  var _categorias = [
    'Selecione a categoria: ',
    'Lanchonete',
    'Restaurante',
    'Ponto de Ônibus',
    'Escola',
    'Posto de Gasolina',
    'Supermercado',
    'Outros...'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[400],
        title: const Text('eLocations'),
        elevation: 10,
        bottom: AppBar(
          backgroundColor: Colors.grey[50],
          leading: Icon(Icons.scatter_plot_rounded, color: Colors.grey[50]),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  color: Colors.grey[50],
                  child: Text(
                    'Dados',
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 10,
                ),
                FlatButton(
                  disabledTextColor: Colors.grey[200],
                  color: Colors.grey[50],
                  child: Text(
                    'Imagens',
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    if (_addFormKey.currentState.validate()) {
                      _addFormKey.currentState.save();
                      setState(() {
                        String titulo,
                            descricao,
                            endereco,
                            cidade,
                            estado,
                            categoria;
                        titulo = _tituloController.text;
                        descricao = _descricaoController.text;
                        endereco = _enderecoController.text;
                        cidade = _cidadeController.text;
                        estado = _estadoController.text;
                        categoria = _categoriaController.text;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EstabelecimentosImagens(
                                    titulo: titulo,
                                    descricao: descricao,
                                    endereco: endereco,
                                    cidade: cidade,
                                    estado: estado,
                                    categoria: categoria,
                                  )),
                        );
                      });
                    }
                  },
                )
              ],
            ),
            SizedBox(
              width: 100,
            ),
          ],
        ),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Container(
                padding: EdgeInsets.all(10.0),
                width: 440,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          TituloText(),
                          Card(
                            color: Colors.blueGrey[50],
                            child: Column(
                              children: [
                                TextFormField(
                                  style: TextStyle(color: Colors.blueGrey[600]),
                                  controller: _tituloController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: '',
                                      labelStyle: TextStyle(
                                          color: Colors.lightGreen[300],
                                          fontWeight: FontWeight.bold)),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Por favor preencher o campo titulo!';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          DescricaoText(),
                          Card(
                            color: Colors.blueGrey[50],
                            child: Column(
                              children: [
                                TextFormField(
                                  style: TextStyle(color: Colors.blueGrey[600]),
                                  controller: _descricaoController,
                                  onChanged: (value) {},
                                  decoration: InputDecoration(
                                      contentPadding: new EdgeInsets.symmetric(
                                          vertical: 40.0, horizontal: 10.0),
                                      border: OutlineInputBorder(),
                                      labelText: '',
                                      labelStyle: TextStyle(
                                          color: Colors.lightGreen[300],
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          EnderecoText(),
                          Card(
                            color: Colors.blueGrey[50],
                            child: Column(
                              children: [
                                TextFormField(
                                  style: TextStyle(color: Colors.blueGrey[600]),
                                  controller: _enderecoController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Por favor preencher o campo endereço!';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {},
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: '',
                                      labelStyle: TextStyle(
                                          color: Colors.lightGreen[300],
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          CidadeText(),
                          Card(
                            color: Colors.blueGrey[50],
                            child: Column(
                              children: [
                                TextFormField(
                                  style: TextStyle(color: Colors.blueGrey[600]),
                                  controller: _cidadeController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Por favor preencher o campo cidade!';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {},
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: '',
                                      labelStyle: TextStyle(
                                          color: Colors.lightGreen[300],
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          EstadoText(),
                          Card(
                            color: Colors.blueGrey[50],
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    DropdownButton<String>(
                                        underline: Container(),
                                        icon: Icon(
                                            Icons.arrow_circle_down_sharp,
                                            color: Colors.blueGrey[600]),
                                        dropdownColor: Colors.blueGrey[50],
                                        items: _estados
                                            .map((String dropDownStringItem) {
                                          return DropdownMenuItem<String>(
                                            value: dropDownStringItem,
                                            child: Text(
                                              dropDownStringItem,
                                              style: TextStyle(
                                                  color: Colors.blueGrey[600],
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged:
                                            (String novoItemSelecionado) {
                                          _dropDownItemSelected(
                                              novoItemSelecionado);
                                          setState(() {
                                            _estadoController.text =
                                                this._itemSelecionado =
                                                    novoItemSelecionado;
                                          });
                                        },
                                        value: _itemSelecionado)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          CategoriaText(),
                          Card(
                              color: Colors.blueGrey[50],
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      DropdownButton<String>(
                                          underline: Container(),
                                          icon: Icon(
                                              Icons.arrow_circle_down_sharp,
                                              color: Colors.blueGrey[600]),
                                          dropdownColor: Colors.blueGrey[50],
                                          items: _categorias
                                              .map((String dropDownStringItem) {
                                            return DropdownMenuItem<String>(
                                              value: dropDownStringItem,
                                              child: Text(
                                                dropDownStringItem,
                                                style: TextStyle(
                                                    color: Colors.blueGrey[600],
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged:
                                              (String novoItemSelecionado) {
                                            _dropDownItemSelectedCategoria(
                                                novoItemSelecionado);
                                            setState(() {
                                              _categoriaController.text =
                                                  this._categoriaSelecionada =
                                                      novoItemSelecionado;
                                            });
                                          },
                                          value: _categoriaSelecionada)
                                    ],
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              RaisedButton(
                                splashColor: Colors.red,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Sair',
                                    style: TextStyle(color: Colors.red)),
                                color: Colors.grey[50],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RaisedButton(
                                splashColor: Colors.red,
                                onPressed: () {
                                  if (_addFormKey.currentState.validate()) {
                                    _addFormKey.currentState.save();
                                    setState(() {
                                      String titulo,
                                          descricao,
                                          endereco,
                                          cidade,
                                          estado,
                                          categoria;
                                      titulo = _tituloController.text;
                                      descricao = _descricaoController.text;
                                      endereco = _enderecoController.text;
                                      cidade = _cidadeController.text;
                                      estado = _estadoController.text;
                                      categoria = _categoriaController.text;
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EstabelecimentosImagens(
                                                  titulo: titulo,
                                                  descricao: descricao,
                                                  endereco: endereco,
                                                  cidade: cidade,
                                                  estado: estado,
                                                  categoria: categoria,
                                                )),
                                      );
                                    });
                                  }
                                },
                                child: Text('Continuar',
                                    style: TextStyle(color: Colors.white)),
                                color: Colors.green[400],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

import 'package:eLocations_app/components/categoria_text.dart';
import 'package:eLocations_app/components/cidade_text.dart';
import 'package:eLocations_app/components/descricao_text.dart';
import 'package:eLocations_app/components/endereco_text.dart';
import 'package:eLocations_app/components/estado_text.dart';
import 'package:eLocations_app/components/titulo_text.dart';
import 'package:eLocations_app/data/db_estabelecimentos.dart';
import 'package:flutter/material.dart';
import 'package:eLocations_app/models/estabelecimentos.dart';

class EstabelecimentosFormEdit extends StatefulWidget {
  final Estabelecimentos estabelecimentos;
  EstabelecimentosFormEdit(this.estabelecimentos);

  @override
  _EstabelecimentosFormEditState createState() =>
      _EstabelecimentosFormEditState();
}

class _EstabelecimentosFormEditState extends State<EstabelecimentosFormEdit> {
  _EstabelecimentosFormEditState();
  DbEstabelecimentos dbEstabelecimentos = DbEstabelecimentos();

  final _addFormKey = GlobalKey<FormState>();
  int _id;
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
  void initState() {
    _id = widget.estabelecimentos.id;
    _tituloController.text = widget.estabelecimentos.titulo;
    _descricaoController.text = widget.estabelecimentos.descricao;
    _enderecoController.text = widget.estabelecimentos.endereco;
    _cidadeController.text = widget.estabelecimentos.cidade;
    _estadoController.text = widget.estabelecimentos.estado;
    _categoriaController.text = widget.estabelecimentos.categoria;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('eLocations'),
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
                                    style:
                                        TextStyle(color: Colors.blueGrey[600]),
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
                                    style:
                                        TextStyle(color: Colors.blueGrey[600]),
                                    controller: _descricaoController,
                                    onChanged: (value) {},
                                    decoration: InputDecoration(
                                        contentPadding:
                                            new EdgeInsets.symmetric(
                                                vertical: 40.0,
                                                horizontal: 10.0),
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
                                    style:
                                        TextStyle(color: Colors.blueGrey[600]),
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
                                    style:
                                        TextStyle(color: Colors.blueGrey[600]),
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
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                            items: _categorias.map(
                                                (String dropDownStringItem) {
                                              return DropdownMenuItem<String>(
                                                value: dropDownStringItem,
                                                child: Text(
                                                  dropDownStringItem,
                                                  style: TextStyle(
                                                      color:
                                                          Colors.blueGrey[600],
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
                                    _confirmDialog();
                                  },
                                  child: Text('Excluir Registro',
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
                                      final initDB =
                                          dbEstabelecimentos.initDB();
                                      initDB.then((db) async {
                                        await dbEstabelecimentos
                                            .updateEstabelecimentos(
                                                Estabelecimentos(
                                                    id: _id,
                                                    titulo:
                                                        _tituloController.text,
                                                    descricao:
                                                        _descricaoController
                                                            .text,
                                                    endereco:
                                                        _enderecoController
                                                            .text,
                                                    cidade:
                                                        _cidadeController.text,
                                                    estado:
                                                        _estadoController.text,
                                                    categoria:
                                                        _categoriaController
                                                            .text));
                                      });

                                      Navigator.popUntil(
                                          context,
                                          ModalRoute.withName(
                                              Navigator.defaultRouteName));
                                    }
                                  },
                                  child: Text('Salvar',
                                      style: TextStyle(color: Colors.white)),
                                  color: Colors.green[400],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))),
        ),
      ),
    );
  }

  Future<void> _confirmDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmação'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Deseja mesmo deletar esse estabelecimento ?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Sim'),
              onPressed: () {
                final initDB = dbEstabelecimentos.initDB();
                initDB.then((db) async {
                  await dbEstabelecimentos
                      .deleteEstabelecimentos(widget.estabelecimentos.id);
                });

                Navigator.popUntil(
                    context, ModalRoute.withName(Navigator.defaultRouteName));
              },
            ),
            FlatButton(
              child: const Text('Não'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

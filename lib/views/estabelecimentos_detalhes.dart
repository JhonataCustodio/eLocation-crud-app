import 'package:eLocations_app/components/categoria_text.dart';
import 'package:eLocations_app/components/cidade_text.dart';
import 'package:eLocations_app/components/descricao_text.dart';
import 'package:eLocations_app/components/endereco_text.dart';
import 'package:eLocations_app/components/estado_text.dart';
import 'package:eLocations_app/components/titulo_text.dart';
import 'package:eLocations_app/data/db_estabelecimentos.dart';
import 'package:eLocations_app/views/estabelecimentos_form_edit.dart';
import 'package:flutter/material.dart';
import 'package:eLocations_app/models/estabelecimentos.dart';

class EstabelecimentosDetalhes extends StatefulWidget {
  final Estabelecimentos estabelecimentos;
  EstabelecimentosDetalhes(this.estabelecimentos);

  @override
  _EstabelecimentosDetalhesState createState() =>
      _EstabelecimentosDetalhesState();
}

class _EstabelecimentosDetalhesState extends State<EstabelecimentosDetalhes> {
  _EstabelecimentosDetalhesState();
  DbEstabelecimentos dbEstabelecimentos = DbEstabelecimentos();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('eLocations'),
        backgroundColor: Colors.lightBlue[400],
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(20.0),
            child: Container(
                //padding: EdgeInsets.all(10.0),
                width: 440,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [TituloText()],
                    ),
                    Card(
                        color: Colors.blueGrey[50],
                        child: SizedBox(
                          height: 40,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    widget.estabelecimentos.titulo,
                                    style: TextStyle(
                                        color: Colors.blueGrey[600],
                                        fontSize: 18),
                                  )
                                ],
                              )
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [DescricaoText()],
                    ),
                    Card(
                        color: Colors.blueGrey[50],
                        child: SizedBox(
                          height: 40,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    widget.estabelecimentos.descricao,
                                    style: TextStyle(
                                        color: Colors.blueGrey[600],
                                        fontSize: 18),
                                  )
                                ],
                              )
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [EnderecoText()],
                    ),
                    Card(
                        color: Colors.blueGrey[50],
                        child: SizedBox(
                          height: 40,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    widget.estabelecimentos.endereco,
                                    style: TextStyle(
                                        color: Colors.blueGrey[600],
                                        fontSize: 18),
                                  )
                                ],
                              )
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [CidadeText()],
                    ),
                    Card(
                        color: Colors.blueGrey[50],
                        child: SizedBox(
                          height: 40,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    widget.estabelecimentos.cidade,
                                    style: TextStyle(
                                        color: Colors.blueGrey[600],
                                        fontSize: 18),
                                  )
                                ],
                              )
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [EstadoText()],
                    ),
                    Card(
                        color: Colors.blueGrey[50],
                        child: SizedBox(
                          height: 40,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    widget.estabelecimentos.estado,
                                    style: TextStyle(
                                        color: Colors.blueGrey[600],
                                        fontSize: 18),
                                  )
                                ],
                              )
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [CategoriaText()],
                    ),
                    Card(
                        color: Colors.blueGrey[50],
                        child: SizedBox(
                          height: 40,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    widget.estabelecimentos.categoria,
                                    style: TextStyle(
                                        color: Colors.blueGrey[600],
                                        fontSize: 18),
                                  )
                                ],
                              )
                            ],
                          ),
                        )),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              RaisedButton(
                                splashColor: Colors.red,
                                onPressed: () {
                                  _navigateToEditScreen(
                                      context, widget.estabelecimentos);
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('Editar',
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                                color: Colors.blueGrey[600],
                              ),
                              RaisedButton(
                                splashColor: Colors.red,
                                onPressed: () {
                                  _confirmDialog();
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('Deletar',
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                                color: Colors.blueGrey[600],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }

  _navigateToEditScreen(
      BuildContext context, Estabelecimentos estabelecimentos) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => EstabelecimentosFormEdit(estabelecimentos)),
    );
  }

  Future<void> _confirmDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmação!'),
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

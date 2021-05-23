import 'dart:io';

import 'package:badges/badges.dart';
import 'package:eLocations_app/data/db_estabelecimentos.dart';
import 'package:eLocations_app/models/estabelecimentos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class EstabelecimentosImagens extends StatefulWidget {
  String titulo, descricao, endereco, cidade, estado, categoria;
  EstabelecimentosImagens(
      {this.titulo,
      this.descricao,
      this.endereco,
      this.cidade,
      this.estado,
      this.categoria});
  @override
  _EstabelecimentosImagensState createState() =>
      _EstabelecimentosImagensState();
}

class _EstabelecimentosImagensState extends State<EstabelecimentosImagens> {
  DbEstabelecimentos dbEstabelecimentos = DbEstabelecimentos();
  final _addFormKey = GlobalKey<FormState>();
  var image;
  List imageArray = [];
  int i;

  _galeriaImagens() async {
    image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageArray.add(image);
      imageArray;
    });
  }

  _cameraImagens() async {
    image = await ImagePicker.pickImage(source: ImageSource.camera);
    imageArray.add(image);
    setState(() {
      imageArray;
      print(imageArray);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  void _onAlertPress() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new CupertinoAlertDialog(
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/gallery.png',
                      width: 50,
                    ),
                    Text('Galeria'),
                  ],
                ),
                onPressed: _galeriaImagens,
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'images/take_picture.png',
                      width: 50,
                    ),
                    Text('Camera'),
                  ],
                ),
                onPressed: _cameraImagens,
              ),
            ],
          );
        });
  }

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
                    onPressed: () {},
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
          child: Container(
              child: imageArray.isEmpty
                  ? Center(
                      child: Text('Nenhuma imagem selecionada !'),
                    )
                  : GridView.count(
                      crossAxisCount: 3,
                      children: List.generate(imageArray.length, (index) {
                        var img = imageArray[index];
                        return Padding(
                          padding: EdgeInsets.all(14),
                          child: Stack(
                            alignment: Alignment(1.1, -1.1),
                            children: [
                              Card(
                                child: Image.file(
                                  img,
                                  cacheHeight: 450,
                                  cacheWidth: 450,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Badge(
                                toAnimate: false,
                                shape: BadgeShape.circle,
                                badgeColor: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                                badgeContent: Icon(
                                  Icons.remove,
                                  size: 13,
                                  color: Colors.white,
                                ),
                                child: FlatButton(
                                    child: Text(''),
                                    onPressed: () {
                                      setState(() {
                                        imageArray.remove(imageArray[index]);
                                      });
                                    }),
                              ),
                            ],
                          ),
                        );
                      }),
                    )),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: '1',
              backgroundColor: Colors.lightBlue[400],
              onPressed: () {
                _onAlertPress();
              },
              child: Icon(Icons.add),
            ),
            SizedBox(
              width: 20,
            ),
            imageArray.isEmpty
                ? FloatingActionButton(
                    heroTag: '2',
                    backgroundColor: Colors.grey[100],
                    onPressed: () {},
                    child: Icon(
                      Icons.block,
                      color: Colors.grey[600],
                    ),
                  )
                : FloatingActionButton(
                    heroTag: '3',
                    backgroundColor: Colors.lightGreen[400],
                    onPressed: () {
                      if (_addFormKey.currentState.validate()) {
                        _addFormKey.currentState.save();
                        final initDB = dbEstabelecimentos.initDB();
                        initDB.then((db) async {
                          dbEstabelecimentos.insertEstabelecimentos(
                              Estabelecimentos(
                                  titulo: '${widget.titulo}',
                                  descricao: '${widget.descricao}',
                                  endereco: '${widget.endereco}',
                                  cidade: '${widget.cidade}',
                                  estado: '${widget.estado}',
                                  categoria: '${widget.categoria}',
                                  imagem: imageArray.toString()
                                  
                                  ));
                        });

                        Navigator.pop(context);
                      }
                      print('${widget.titulo}');
                    },
                    child: Icon(Icons.save),
                  ),
          ],
        ));
  }
}

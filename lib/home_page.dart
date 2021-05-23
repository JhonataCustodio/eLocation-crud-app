import 'package:eLocations_app/data/db_estabelecimentos.dart';
import 'package:eLocations_app/models/estabelecimentos.dart';
import 'package:eLocations_app/views/estabelecimentos_form.dart';
import 'package:eLocations_app/views/tabbar_view.dart';
import 'package:eLocations_app/views/estabelecimentos_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DbEstabelecimentos dbEstabelecimentos = DbEstabelecimentos();
  List<Estabelecimentos> estabelecimentosList;

  @override
  Widget build(BuildContext context) {
    if(estabelecimentosList == null) {
      estabelecimentosList = List<Estabelecimentos>();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('eLocations'),
        backgroundColor: Colors.lightBlue[400],
      ),
      body: new Container(
        child: new Center(
            child: new FutureBuilder(
              future: loadList(),
              builder: (context, snapshot) {
                return estabelecimentosList.length > 0? new EstabelecimentosList(estabelecimentos: estabelecimentosList):
                new Center(child:
                new Text('Sem estabelecimentos cadastrados!'));
              },
            )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue[400],
        onPressed: () {
          _navigateToAddScreen(context);
        },
        child: Icon(Icons.add),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future loadList() {
    final Future futureDB = dbEstabelecimentos.initDB();
    return futureDB.then((db) {
      Future<List<Estabelecimentos>> futureEstabelecimentos = dbEstabelecimentos.estabelecimentos();
      futureEstabelecimentos.then((estabelecimentosList) {
        setState(() {
          this.estabelecimentosList = estabelecimentosList;
        });
      });
    });
  }

  _navigateToAddScreen (BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EstabelecimentoForm()),
    );
  }
}
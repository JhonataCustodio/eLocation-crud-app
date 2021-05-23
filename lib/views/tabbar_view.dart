import 'package:eLocations_app/views/estabelecimentos_form.dart';
import 'package:eLocations_app/views/estabelecimentos_imagens.dart';
import 'package:flutter/material.dart';

class TabBarVieww extends StatefulWidget {
  TabBarVieww({Key key}) : super(key: key);
  @override
  _TabBarViewwState createState() => _TabBarViewwState();
}

class _TabBarViewwState extends State<TabBarVieww> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightBlue[400],
            title: const Text('eLocations'),
            elevation: 10,
          ),
          body: Container(
            padding: EdgeInsets.all(0),
            child: Column(
              children: [
                Card(
                  color: Colors.lightBlue[400],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FlatButton(
                        color: Colors.lightBlue[400],
                        child: Text('Dados'),
                        onPressed: () {},
                      ),
                      FlatButton(
                        color: Colors.lightBlue[400],
                        child: Text('Imagens'),
                        onPressed: () {},
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

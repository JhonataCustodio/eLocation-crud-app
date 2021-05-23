import 'package:eLocations_app/models/estabelecimentos.dart';
import 'package:eLocations_app/views/estabelecimentos_detalhes.dart';
import 'package:flutter/material.dart';

class EstabelecimentosList extends StatelessWidget {
  final List<Estabelecimentos> estabelecimentos;
  EstabelecimentosList({Key key, this.estabelecimentos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: estabelecimentos == null ? 0 : estabelecimentos.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        EstabelecimentosDetalhes(estabelecimentos[index])),
              );
            },
            child: ListTile(
              title: Text(estabelecimentos[index].titulo),
              subtitle: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text('Endereço: ' + estabelecimentos[index].endereco)
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text('Categoria: ' + estabelecimentos[index].categoria)
                    ],
                  ),
                ],
              ),
            ),
          ));
        });
  }
}

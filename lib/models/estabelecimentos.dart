
import 'dart:typed_data';

class Estabelecimentos{
  final int id;
  final String titulo;
  final String descricao;
  final String endereco;
  final String cidade;
  final String estado;
  final String categoria;
  final String imagem;

  Estabelecimentos({this.id, this.titulo, this.descricao, this.endereco, this.cidade, this.estado, this.categoria, this.imagem});
  
  Map<String,dynamic> toMap(){ // used when inserting data to the database
    return <String,dynamic>{
      "id" : id,
      "titulo" : titulo,
      "descricao" : descricao,
      "endereco" : endereco,
      "cidade" : cidade,
      "estado" : estado,
      "categoria" : categoria,
      "imagem" : imagem
    };
  }

  @override
  String toString() {
    return 'Estabelecimentos{id: $id, titulo: $titulo, descricao: $descricao, endereco: $endereco, cidade: $cidade, estado: $estado, categoria: $categoria, imagem: $imagem}';
  }
}
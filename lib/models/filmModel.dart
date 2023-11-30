import 'dart:html';

class FilmModel {
  String? uuid;
  int? usuario;
  String? titulo;
  String? descricao;
  String? linkImagem;
  String? dataDeLancamento;
  String? diretores;
  String? roteiristas;
  String? atores;
  String? generos;
  String? comentarios;
  double? estrelas;
  bool? favorito;
  String? status;

  FilmModel(
      {this.uuid,
      this.usuario,
      this.titulo,
      this.descricao,
      this.linkImagem,
      this.dataDeLancamento,
      this.diretores,
      this.roteiristas,
      this.atores,
      this.generos,
      this.comentarios,
      this.estrelas,
      this.favorito,
      this.status});

  FilmModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    usuario = json['usuario'];
    titulo = json['titulo'];
    descricao = json['descricao'];
    linkImagem = json['link_imagem'];
    dataDeLancamento = json['data_de_lancamento'];
    diretores = json['diretores'];
    roteiristas = json['roteiristas'];
    atores = json['atores'];
    generos = json['generos'];
    comentarios = json['comentarios'];
    estrelas = json['estrelas'];
    favorito = json['favorito'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['usuario'] = usuario;
    data['titulo'] = titulo;
    data['descricao'] = descricao;
    data['link_imagem'] = linkImagem;
    data['data_de_lancamento'] = dataDeLancamento;
    data['diretores'] = diretores;
    data['roteiristas'] = roteiristas;
    data['atores'] = atores;
    data['generos'] = generos;
    data['comentarios'] = comentarios;
    data['estrelas'] = estrelas;
    data['favorito'] = favorito;
    data['status'] = status;
    return data;
  }

}

class FilmModel {
  String? titulo;
  String? descricao;
  String? linkImagem;
  String? dataDeLancamento;
  String? diretores;
  String? roteiristas;
  String? atores;
  String? generos;
  String? comentarios;
  int? estrelas;
  bool? favorito;
  String? status;

  FilmModel(
      {this.titulo,
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titulo'] = this.titulo;
    data['descricao'] = this.descricao;
    data['link_imagem'] = this.linkImagem;
    data['data_de_lancamento'] = this.dataDeLancamento;
    data['diretores'] = this.diretores;
    data['roteiristas'] = this.roteiristas;
    data['atores'] = this.atores;
    data['generos'] = this.generos;
    data['comentarios'] = this.comentarios;
    data['estrelas'] = this.estrelas;
    data['favorito'] = this.favorito;
    data['status'] = this.status;
    return data;
  }
}

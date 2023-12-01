import 'package:dio/dio.dart';
import 'package:gengarbook/controllers/userController.dart';
import 'package:gengarbook/models/filmModel.dart';
import 'package:gengarbook/models/userModel.dart';

Future<void> getFilmData(String userId) async {
  try {
    final Dio dio = Dio();
    final response =
        await dio.get('https://apiloomi.onrender.com/filme/user/$userId');

    if (response.statusCode == 200) {
      final List<dynamic> filmList = response.data;

      for (var jsonData in filmList) {
        final film = FilmModel.fromJson(jsonData);
        print("""uiid: ${film.uuid}
            Usuário: ${film.usuario}
            Título: ${film.titulo}
            Descrição: ${film.descricao}
            Imagem: ${film.linkImagem}
            Data de Lançamento: ${film.dataDeLancamento}
            Diretor(s): ${film.diretores}
            Roteirista(s): ${film.roteiristas}
            Atores(as): ${film.atores}
            Generos: ${film.generos}
            Comentários: ${film.comentarios}
            Estrelas: ${film.estrelas}
            Favorito: ${film.favorito}
            Status: ${film.status}""");
      }
    } else {
      print('Falha ao carregar detalhes do filme: ${response.statusCode}');
    }
  } catch (e) {
    print('Erro ao carregar detalhes do filme: $e');
  }
}

Future<void> getIndividualFilm(String userId, String filmId) async {
  try {
    final Dio dio = Dio();
    final response = await dio.get(
      'https://apiloomi.onrender.com/filme/$filmId/user/$userId/',
    );

    if (response.statusCode == 200) {
      final film = FilmModel.fromJson(response.data);
      print("""Título: ${film.titulo}
          Descrição: ${film.descricao}
          Imagem: ${film.linkImagem}
          Data de Lançamento: ${film.dataDeLancamento}
          Diretor(s): ${film.diretores}
          Roteirista(s): ${film.roteiristas}
          Atores(as): ${film.atores}
          Gêneros: ${film.generos}
          Comentários: ${film.comentarios}
          Estrelas: ${film.estrelas}
          Favorito: ${film.favorito}
          Status: ${film.status}""");
    } else {
      print('Falha ao carregar detalhes do filme: ${response.statusCode}');
    }
  } catch (e) {
    print('Erro ao carregar detalhes do filme: $e');
  }
}

Future<void> patchFilm(
  String userId,
  String filmId,
  String titulo,
  String descricao,
  String linkImagem,
  String dataDeLancamento,
  String diretores,
  String roteiristas,
  String atores,
  String generos,
  String comentarios,
  double estrelas,
  bool favorito,
  String status,
) async {
  try {
    final film = FilmModel(
      titulo: titulo,
      descricao: descricao,
      linkImagem: linkImagem,
      dataDeLancamento: dataDeLancamento,
      diretores: diretores,
      roteiristas: roteiristas,
      atores: atores,
      generos: generos,
      comentarios: comentarios,
      estrelas: estrelas,
      favorito: favorito,
      status: status,
    );

    final Dio dio = Dio();
    final response = await dio.patch(
      'https://apiloomi.onrender.com/filme/$filmId/user/$userId',
      data: film.toJson(),
      options: Options(
        contentType: 'application/json; charset=UTF-8',
      ),
    );

    if (response.statusCode == 200) {
      final updatedFilm = FilmModel.fromJson(response.data);
      print("""Filme atualizado:
            Título: ${updatedFilm.titulo}
            Descrição: ${updatedFilm.descricao}
            Imagem: ${updatedFilm.linkImagem}
            Data de Lançamento: ${updatedFilm.dataDeLancamento}
            Diretor(s): ${updatedFilm.diretores}
            Roteirista(s): ${updatedFilm.roteiristas}
            Atores(as): ${updatedFilm.atores}
            Gêneros: ${updatedFilm.generos}
            Comentários: ${updatedFilm.comentarios}
            Estrelas: ${updatedFilm.estrelas}
            Favorito: ${updatedFilm.favorito}
            Status: ${updatedFilm.status}
            """);
    } else {
      print('Falha ao atualizar o filme: ${response.statusCode}');
    }
  } catch (e) {
    print('Erro ao atualizar o filme: $e');
  }
}

Future<void> postFilm(
  String userId,
  String titulo,
  String descricao,
  String linkImagem,
  String dataDeLancamento,
  String diretores,
  String roteiristas,
  String atores,
  String generos,
  String comentarios,
  double estrelas,
  bool favorito,
  String status,
) async {
  try {
    final film = FilmModel(
      titulo: titulo,
      descricao: descricao,
      linkImagem: linkImagem,
      dataDeLancamento: dataDeLancamento,
      diretores: diretores,
      roteiristas: roteiristas,
      atores: atores,
      generos: generos,
      comentarios: comentarios,
      estrelas: estrelas,
      favorito: favorito,
      status: status,
    );

    final Dio dio = Dio();
    dio.options.followRedirects = false;

    final response = await dio.post(
      'https://apiloomi.onrender.com/filme/user/$userId/',
      data: film.toJson(),
      options: Options(
        contentType: 'application/json; charset=UTF-8',
      ),
    );

    if (response.statusCode == 201) {
      final createdFilm = FilmModel.fromJson(response.data);
      print("""Novo filme criado:
            Título: ${createdFilm.titulo}
            Descrição: ${createdFilm.descricao}
            Imagem: ${createdFilm.linkImagem}
            Data de Lançamento: ${createdFilm.dataDeLancamento}
            Diretor(s): ${createdFilm.diretores}
            Roteirista(s): ${createdFilm.roteiristas}
            Atores(as): ${createdFilm.atores}
            Generos: ${createdFilm.generos}
            Comentários: ${createdFilm.comentarios}
            Estrelas: ${createdFilm.estrelas}
            Favorito: ${createdFilm.favorito}
            Status: ${createdFilm.status}
            """);
    } else {
      print('Falha ao criar filme: ${response.statusCode}');
    }
  } catch (e) {
    print('Erro ao criar filme: $e');
  }
}

Future<void> deleteFilm(String userId, String filmId) async {
  try {
    final Dio dio = Dio();
    final response = await dio.delete(
      'https://apiloomi.onrender.com/filme/$filmId/user/$userId/',
      options: Options(
        contentType: 'application/json; charset=UTF-8',
      ),
    );

    if (response.statusCode == 204) {
      print('Filme removido com sucesso!');
    } else {
      print('Falha ao excluir filme: ${response.statusCode}');
    }
  } catch (e) {
    print('Erro ao excluir filme: $e');
  }
}

Future<void> login(String username, String password) async {
  try {
    final Map<String, dynamic> requestBody = {
      'username': username,
      'password': password,
    };

    final Dio dio = Dio();
    final response = await dio.post(
      'https://apiloomi.onrender.com/login/',
      data: requestBody,
      options: Options(
        contentType: 'application/json; charset=UTF-8',
      ),
    );

    if (response.statusCode == 200) {
      final loginResponse = LoginResponse.fromJson(response.data);
      print('Login bem sucedido. ID do usuário: ${loginResponse.id}');

      final userStore = UserController();
      userStore.saveUserId(loginResponse.id.toString());
      print(loginResponse.id.toString());
    } else {
      print('Falha ao realizar login: ${response.statusCode}');
    }
  } catch (e) {
    print('Erro ao realizar login: $e');
  }
}

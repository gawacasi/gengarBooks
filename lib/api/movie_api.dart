import 'package:dio/dio.dart';
import 'package:gengarmovies/controllers/user_controller.dart';
import 'package:gengarmovies/models/movie_model.dart';
import 'package:gengarmovies/models/user_model.dart';

Future<List<MovieModel>> getMovieData(String userId) async {
  try {
    final Dio dio = Dio();
    final response =
        await dio.get('https://apiloomi.onrender.com/filme/user/$userId');

    if (response.statusCode == 200) {
      final List<dynamic> movieListData = response.data;
      List<MovieModel> movieList =
          movieListData.map((data) => MovieModel.fromJson(data)).toList();

      return movieList;
    } else {
      print('Falha ao carregar detalhes do moviee: ${response.statusCode}');
      return []; // Retorna uma lista vazia em caso de falha
    }
  } catch (e) {
    print('Erro ao carregar detalhes do moviee: $e');
    return []; // Retorna uma lista vazia em caso de erro
  }
}

Future<void> getIndividualMovie(String userId, String filmeId) async {
  try {
    final Dio dio = Dio();
    final response = await dio.get(
      'https://apiloomi.onrender.com/filme/$filmeId/user/$userId/',
    );

    if (response.statusCode == 200) {
      final movie = MovieModel.fromJson(response.data);
      print("""Título: ${movie.titulo}
          Descrição: ${movie.descricao}
          Imagem: ${movie.linkImagem}
          Data de Lançamento: ${movie.dataDeLancamento}
          Diretor(s): ${movie.diretores}
          Roteirista(s): ${movie.roteiristas}
          Atores(as): ${movie.atores}
          Gêneros: ${movie.generos}
          Comentários: ${movie.comentarios}
          Estrelas: ${movie.estrelas}
          Favorito: ${movie.favorito}
          Status: ${movie.status}""");
    } else {
      print('Falha ao carregar detalhes do moviee: ${response.statusCode}');
    }
  } catch (e) {
    print('Erro ao carregar detalhes do moviee: $e');
  }
}

Future<void> patchMovie(
  String userId,
  String filmeId,
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
    final movie = MovieModel(
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
      'https://apiloomi.onrender.com/filme/$filmeId/user/$userId',
      data: movie.toJson(),
      options: Options(
        contentType: 'application/json; charset=UTF-8',
      ),
    );

    if (response.statusCode == 200) {
      final updatedMovie = MovieModel.fromJson(response.data);
      print("""Moviee atualizado:
            Título: ${updatedMovie.titulo}
            Descrição: ${updatedMovie.descricao}
            Imagem: ${updatedMovie.linkImagem}
            Data de Lançamento: ${updatedMovie.dataDeLancamento}
            Diretor(s): ${updatedMovie.diretores}
            Roteirista(s): ${updatedMovie.roteiristas}
            Atores(as): ${updatedMovie.atores}
            Gêneros: ${updatedMovie.generos}
            Comentários: ${updatedMovie.comentarios}
            Estrelas: ${updatedMovie.estrelas}
            Favorito: ${updatedMovie.favorito}
            Status: ${updatedMovie.status}
            """);
    } else {
      print('Falha ao atualizar o moviee: ${response.statusCode}');
    }
  } catch (e) {
    print('Erro ao atualizar o moviee: $e');
  }
}

Future<void> postMovie(
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
    final movie = MovieModel(
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
      'https://apiloomi.onrender.com/moviee/user/$userId/',
      data: movie.toJson(),
      options: Options(
        contentType: 'application/json; charset=UTF-8',
      ),
    );

    if (response.statusCode == 201) {
      final createdMovie = MovieModel.fromJson(response.data);
      print("""Novo moviee criado:
            Título: ${createdMovie.titulo}
            Descrição: ${createdMovie.descricao}
            Imagem: ${createdMovie.linkImagem}
            Data de Lançamento: ${createdMovie.dataDeLancamento}
            Diretor(s): ${createdMovie.diretores}
            Roteirista(s): ${createdMovie.roteiristas}
            Atores(as): ${createdMovie.atores}
            Generos: ${createdMovie.generos}
            Comentários: ${createdMovie.comentarios}
            Estrelas: ${createdMovie.estrelas}
            Favorito: ${createdMovie.favorito}
            Status: ${createdMovie.status}
            """);
    } else {
      print('Falha ao criar moviee: ${response.statusCode}');
    }
  } catch (e) {
    print('Erro ao criar moviee: $e');
  }
}

Future<void> deleteMovie(String userId, String filmeId) async {
  try {
    final Dio dio = Dio();
    final response = await dio.delete(
      'https://apiloomi.onrender.com/moviee/$filmeId/user/$userId/',
      options: Options(
        contentType: 'application/json; charset=UTF-8',
      ),
    );

    if (response.statusCode == 204) {
      print('Moviee removido com sucesso!');
    } else {
      print('Falha ao excluir moviee: ${response.statusCode}');
    }
  } catch (e) {
    print('Erro ao excluir moviee: $e');
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

      final userStorage = UserController();
      userStorage.saveUserId(loginResponse.id.toString());
      print(loginResponse.id.toString());
    } else {
      print('Falha ao realizar login: ${response.statusCode}');
    }
  } catch (e) {
    print('Erro ao realizar login: $e');
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gengarmovies/api/movie_api.dart';
import 'package:gengarmovies/controllers/user_controller.dart';
import 'package:gengarmovies/models/movie_model.dart';
import 'package:gengarmovies/widgets/card_list_movies.dart';
import 'package:gengarmovies/widgets/new_movie_model.dart';

final userStorage = UserController();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<String> _usernameFuture;
  late Future<String> _userIdFuture;
  late Future<List<MovieModel>> _moviesFuture;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    _usernameFuture = getUsername();
    _userIdFuture = getUserId();
    final userId = await _userIdFuture;
    _moviesFuture = getMovieData(userId);
  }

  Future<String> getUsername() async {
    String username = await userStorage.loadUsername();
    return username;
  }

  Future<String> getUserId() async {
    String userId = await userStorage.loadUserId();
    return userId;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _usernameFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Erro ao carregar o nome de usuário');
        } else {
          String username = snapshot.data ?? '';
          return Scaffold(
            backgroundColor: Colors.grey.shade200,
            appBar: AppBar(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0,
              title: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.deepPurple.shade100,
                  radius: 20,
                  child: Image.asset(
                    'assets/gengar.png',
                    width: 25,
                  ),
                ),
                title: const Text(
                  'Bem vindo!',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                subtitle: Text(
                  username,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(CupertinoIcons.calendar),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(CupertinoIcons.bell),
                      )
                    ],
                  ),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Movies Ativos!",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                            Text(
                              "Movies Ativos",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple.shade50,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          onPressed: () => showModalBottomSheet(
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            context: context,
                            builder: (context) => const NewMovieModel(),
                          ),
                          child: const Text(
                            "+ Novo Movie",
                            style: TextStyle(color: Colors.deepPurple),
                          ),
                        ),
                      ],
                    ),
                    const Gap(20),
                    FutureBuilder<List<MovieModel>>(
                      future: _moviesFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text(
                              'Erro ao carregar filmes: ${snapshot.error}');
                        } else {
                          final List<MovieModel> movies = snapshot.data ?? [];
                          return CardListMovies(
                            movies: movies,
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

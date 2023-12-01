import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gengarmovies/models/movie_model.dart';

class CardListMovies extends StatelessWidget {
  final List<MovieModel> movies;

  const CardListMovies({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return Container(
          width: double.infinity,
          height: 148,
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 10,
                decoration: const BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 10,
                        ),
                        title: Text(movie.titulo.toString()),
                        subtitle: Text(
                          _getShortDescription(movie.descricao.toString()),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        trailing: Transform.scale(
                          scale: 1.5,
                          child: SizedBox(
                            height: 30,
                            child: Image.network(
                              movie.linkImagem.toString(),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(0, -10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 20,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Divider(
                                thickness: 1.5,
                                color: Colors.grey,
                              ),
                              Row(
                                children: [
                                  Text(movie.dataDeLancamento.toString()),
                                  const SizedBox(width: 12),
                                  const Text('09:15 AM - 11:45 PM'),
                                  const Spacer(),
                                  Transform.scale(
                                    scale: 1.5,
                                    child: Checkbox(
                                      shape: const CircleBorder(),
                                      value: true,
                                      activeColor: Colors.purple,
                                      onChanged: (value) => print(value),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getShortDescription(String description) {
    if (description.length > 50) {
      return description.substring(0, 50) + '...';
    }
    return description;
  }
}

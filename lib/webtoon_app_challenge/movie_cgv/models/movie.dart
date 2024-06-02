class Movie {
  Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.adult,
    required this.voteAverage,
    required this.popularity,
    required this.releaseDate,
  });

  final int id;
  final String title;
  final String posterPath;
  final bool adult;
  final num voteAverage;
  final num popularity;
  final String releaseDate;

  Movie.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        posterPath = json['poster_path'],
        adult = json['adult'],
        voteAverage = json['vote_average'],
        popularity = json['popularity'],
        releaseDate = json['release_date'];
}

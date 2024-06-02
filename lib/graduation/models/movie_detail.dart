class MovieDetail {
  MovieDetail({
    required this.title,
    required this.posterPath,
    required this.rating,
    required this.runtime,
    required this.genres,
    required this.storyline,
  });

  final String title;
  final String posterPath;
  final num rating;
  final int runtime;
  final List<String> genres;
  final String storyline;

  MovieDetail.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        posterPath = json['poster_path'],
        rating = json['vote_average'],
        runtime = json['runtime'],
        genres = (json['genres'] as List<dynamic>)
            .map((e) => e['name'] as String)
            .toList(),
        storyline = json['overview'];
}

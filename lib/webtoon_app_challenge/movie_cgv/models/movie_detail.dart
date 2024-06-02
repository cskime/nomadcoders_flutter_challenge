class MovieDetail {
  MovieDetail({
    required this.title,
    required this.posterPath,
    required this.rating,
    required this.runtime,
    required this.genres,
    required this.storyline,
    required this.companyLogoPaths,
  });

  final String title;
  final String posterPath;
  final num rating;
  final int runtime;
  final List<String> genres;
  final String storyline;
  final List<String> companyLogoPaths;

  MovieDetail.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        posterPath = json['poster_path'],
        rating = json['vote_average'],
        runtime = json['runtime'],
        genres = (json['genres'] as List<dynamic>)
            .map((json) => json['name'] as String)
            .toList(),
        storyline = json['overview'],
        companyLogoPaths = (json['production_companies'] as List<dynamic>)
            .map<String>((json) => json['logo_path'] ?? '')
            .where((path) => path.isNotEmpty)
            .toList();
}

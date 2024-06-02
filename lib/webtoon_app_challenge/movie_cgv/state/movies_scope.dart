import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/webtoon_app_challenge/movie_cgv/services/movie_service.dart';

class MoviesScope extends StatefulWidget {
  const MoviesScope({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<MoviesScope> createState() => _MoviesScopeState();
}

class _MoviesScopeState extends State<MoviesScope> {
  final _service = const MovieService();

  @override
  Widget build(BuildContext context) {
    return MovieServiceState(
      service: _service,
      child: widget.child,
    );
  }
}

class MovieServiceState extends InheritedWidget {
  const MovieServiceState({
    super.key,
    required super.child,
    required this.service,
  });

  final MovieService service;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static MovieServiceState of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MovieServiceState>()!;
}

import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/graduation/features/chart/movie_chart_screen.dart';
import 'package:nomadcoders_flutter_challenge/graduation/state/movies_scope.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatefulWidget {
  const MovieApp({super.key});

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  @override
  Widget build(BuildContext context) {
    return MoviesScope(
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: const Color(0xFFCA2127),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
          ),
        ),
        home: const MovieChartScreen(),
      ),
    );
  }
}

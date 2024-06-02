enum ChartOption {
  popular,
  nowPlaying,
  comingSoon;

  String get title => switch (this) {
        ChartOption.popular => 'Popular',
        ChartOption.nowPlaying => 'Now Playing',
        ChartOption.comingSoon => 'Coming Soon',
      };
}

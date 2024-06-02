enum ChartOption {
  popular,
  nowPlaying,
  comingSoon;

  String get title => switch (this) {
        ChartOption.popular => '무비차트',
        ChartOption.nowPlaying => '현재상영작',
        ChartOption.comingSoon => '상영예정',
      };
}

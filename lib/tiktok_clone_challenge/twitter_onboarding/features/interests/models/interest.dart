enum Interest {
  fashionBeauty,
  outdoors,
  artCulture,
  animationComics,
  businessFinance,
  food,
  travel,
  entertainment,
  music,
  gaming;

  String get title => switch (this) {
        Interest.fashionBeauty => 'Fashion & beauty',
        Interest.outdoors => 'Outdoors',
        Interest.artCulture => 'Arts & culture',
        Interest.animationComics => 'Animation & comics',
        Interest.businessFinance => 'Business & finance',
        Interest.food => 'Food',
        Interest.travel => 'Travel',
        Interest.entertainment => 'Entertainment',
        Interest.music => 'Music',
        Interest.gaming => 'Gaming',
      };
}

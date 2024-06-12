enum PostMoreItem {
  unfollow,
  mute,
  hide,
  report;

  String get title => switch (this) {
        PostMoreItem.unfollow => 'Unfollow',
        PostMoreItem.mute => 'Mute',
        PostMoreItem.hide => 'Hide',
        PostMoreItem.report => 'Report',
      };
}

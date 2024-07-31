import 'dart:ui';

import '../services/release_date_formatter.dart';
import '../view_models/albums_view_model.dart';
import 'tracks_screen.dart';
import 'widgets/album/album_cover.dart';
import 'widgets/album/album_to_track_button.dart';
import '../../search/models/artist/artist_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlbumsScreen extends ConsumerStatefulWidget {
  const AlbumsScreen(
    this.artist, {
    super.key,
  });

  final ArtistModel artist;

  @override
  ConsumerState<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends ConsumerState<AlbumsScreen> {
  final _pageController = PageController(
    viewportFraction: 0.7,
  );

  int _currentPageIndex = 0;
  final _scaleOffset = ValueNotifier<double>(0);
  int? _currentAlbumId;

  bool _dragging = false;
  bool _showAlbumTracks = false;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.page != null) {
        _scaleOffset.value = _pageController.page!;
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onBackPressed() {
    Navigator.of(context).pop();
  }

  void _onPageChanged(int value) {
    setState(() {
      _currentPageIndex = value;
    });
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    if (_dragging) {
      return;
    }
    _dragging = true;
    _showsTrack(details.delta.dy.isNegative);
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    _dragging = false;
  }

  void _onShowAlbumPressed() {
    _showsTrack(false);
  }

  void _onShowTrackPressed() {
    _showsTrack(true);
  }

  void _showsTrack(bool shows) {
    setState(() {
      _showAlbumTracks = shows;
    });
  }

  @override
  Widget build(BuildContext context) {
    _currentAlbumId = ref
        .read(albumsViewModelProvider(widget.artist.artistId).notifier)
        .albumIdAtIndex(_currentPageIndex);

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: IconButton(
          icon: const Icon(Icons.keyboard_arrow_up_rounded),
          onPressed: _onShowAlbumPressed,
        )._animateFadeIn(
          forward: _showAlbumTracks,
          reverse: false,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: _onBackPressed,
        )._animateFadeOut(
          forward: _showAlbumTracks,
          reverse: false,
        ),
      ),
      body: ref.watch(albumsViewModelProvider(widget.artist.artistId)).when(
            data: (data) => data.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("No Albums founded"),
                      ],
                    ),
                  )
                : GestureDetector(
                    onVerticalDragUpdate: _onVerticalDragUpdate,
                    onVerticalDragEnd: _onVerticalDragEnd,
                    child: Stack(
                      children: [
                        AnimatedSwitcher(
                          duration: 250.ms,
                          child: LayoutBuilder(
                            key: ValueKey(_currentPageIndex),
                            builder: (context, constraints) => Image.network(
                              data[_currentPageIndex].artworkUrl100,
                              fit: BoxFit.cover,
                              width: constraints.maxWidth,
                              height: constraints.maxHeight,
                            ),
                          ),
                        ),
                        ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ),
                        ),
                        PageView.builder(
                          controller: _pageController,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final album = data[index];
                            return Center(
                              child: ValueListenableBuilder(
                                valueListenable: _scaleOffset,
                                builder: (context, value, child) {
                                  final difference =
                                      (value - index).abs() * 0.2;
                                  final scale = 1 - difference;
                                  return Transform.scale(
                                    scale: scale,
                                    child: AlbumCover(
                                      coverUrlString: album.artworkUrl100,
                                      albumName: album.collectionName,
                                      releaseYear: ReleaseDateFormatter()
                                          .dateTime(album.releaseDate)
                                          .year
                                          .toString(),
                                      genre: album.primaryGenreName,
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                          onPageChanged: _onPageChanged,
                        )._animatePageY(
                          context: context,
                          forward: _showAlbumTracks,
                          reverse: false,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SafeArea(
                            child: AlbumToTrackButton(
                                onPressed: _onShowTrackPressed),
                          ),
                        )._animatePageY(
                            context: context,
                            forward: _showAlbumTracks,
                            reverse: false),
                        if (_currentAlbumId != null)
                          TracksScreen(albumId: _currentAlbumId!)._animatePageY(
                            context: context,
                            forward: _showAlbumTracks,
                            reverse: true,
                          ),
                      ],
                    ),
                  ),
            error: (error, stackTrace) => Center(
              child: Text(error.toString()),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.white,
              ),
            ),
          ),
    );
  }
}

extension VerticalMoveAnimate on Widget {
  Animate _animateFadeIn({
    required bool forward,
    required bool reverse,
  }) {
    return animate(
      autoPlay: false,
      target: forward ? 1 : 0,
    ).fade(
      begin: reverse ? 1 : 0,
      end: reverse ? 0 : 1,
      duration: 1.seconds,
      curve: Curves.easeInOut,
    );
  }

  Animate _animateFadeOut({
    required bool forward,
    required bool reverse,
  }) {
    return animate(
      autoPlay: false,
      target: forward ? 1 : 0,
    ).fade(
      begin: reverse ? 0 : 1,
      end: reverse ? 1 : 0,
      duration: 1.seconds,
      curve: Curves.easeInOut,
    );
  }

  Animate _animatePageY({
    required BuildContext context,
    required bool forward,
    required bool reverse,
  }) {
    final height = MediaQuery.sizeOf(context).height;
    return animate(
      autoPlay: false,
      target: forward ? 1 : 0,
    ).moveY(
      begin: reverse ? height : 0,
      end: reverse ? 0 : -height,
      duration: 1.seconds,
      curve: Curves.easeInOut,
    );
  }
}

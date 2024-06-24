import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/post/new_post/widgets/write_post_app_bar.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/post/new_post/widgets/write_post_bottom_bar.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/post/new_post/widgets/write_post_edit_area.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/models/user.dart';

final _myUser = dummyUsers[0];

class WriteScreen extends StatefulWidget {
  const WriteScreen({super.key});

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  final _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 1,
      minChildSize: 1,
      builder: (context, scrollController) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final keyboardHeight = MediaQuery.viewInsetsOf(context).bottom;
            const appBarHeight = 58.0;
            const bottomBarHeight = 48.0;
            final inputHeight = constraints.maxHeight -
                keyboardHeight -
                appBarHeight -
                bottomBarHeight -
                80;

            const borderRadius = BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            );

            return Container(
              decoration: const BoxDecoration(
                borderRadius: borderRadius,
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: appBarHeight,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: inputHeight,
                      child: WritePostEditArea(
                        userProfileImage: AssetImage(_myUser.profileImagePath!),
                        username: _myUser.username,
                        textEditingController: _textEditingController,
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.topCenter,
                    child: WritePostAppBar(
                      title: "New thread",
                      height: appBarHeight,
                      borderRadius: borderRadius,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: keyboardHeight,
                    child: SafeArea(
                      child: WritePostBottomBar(
                        height: bottomBarHeight,
                        canPost: _textEditingController.text.isNotEmpty,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}

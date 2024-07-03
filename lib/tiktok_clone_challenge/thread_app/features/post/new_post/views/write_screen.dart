import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/post/new_post/view_models/write_view_model.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/post/new_post/views/widgets/write_post_app_bar.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/post/new_post/views/widgets/write_post_bottom_bar.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/post/new_post/views/widgets/write_post_edit_area.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/user/repositories/users_repository.dart';

class WriteScreen extends ConsumerStatefulWidget {
  const WriteScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WriteScreenState();
}

class _WriteScreenState extends ConsumerState<WriteScreen> {
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

  void _onClose() {
    FocusScope.of(context).unfocus();
    Navigator.of(context).pop();
  }

  void _onPostPressed() async {
    await ref.read(writeViewModelProvider.notifier).uploadPost();
    _onClose();
  }

  @override
  Widget build(BuildContext context) {
    final isUploading = ref.watch(writeViewModelProvider).isLoading;
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
                      child: ref.watch(myUserProvider).when(
                            data: (data) => WritePostEditArea(
                              userProfileImage: AssetImage(
                                data.profileImageUrl!,
                              ),
                              username: data.username,
                              textEditingController: _textEditingController,
                            ),
                            error: (error, stackTrace) => const Center(
                              child: Text("Fail to fetch user profile."),
                            ),
                            loading: () => const Center(
                              child: CircularProgressIndicator.adaptive(),
                            ),
                          ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: WritePostAppBar(
                      title: "New thread",
                      height: appBarHeight,
                      borderRadius: borderRadius,
                      onClose: _onClose,
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
                        loading: isUploading,
                        onPostPressed: _onPostPressed,
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

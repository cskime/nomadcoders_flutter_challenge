import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/common/widgets/bottom_sheet_handle.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/post/post_more/models/post_more_item.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/post/post_more/widgets/post_more_section.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/post/post_more/widgets/post_more_section_item.dart';

class PostMoreBottomSheet extends StatelessWidget {
  const PostMoreBottomSheet({super.key});

  void _onTap(BuildContext context, PostMoreItem item) {
    Navigator.of(context).pop(item);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 16, bottom: 20),
                child: BottomSheetHandle(),
              ),
              PostMoreSection(
                items: [
                  PostMoreSectionItem(
                    item: PostMoreItem.unfollow,
                    onTap: () => _onTap(context, PostMoreItem.unfollow),
                  ),
                  PostMoreSectionItem(
                    item: PostMoreItem.mute,
                    onTap: () => _onTap(context, PostMoreItem.mute),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              PostMoreSection(
                items: [
                  PostMoreSectionItem(
                    item: PostMoreItem.hide,
                    onTap: () => _onTap(context, PostMoreItem.hide),
                  ),
                  PostMoreSectionItem(
                    item: PostMoreItem.report,
                    type: PostMoreSectionItemType.danger,
                    onTap: () => _onTap(context, PostMoreItem.report),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

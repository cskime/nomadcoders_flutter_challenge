import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/home/widgets/more/post_more_section.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/home/widgets/more/post_more_section_item.dart';

class PostMoreBottomSheet extends StatelessWidget {
  const PostMoreBottomSheet({super.key});

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
      child: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16, bottom: 20),
                child: _Handle(),
              ),
              PostMoreSection(
                items: [
                  PostMoreSectionItem(title: 'Unfollow'),
                  PostMoreSectionItem(title: 'Mute'),
                ],
              ),
              SizedBox(height: 24),
              PostMoreSection(
                items: [
                  PostMoreSectionItem(title: 'Hide'),
                  PostMoreSectionItem(
                    title: 'Report',
                    type: PostMoreSectionItemType.danger,
                  ),
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _Handle extends StatelessWidget {
  const _Handle();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 6,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

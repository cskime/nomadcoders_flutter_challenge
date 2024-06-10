import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/home/widgets/post_list_item_avatar.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/models/user.dart';

class PostListItemUserAvatar extends StatelessWidget {
  const PostListItemUserAvatar({
    super.key,
    required this.user,
  });

  final User user;

  // TODO: 이미지 들어있는 post 개발
  // TODO: avatar에 이미지 넣기
  // TODO: IntrinsicHeight 사용법 한번 더 이해하고 해결 방법 정리하기
  //       - post 내용에 따라 세로 선이 늘어나야 함
  //       - Parent widget의 height constraint가 infinity이므로 Expanded 같은 widget을 쓸 수 없는 문제
  //       - 왼쪽/오른쪽 column을 묶는 IntrinsicHeight을 추가해서 post content height으로 constraint를 주도록 수정
  //       - Column 영역 등을 사각형으로 그려가면서 설명해 보기

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: PostListItemAvatar(placeholder: user.initial),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.white, width: 3),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                FontAwesomeIcons.plus,
                color: Colors.white,
                size: 10,
              ),
            ),
          )
        ],
      ),
    );
  }
}

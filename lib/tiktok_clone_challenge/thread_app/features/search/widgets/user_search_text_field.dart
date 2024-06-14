import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserSearchTextField extends SliverPersistentHeaderDelegate {
  UserSearchTextField({this.onSearchChanged});

  final void Function(String text)? onSearchChanged;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CupertinoSearchTextField(
        onChanged: onSearchChanged,
      ),
    );
  }

  @override
  double get maxExtent => 36;

  @override
  double get minExtent => 36;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

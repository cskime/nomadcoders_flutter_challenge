import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/constants/palette.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/text_link_span.dart';

@immutable
class Link {
  const Link({
    required this.text,
    this.style,
    required this.callback,
  });

  final String text;
  final TextStyle? style;
  final void Function() callback;

  @override
  bool operator ==(Object other) {
    return other is Link && text == other.text;
  }

  @override
  int get hashCode => text.hashCode;

  @override
  String toString() {
    return '[[$text]]';
  }
}

typedef _PositionedLink = ({int position, Link link});

class LinkableText extends StatelessWidget {
  const LinkableText({
    super.key,
    required this.text,
    this.links = const [],
  });

  final String text;
  final List<Link> links;

  List<_PositionedLink> _sortedLinksBySpanOrder() {
    var indexedLinks = <Link, List<int>>{};

    for (final link in links) {
      final index = text.indexOf(link.text);

      indexedLinks.update(
        link,
        (value) => [...value, index],
        ifAbsent: () => [index],
      );
    }

    final sortedEntries = indexedLinks.entries
        .expand(
          (entry) => entry.value.map<_PositionedLink>(
            (index) => (position: index, link: entry.key),
          ),
        )
        .toList()
      ..sort((a, b) => a.position.compareTo(b.position));

    return sortedEntries;
  }

  @override
  Widget build(BuildContext context) {
    final sortedLinks = _sortedLinksBySpanOrder();
    var splitted = <String>[];
    var substringIndex = 0;
    for (int linkIndex = 0; linkIndex < sortedLinks.length; linkIndex++) {
      final positionedLink = sortedLinks[linkIndex];
      splitted.add(text.substring(substringIndex, positionedLink.position));
      substringIndex =
          positionedLink.position + positionedLink.link.text.length;
    }
    splitted.add(text.substring(substringIndex));

    var children = <InlineSpan>[];
    for (int index = 0; index < sortedLinks.length; index++) {
      final link = sortedLinks[index];
      children.addAll([
        TextLinkSpan(
          text: link.link.text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Palette.primary,
                fontWeight: FontWeight.w500,
              ),
          onTap: link.link.callback,
        ),
        TextSpan(
          text: splitted[index + 1],
        ),
      ]);
    }

    return Text.rich(
      TextSpan(
        text: splitted.first,
        style: Theme.of(context).textTheme.bodyMedium,
        children: children,
      ),
    );
  }
}

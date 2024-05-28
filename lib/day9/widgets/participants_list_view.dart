import 'package:flutter/material.dart';

class ParticipantsListView extends StatelessWidget {
  const ParticipantsListView({
    super.key,
    required this.participants,
  });

  final List<String> participants;

  @override
  Widget build(BuildContext context) {
    final count = participants.length;
    List<String> displaying = participants.take(3).toList();
    if (count > 3) {
      displaying.add('+${count - 3}');
    }

    List<Widget> children = displaying
        .map<Widget>(
          (name) => Text(
            name,
            style: TextStyle(
              color: Colors.black.withOpacity(
                name.toLowerCase() == 'me' ? 1 : 0.4,
              ),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        )
        .toList();

    final separatorIndices = List<int>.generate(
      displaying.length - 1,
      (index) => index + 1,
    );
    for (var index in separatorIndices.reversed) {
      children.insert(index, const SizedBox(width: 16));
    }

    return Row(children: children);
  }
}

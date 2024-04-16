import 'package:flutter/material.dart';

class Day9HomeScreen extends StatelessWidget {
  const Day9HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1F1F),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const _AppBar(imagePath: 'assets/images/avatar.png'),
              const SizedBox(height: 32),
              const _DateScrollView(),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    _Card(
                      backgroundColor: const Color(0xFFFEF754),
                      startTime: (hour: 11, minute: 30),
                      endTime: (hour: 12, minute: 20),
                      title: 'design meeting'.toUpperCase(),
                      participants: ['alex', 'helena', 'nana'].toUppercase(),
                    ),
                    const SizedBox(height: 8),
                    _Card(
                      backgroundColor: const Color(0xFF9C6BCE),
                      startTime: (hour: 12, minute: 35),
                      endTime: (hour: 14, minute: 10),
                      title: 'daily project'.toUpperCase(),
                      participants: [
                        'me',
                        'richard',
                        'ciry',
                        'joey',
                        'ross',
                        'chandler'
                      ].toUppercase(),
                    ),
                    const SizedBox(height: 8),
                    _Card(
                      backgroundColor: const Color(0xFFBBEE4B),
                      startTime: (hour: 15, minute: 00),
                      endTime: (hour: 16, minute: 30),
                      title: 'weekly planning'.toUpperCase(),
                      participants: ['den', 'nana', 'mark'].toUppercase(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

extension on List<String> {
  List<String> toUppercase() {
    return map((e) => e.toUpperCase()).toList();
  }
}

typedef Time = ({int hour, int minute});

class _Card extends StatelessWidget {
  final Color backgroundColor;
  final Time startTime;
  final Time endTime;
  final String title;
  final List<String> participants;

  const _Card({
    required this.backgroundColor,
    required this.startTime,
    required this.endTime,
    required this.title,
    required this.participants,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          _dateRangeView,
          const SizedBox(width: 24),
          Flexible(
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 64,
                    height: 1,
                  ),
                  softWrap: true,
                ),
                const SizedBox(height: 32),
                _participantsView
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget get _participantsView {
    final count = participants.length;
    List<String> displaying = participants.take(3).toList();
    if (count > 3) {
      displaying.add('+${count - 3}');
    }

    List<Widget> children = displaying
        .map<Widget>(
          (title) => Text(
            title,
            style: TextStyle(
              color: Colors.black
                  .withOpacity(title.toLowerCase() == 'me' ? 1 : 0.3),
              fontWeight: FontWeight.w700,
            ),
          ),
        )
        .toList();

    final separatorIndices =
        List<int>.generate(displaying.length - 1, (index) => index + 1)
            .reversed;
    for (var index in separatorIndices) {
      children.insert(index, const SizedBox(width: 16));
    }

    return Row(children: children);
  }

  Widget get _dateRangeView {
    return Column(
      children: [
        _dateView(startTime.hour, startTime.minute),
        const SizedBox(height: 4),
        const SizedBox(
          width: 1,
          height: 24,
          child: ColoredBox(
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 4),
        _dateView(endTime.hour, endTime.minute),
      ],
    );
  }

  Widget _dateView(int hour, int minute) {
    return Column(
      children: [
        Text(
          hour.toString(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            height: 1,
          ),
        ),
        Text(
          minute.toString(),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            height: 1,
          ),
        ),
      ],
    );
  }
}

class _DateScrollView extends StatelessWidget {
  const _DateScrollView();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                'MONDAY',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(width: 4),
              Text(
                '16',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 36,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: 17,
            itemBuilder: (context, index) {
              if (index == 0) {
                return const Text(
                  'TODAY',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    height: 1,
                  ),
                );
              }

              if (index == 1) {
                return const Text(
                  '·',
                  style: TextStyle(
                    color: Color(0xFFB22581),
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    height: 1,
                  ),
                );
              }

              return Text(
                '${index + 15}',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 36,
                  height: 1,
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: index < 2 ? 0 : 16);
            },
          ),
        ),
      ],
    );
  }
}

class _AppBar extends StatelessWidget {
  final String imagePath;

  const _AppBar({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            clipBehavior: Clip.hardEdge,
            child: Image.asset(imagePath, width: 60),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Colors.white,
              size: 36,
            ),
          )
        ],
      ),
    );
  }
}

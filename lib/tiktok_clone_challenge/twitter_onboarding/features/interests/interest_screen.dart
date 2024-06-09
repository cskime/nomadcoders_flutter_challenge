import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/constants/palette.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button_size.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button_type.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/interests/interest_detail_screen.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/interests/models/interest.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/interests/widgets/interest_item.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  final _selected = <String>{};
  final _maxSelection = 3;

  void _onSelected(String interest) {
    if (_selected.contains(interest)) {
      _selected.remove(interest);
    } else if (_selected.length < _maxSelection) {
      _selected.add(interest);
    }
    setState(() {});
  }

  void _onNextPressed() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const InterestDetailScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: FaIcon(
                FontAwesomeIcons.twitter,
                color: Palette.primary,
                size: 36,
              ),
              automaticallyImplyLeading: false,
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 32, left: 40, right: 40, bottom: 16),
                    child: Column(
                      children: [
                        Text(
                          'What do you want to see on Twitter?',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Select at least 3 interests to personalize your Twitter experience. They will be viisble on your profile.',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(height: 1.3),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: Colors.grey.shade300),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16).copyWith(top: 32),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: dummyInterests.length,
                  (context, index) {
                    final interest = dummyInterests[index];
                    return InterestItem(
                      interest: interest,
                      selected: _selected.contains(interest),
                      onSelected: _onSelected,
                    );
                  },
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  mainAxisExtent: 80,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.grey.shade300),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${_selected.length} of $_maxSelection selected'),
              Button(
                title: 'Next',
                type: ButtonType.secondary,
                size: ButtonSize.small,
                enabled: _selected.length == _maxSelection,
                onPressed: _onNextPressed,
              )
            ],
          ),
        ),
      ),
    );
  }
}

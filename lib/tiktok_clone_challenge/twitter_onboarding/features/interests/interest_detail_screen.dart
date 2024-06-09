import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/constants/palette.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button_size.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/common/widgets/button/button_type.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/interests/models/interest.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/interests/widgets/interest_detail_item.dart';

class InterestDetailScreen extends StatefulWidget {
  const InterestDetailScreen({super.key});

  @override
  State<InterestDetailScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestDetailScreen> {
  final _selectedMusics = <String>{};
  final _selectedEntertainments = <String>{};

  void _onBackButtonPressed() {
    Navigator.of(context).pop();
  }

  void _onSelected(String interest, Set<String> selected) {
    setState(() {
      if (selected.contains(interest)) {
        selected.remove(interest);
      } else {
        selected.add(interest);
      }
    });
  }

  bool get _nextEnabled =>
      _selectedMusics.length >= 3 && _selectedEntertainments.length >= 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: const FaIcon(
                FontAwesomeIcons.twitter,
                color: Palette.primary,
                size: 36,
              ),
              leading: IconButton(
                icon: const FaIcon(FontAwesomeIcons.arrowLeft),
                onPressed: _onBackButtonPressed,
              ),
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
                          'Interests are used to personalize your experience and will be visible on your profile.',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(height: 1.3),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: Colors.grey.shade300),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          'Music',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      const SizedBox(height: 32),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 500),
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 12,
                            children: dummyMusicInterests
                                .map(
                                  (interest) => InterestDetailItem(
                                    interest: interest,
                                    selected:
                                        _selectedMusics.contains(interest),
                                    onSelected: (interest) => _onSelected(
                                      interest,
                                      _selectedMusics,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                  Divider(color: Colors.grey.shade300),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          'Entertainment',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      const SizedBox(height: 32),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 500),
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 12,
                            children: dummyEntertainmentInterets
                                .map(
                                  (interest) => InterestDetailItem(
                                    interest: interest,
                                    selected: _selectedEntertainments
                                        .contains(interest),
                                    onSelected: (interest) => _onSelected(
                                      interest,
                                      _selectedEntertainments,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ],
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Button(
                title: 'Next',
                type: ButtonType.secondary,
                size: ButtonSize.small,
                enabled: _nextEnabled,
              )
            ],
          ),
        ),
      ),
    );
  }
}

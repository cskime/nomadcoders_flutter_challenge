import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/constants/palette.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    super.key,
    this.largeTitle,
    this.title,
    this.description,
    required this.children,
    this.footer,
    this.bottomNavigationBar,
    this.appBarLeading,
    this.appBarLeadingWidth,
  });

  final String? largeTitle;
  final String? title;
  final String? description;
  final List<Widget> children;
  final Widget? footer;
  final Widget? bottomNavigationBar;
  final Widget? appBarLeading;
  final double? appBarLeadingWidth;

  void _onTap(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context),
      child: Scaffold(
        appBar: AppBar(
          title: const FaIcon(
            FontAwesomeIcons.twitter,
            color: Palette.primary,
            size: 36,
          ),
          surfaceTintColor: Colors.white,
          leadingWidth: appBarLeadingWidth,
          leading: appBarLeading,
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: constraints.copyWith(
                  minHeight: constraints.maxHeight,
                  maxHeight: double.infinity,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (largeTitle != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 24),
                            child: Text(
                              largeTitle!,
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                          ),
                        if (title != null)
                          Padding(
                            padding: EdgeInsets.only(
                              top: largeTitle == null ? 36 : 24,
                              bottom: 24,
                            ),
                            child: Text(
                              title!,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                        if (description != null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 36),
                            child: Text(
                              description!,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ...children,
                        if (footer != null) ...[
                          const Spacer(),
                          footer!,
                          const SizedBox(height: 24),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}

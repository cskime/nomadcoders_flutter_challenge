import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/constants/palette.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    super.key,
    required this.body,
    this.bottomNavigationBar,
    this.appBarLeading,
    this.appBarLeadingWidth,
  });

  final Widget body;
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
                    child: body,
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

import 'dart:ui';

enum ButtonSize {
  large,
  small;

  double get height => switch (this) {
        ButtonSize.large => 56,
        ButtonSize.small => 40,
      };

  double get fontSize => switch (this) {
        ButtonSize.large => 18,
        ButtonSize.small => 16,
      };

  FontWeight get fontWeight => switch (this) {
        ButtonSize.large => FontWeight.w800,
        ButtonSize.small => FontWeight.w700,
      };
}

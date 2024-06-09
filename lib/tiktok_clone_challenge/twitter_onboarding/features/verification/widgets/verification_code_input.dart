import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/twitter_onboarding/features/verification/widgets/verification_code_digit.dart';

class VerificationCodeInput extends StatefulWidget {
  const VerificationCodeInput({
    super.key,
    required this.onCodeChanged,
  });

  final void Function(bool isFilled) onCodeChanged;

  @override
  State<VerificationCodeInput> createState() => _VerificationCodeInputState();
}

class _VerificationCodeInputState extends State<VerificationCodeInput> {
  final _editingController = TextEditingController();
  final _focusNode = FocusNode();
  final _spacing = 24.0;

  var _currentPosition = 0;
  var _stringNumbers = List.generate(6, (index) => ' ');

  @override
  void dispose() {
    _editingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onTap() {
    FocusScope.of(context).requestFocus(_focusNode);
  }

  void _onEditingChange(String value) {
    setState(() {
      _currentPosition = value.length;
      _stringNumbers = value.padRight(6).characters.toList();
      widget.onCodeChanged(_currentPosition == 6);
    });
  }

  @override
  Widget build(BuildContext context) {
    final digits = _stringNumbers.indexed
        .map(
          (element) => Expanded(
            child: VerificationCodeDigit(
              number: int.tryParse(element.$2) ?? -1,
              active: element.$1 == _currentPosition,
            ),
          ),
        )
        .toList();

    var children = <Widget>[digits.first];
    for (int index = 1; index < 6; index++) {
      children.addAll([SizedBox(width: _spacing), digits[index]]);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: _onTap,
          child: Stack(
            children: [
              Positioned.fill(
                child: Opacity(
                  opacity: 0,
                  child: TextField(
                    controller: _editingController,
                    focusNode: _focusNode,
                    keyboardType: TextInputType.number,
                    onChanged: _onEditingChange,
                    maxLength: 6,
                  ),
                ),
              ),
              Row(children: children),
            ],
          ),
        ),
      ],
    );
  }
}

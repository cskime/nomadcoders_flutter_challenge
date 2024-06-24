import 'package:flutter/material.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/theme.dart';

class WritePostTextField extends StatelessWidget {
  const WritePostTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ThreadTheme.isDarkTheme(context);
    return TextField(
      controller: controller,
      style: TextStyle(
        color: isDarkMode ? Colors.white : Colors.black,
      ),
      keyboardType: TextInputType.multiline,
      autocorrect: false,
      minLines: 1,
      maxLines: null,
      autofocus: true,
      decoration: const InputDecoration(
        hintText: "Start a thread...",
        // hintStyle: TextStyle(
        //   fontWeight: FontWeight.normal,
        // ),
        isDense: true,
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
      cursorColor: Colors.blue.shade700,
      cursorWidth: 2,
    );
  }
}

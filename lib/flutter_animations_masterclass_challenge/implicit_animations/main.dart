import 'package:flutter/material.dart';

void main() => runApp(const ImplicitAnimationsApp());

class ImplicitAnimationsApp extends StatefulWidget {
  const ImplicitAnimationsApp({super.key});

  @override
  State<ImplicitAnimationsApp> createState() => _ImplicitAnimationsAppState();
}

class _ImplicitAnimationsAppState extends State<ImplicitAnimationsApp> {
  var isForward = true;

  void _onAnimationEnd() {
    setState(() {
      isForward = !isForward;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text("Implicit Animations"),
        ),
        body: Center(
          child: Container(
            width: screenSize.width,
            height: screenSize.width,
            color: isForward ? const Color(0xFF222222) : Colors.white,
            child: Center(
              child: Container(
                width: screenSize.width / 2,
                height: screenSize.width / 2,
                decoration: BoxDecoration(
                  color: const Color(0xFFE14C45),
                  shape: isForward ? BoxShape.rectangle : BoxShape.circle,
                ),
                child: AnimatedAlign(
                  alignment:
                      isForward ? Alignment.centerRight : Alignment.centerLeft,
                  duration: const Duration(seconds: 1),
                  onEnd: _onAnimationEnd,
                  child: Container(
                    width: 12,
                    color: isForward ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

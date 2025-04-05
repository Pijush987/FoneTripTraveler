import 'package:flutter/material.dart';

class InterNetExceptionWidget extends StatelessWidget {
  final VoidCallback onPress;

  const InterNetExceptionWidget({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
        ),
      ),
    );
  }
}

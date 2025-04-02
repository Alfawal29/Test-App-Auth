import 'package:flutter/material.dart';

class AlmostGoogleButton extends StatelessWidget {
  const AlmostGoogleButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black54,
          padding: EdgeInsets.symmetric(
            horizontal: 32,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          elevation: 2),
      child: child,
    );
  }
}
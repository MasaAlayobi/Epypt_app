import 'package:flutter/material.dart';

class ElevatedBottonData extends StatelessWidget {
  const ElevatedBottonData({
    super.key,
    this.backgroundColor,
    required this.data,
    this.onLongPress,
  });

  final Color? backgroundColor;
  final String data;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    // Get the size of the screen
    final Size screenSize = MediaQuery.of(context).size;

    // Calculate padding dynamically based on screen width
    final double horizontalPadding = screenSize.width * 0.1;
    final double verticalPadding =
        screenSize.height * 0.01; // 10% of screen width

    // Adjust button size based on screen size
    final Size buttonSize = screenSize.width >
            600 // Arbitrary breakpoint for tablet size
        ? const Size(200, 50) // Larger button for tablets and larger screens
        : const Size(150, 35); // Default size for phones

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: verticalPadding),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          minimumSize: buttonSize,
        ),
        onPressed: onLongPress,
        child: Text(
          data,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showTopSnackBar(BuildContext context, String message) {
  final overlay = Overlay.of(context);
  OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).padding.top,
      left: 0,
      right: 0,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          color: Colors.blue, // Change the color as needed
          child: Center(
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);

  // Hide the SnackBar after 3 seconds
  Future.delayed(Duration(seconds: 3), () {
    overlayEntry.remove();
  });
}

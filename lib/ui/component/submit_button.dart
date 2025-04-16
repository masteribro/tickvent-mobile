import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.label,
    this.onTap,
    this.isLoading = false,
  });

  final String label;
  final Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap, // disable tap when loading
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isLoading
              ? const Color(0xFF6941C6).withOpacity(0.3)
              : const Color(0xFF6941C6),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Center(
          child: isLoading
              ? const CupertinoActivityIndicator(color: Colors.white)
              : Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
        ),
      ),
    );
  }
}

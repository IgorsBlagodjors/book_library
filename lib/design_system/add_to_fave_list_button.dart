import 'package:flutter/material.dart';
import 'app_colors.dart';

class AddToFaveListButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddToFaveListButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.basePrimary,
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(
        icon: const Icon(
          Icons.favorite,
          color: AppColors.baseOnPrimary,
        ),
        onPressed: onPressed,
      ),
    );
  }
}

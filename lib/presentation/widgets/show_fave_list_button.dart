import 'package:flutter/material.dart';
import '../../design_system/app_colors.dart';

class ShowFaveListButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ShowFaveListButton({super.key, required this.onPressed});

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
          Icons.list,
          color: AppColors.baseOnPrimary,
        ),
        onPressed: onPressed,
      ),
    );
  }
}

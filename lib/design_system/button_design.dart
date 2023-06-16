import 'package:book_library/design_system/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required Set<void> Function() onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.basePrimary,
        borderRadius: BorderRadius.circular(50),
      ),
      child: const Center(
        child: Icon(
          Icons.favorite,
          color: AppColors.baseOnPrimary,
        ),
      ),
    );
  }
}

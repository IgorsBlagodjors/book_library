import 'package:book_library/design_system/app_colors.dart';
import 'package:book_library/design_system/app_typography.dart';
import 'package:flutter/material.dart';

class BookDetailsCardView extends StatefulWidget {
  final String title;
  final String value;

  const BookDetailsCardView(
      {super.key, required this.title, required this.value});

  @override
  State<BookDetailsCardView> createState() => _BookDetailsCardViewState();
}

class _BookDetailsCardViewState extends State<BookDetailsCardView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.light,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: AppColors.basePrimary,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        height: 54,
        width: 101,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Center(
              child: Text(
                widget.title,
                style: AppTypography.subtitle2Regular
                    .copyWith(color: AppColors.baseOnPrimaryLight),
              ),
            ),
            const SizedBox(height: 4),
            Center(
              child: Text(
                widget.value,
                style: AppTypography.body1SemiBold
                    .copyWith(color: AppColors.basePrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

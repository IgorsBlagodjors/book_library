import 'package:book_library/design_system/app_colors.dart';
import 'package:book_library/design_system/app_typography.dart';
import 'package:flutter/material.dart';

class BookDetailsNumberItem extends StatefulWidget {
  final String title;
  final String value;

  const BookDetailsNumberItem(
      {super.key, required this.title, required this.value});

  @override
  State<BookDetailsNumberItem> createState() => _BookDetailsNumberItemState();
}

class _BookDetailsNumberItemState extends State<BookDetailsNumberItem> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Card(
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
      ),
    );
  }
}

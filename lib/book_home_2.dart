import 'package:book_library/design_system/app_colors.dart';
import 'package:book_library/design_system/app_icons.dart';
import 'package:book_library/design_system/app_typography.dart';
import 'package:flutter/material.dart';

class BookHome2 extends StatelessWidget {
  const BookHome2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 44),
            Row(
              children: [
                const Icon(AppIcons.back, size: 24),
                const SizedBox(width: 87),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Book Details',
                      style: AppTypography.headline2Bold.copyWith(
                        color: AppColors.onPrimaryLight,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 17),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/second_scren.jpg',
                height: 184,
                width: 328,
              ),
            ),
            const SizedBox(height: 28),
            Text(
              'The City of Mist',
              style: AppTypography.headline1Bold.copyWith(
                color: AppColors.onPrimaryLight,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Stories',
              style: AppTypography.subtitle1Bold.copyWith(
                color: AppColors.onPrimaryLight,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Carlos Ruiz Zafon',
              style: AppTypography.body2Regular.copyWith(
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Card(
                  color: AppColors.light,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: AppColors.primary,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    height: 54,
                    width: 101,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 0),
                      child: Text(
                        'Released',
                        style: AppTypography.subtitle2Regular
                            .copyWith(color: AppColors.onPrimaryLight),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 4),
                Card(
                  color: AppColors.light,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: AppColors.primary,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    height: 54,
                    width: 101,
                  ),
                ),
                const SizedBox(width: 4),
                Card(
                  color: AppColors.light,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: AppColors.primary,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    height: 54,
                    width: 101,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text('Description',
                style: AppTypography.headline2Bold
                    .copyWith(color: AppColors.onPrimaryLight)),
          ],
        ),
      ),
    );
  }
}

import 'package:book_library/design_system/app_colors.dart';
import 'package:book_library/design_system/app_icons.dart';
import 'package:book_library/design_system/app_typography.dart';
import 'package:book_library/design_system/items.dart';
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
                AppIcons.back,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Released',
                            style: AppTypography.subtitle2Regular
                                .copyWith(color: AppColors.onPrimaryLight),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 13.0,
                              top: 4,
                            ),
                            child: Text(
                              '2021',
                              style: AppTypography.body1SemiBold
                                  .copyWith(color: AppColors.primary),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(31.0, 8.0, 31.0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pages',
                            style: AppTypography.subtitle2Regular
                                .copyWith(color: AppColors.onPrimaryLight),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 7.0,
                              top: 4,
                            ),
                            child: Text(
                              '176',
                              style: AppTypography.body1SemiBold
                                  .copyWith(color: AppColors.primary),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(28.0, 8.0, 28.0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rating',
                            style: AppTypography.subtitle2Regular
                                .copyWith(color: AppColors.onPrimaryLight),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 17.5,
                              top: 4,
                            ),
                            child: Text(
                              '4',
                              style: AppTypography.body1SemiBold
                                  .copyWith(color: AppColors.primary),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text('Description',
                style: AppTypography.headline2Bold
                    .copyWith(color: AppColors.onPrimaryLight)),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  Text(
                      thisText[0],
                      style: AppTypography.body2Regular
                          .copyWith(color: AppColors.onPrimaryLight)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

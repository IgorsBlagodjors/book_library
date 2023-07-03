import 'package:book_library/design_system/app_colors.dart';
import 'package:book_library/design_system/app_icons.dart';
import 'package:book_library/design_system/app_typography.dart';
import 'package:book_library/design_system/book_item_class.dart';
import 'package:book_library/design_system/add_to_fave_list_button.dart';
import 'package:flutter/material.dart';

class BookDetailsPage extends StatefulWidget {
  final BookItem selectedItems;

  const BookDetailsPage({super.key, required this.selectedItems});

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
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
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: AppIcons.back),
                const SizedBox(width: 87),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Book Details',
                      style: AppTypography.headline2Bold.copyWith(
                        color: AppColors.baseOnPrimaryLight,
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
                widget.selectedItems.smallThumbnail,
                height: 184,
                width: 328,
              ),
            ),
            const SizedBox(height: 28),
            Text(
              widget.selectedItems.title,
              style: AppTypography.headline1Bold.copyWith(
                color: AppColors.baseOnPrimaryLight,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Stories',
              style: AppTypography.subtitle1Bold.copyWith(
                color: AppColors.baseOnPrimaryLight,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.selectedItems.authors,
              style: AppTypography.body2Regular.copyWith(
                color: AppColors.basePrimary,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Card(
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
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        top: 8.0,
                        right: 20.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Released',
                            style: AppTypography.subtitle2Regular
                                .copyWith(color: AppColors.baseOnPrimaryLight),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 13.0,
                              top: 4,
                            ),
                            child: Text(
                              widget.selectedItems.publishedDate,
                              style: AppTypography.body1SemiBold
                                  .copyWith(color: AppColors.basePrimary),
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
                      color: AppColors.basePrimary,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SizedBox(
                    height: 54,
                    width: 101,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 31.0,
                        top: 8.0,
                        right: 31.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pages',
                            style: AppTypography.subtitle2Regular
                                .copyWith(color: AppColors.baseOnPrimaryLight),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 7.0,
                              top: 4,
                            ),
                            child: Text(
                              widget.selectedItems.pageCount.toString(),
                              style: AppTypography.body1SemiBold
                                  .copyWith(color: AppColors.basePrimary),
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
                      color: AppColors.basePrimary,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SizedBox(
                    height: 54,
                    width: 101,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 28.0,
                        top: 8.0,
                        right: 28.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rating',
                            style: AppTypography.subtitle2Regular
                                .copyWith(color: AppColors.baseOnPrimaryLight),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 17.5,
                              top: 4,
                            ),
                            child: Text(
                              widget.selectedItems.ratingsCount.toString(),
                              style: AppTypography.body1SemiBold
                                  .copyWith(color: AppColors.basePrimary),
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
                    .copyWith(color: AppColors.baseOnPrimaryLight)),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  Text(
                    widget.selectedItems.description,
                    style: AppTypography.body2Regular
                        .copyWith(color: AppColors.baseOnPrimaryLight),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: AddToFaveListButton(
                  onPressed: () => {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

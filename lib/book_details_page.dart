import 'package:book_library/book_details_number_item.dart';
import 'package:book_library/design_system/app_colors.dart';
import 'package:book_library/design_system/app_icons.dart';
import 'package:book_library/design_system/app_typography.dart';
import 'package:book_library/design_system/book_info.dart';
import 'package:book_library/design_system/button_design.dart';
import 'package:flutter/material.dart';

class BookDetailsPage extends StatefulWidget {
  final BookInfo selectedItems;

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
                widget.selectedItems.assetImage,
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
              widget.selectedItems.author,
              style: AppTypography.body2Regular.copyWith(
                color: AppColors.basePrimary,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                BookDetailsNumberItem(
                  title: 'Released',
                  value: widget.selectedItems.releasedDate,
                ),
                const SizedBox(width: 4),
                BookDetailsNumberItem(
                  title: 'Pages',
                  value: widget.selectedItems.numberOfPage,
                ),
                const SizedBox(width: 4),
                BookDetailsNumberItem(
                  title: 'Rating',
                  value: widget.selectedItems.averageRating.toString(),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Description',
              style: AppTypography.headline2Bold
                  .copyWith(color: AppColors.baseOnPrimaryLight),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  Text(widget.selectedItems.description,
                      style: AppTypography.body2Regular
                          .copyWith(color: AppColors.baseOnPrimaryLight)),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: CustomButton(
                  onPressed: () => {
                    // Output message to the console
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

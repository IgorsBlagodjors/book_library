import 'package:book_library/design_system/app_colors.dart';
import 'package:book_library/design_system/app_icons.dart';
import 'package:book_library/design_system/app_typography.dart';
import 'package:book_library/design_system/book_info.dart';
import 'package:flutter/material.dart';

class BLBookListItem extends StatelessWidget {
  final BookInfo items;

  const BLBookListItem({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              items.imageUrl,
              height: 84,
              width: 77,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  items.title,
                  style: AppTypography.subtitle1Bold.copyWith(
                    color: AppColors.baseOnPrimaryLight,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  items.description,
                  style: AppTypography.caption2Regular.copyWith(
                    color: AppColors.baseOnPrimaryLight,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 17,
                ),
                Row(
                  children: [
                    Row(
                      children: List.generate(5, (index) {
                        if (index < items.rating) {
                          return AppIcons.star;
                        } else {
                          return AppIcons.starBorder;
                        }
                      }),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      items.grade,
                      style: const TextStyle(
                        color: AppColors.basePrimary,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

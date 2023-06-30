import 'package:book_library/book_home_2.dart';
import 'package:book_library/design_system/app_colors.dart';
import 'package:book_library/design_system/app_icons.dart';
import 'package:book_library/design_system/app_typography.dart';
import 'package:book_library/design_system/book_item_class.dart';
import 'package:flutter/material.dart';

class BLBookListItem extends StatelessWidget {
  final BookItem items;

  const BLBookListItem({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookHome2(
                passedId: items.id,
              ),
            ),
          );
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                items.smallThumbnail,
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
                    items.authors,
                    style: AppTypography.caption2Regular.copyWith(
                      color: AppColors.baseOnPrimaryLight,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 17.3,
                  ),
                  Row(
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          if (index < items.averageRating.floor()) {
                            return AppIcons.star;
                          } else {
                            return AppIcons.starBorder;
                          }
                        }),
                      ),
                      const SizedBox(width: 2.67),
                      Text(
                        '(${items.ratingsCount})',
                        style: const TextStyle(
                          color: AppColors.basePrimary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

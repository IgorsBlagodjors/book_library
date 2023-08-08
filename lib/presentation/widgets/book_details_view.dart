import 'package:book_library/domain/items/bookHomePageModel/book_class.dart';
import 'package:book_library/presentation/bookApp/book_app_details_page.dart';
import 'package:book_library/design_system/app_colors.dart';
import 'package:book_library/design_system/app_icons.dart';
import 'package:book_library/design_system/app_typography.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  final BookClass items;

  const BookDetailsView({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          _createRoute(),
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
                  height: 17,
                ),
                Row(
                  children: [
                    Row(
                      children: List.generate(
                        5,
                        (index) {
                          if (index < items.averageRating.floor()) {
                            return AppIcons.star;
                          } else {
                            return AppIcons.starBorder;
                          }
                        },
                      ),
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
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          BookAppDetailsPage(
        passedId: items.id,
      ).withCubit(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
            .chain(CurveTween(curve: Curves.easeInOut));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}

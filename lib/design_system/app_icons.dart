import 'package:book_library/design_system/app_colors.dart';
import 'package:flutter/material.dart';

class AppIcons {
  static const favorite = Icon(Icons.favorite, size: 24);
  static const search = Icon(Icons.search, size: 24);
  static const back = Icon(Icons.arrow_back, size: 24);
  static const starBorder = Icon(
    Icons.star_outline,
    size: 16,
    color: AppColors.basePrimary,
  );
  static const star = Icon(
    Icons.star,
    size: 16,
    color: AppColors.basePrimary,
  );
}

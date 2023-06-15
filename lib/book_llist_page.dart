import 'package:book_library/design_system/app_colors.dart';
import 'package:book_library/design_system/app_icons.dart';
import 'package:book_library/design_system/app_typography.dart';
import 'package:book_library/design_system/book_list_item.dart';
import 'package:book_library/design_system/items.dart';
import 'package:flutter/material.dart';

class BookListPage extends StatelessWidget {
  const BookListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 32),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Start book search...',
                  hintStyle: const TextStyle(
                    color: AppColors.onPrimaryLight,
                    //fontStyle: AppTypography.subtitle2Regular,
                  ),
                  contentPadding:
                      const EdgeInsets.fromLTRB(48.0, 19.5, 147.0, 19.5),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.fromLTRB(15.0, 18.97, 0.0, 19.03),
                    child: Icon(
                      AppIcons.search,
                      size: 24,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.onBackgroundLight),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Books Search',
                    style: AppTypography.headline1Bold.copyWith(
                      color: AppColors.onPrimaryLight,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return BLBookListItem(items: item);
                  },
                  itemCount: items.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 16,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

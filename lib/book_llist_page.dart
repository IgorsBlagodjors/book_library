import 'package:book_library/design_system/app_colors.dart';
import 'package:book_library/design_system/app_typography.dart';
import 'package:book_library/design_system/book_list_item.dart';
import 'package:flutter/cupertino.dart';
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
              TextFormField(),
              Text(
                'Books Search',
                style: AppTypography.headline1Bold.copyWith(
                  color: AppColors.onPrimaryLight,
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return BLBookListItem();
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
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

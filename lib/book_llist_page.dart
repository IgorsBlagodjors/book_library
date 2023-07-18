import 'package:book_library/design_system/app_colors.dart';
import 'package:book_library/design_system/app_icons.dart';
import 'package:book_library/design_system/app_typography.dart';
import 'package:book_library/design_system/book_info.dart';
import 'package:book_library/design_system/book_list_item.dart';
import 'package:book_library/design_system/books_repository.dart';
import 'package:book_library/design_system/button_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({Key? key}) : super(key: key);

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  late final BooksRepository _booksRepository;
  Future<List<BookInfo>>? _booksFuture;

  @override
  void initState() {
    super.initState();
    _booksRepository = context.read();
    _booksFuture = _booksRepository.getBooks();
  }

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
                onFieldSubmitted: (query) {
                  setState(() {
                    _booksFuture = _booksRepository.search(query);
                  });
                },

                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  hintText: 'Start book search...',
                  hintStyle: const TextStyle(
                    color: AppColors.baseOnPrimaryLight,
                    //fontStyle: AppTypography.subtitle2Regular,
                  ),
                  contentPadding: const EdgeInsets.only(
                    left: 48.0,
                    top: 19.5,
                    right: 147.0,
                    bottom: 19.5,
                  ),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(
                      left: 15.0,
                      top: 18.97,
                      right: 0.0,
                      bottom: 19.03,
                    ),
                    child: AppIcons.search,
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
                      color: AppColors.baseOnPrimaryLight,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder<List<BookInfo>>(
                  future: _booksFuture,
                  builder: (context, snapshot) {
                    final books = snapshot.data ?? [];
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        final item = books[index];
                        return BLBookListItem(items: item);
                      },
                      itemCount: books.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 16,
                        );
                      },
                    );
                  },
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
      ),
    );
  }
}

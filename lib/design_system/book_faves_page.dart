import 'package:book_library/design_system/app_colors.dart';
import 'package:book_library/design_system/app_icons.dart';
import 'package:book_library/design_system/app_typography.dart';
import 'package:book_library/design_system/book_repository.dart';
import 'package:book_library/design_system/fave_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookFavesPage extends StatefulWidget {
  const BookFavesPage({super.key});

  @override
  State<BookFavesPage> createState() => _BookFavesPageState();
}

class _BookFavesPageState extends State<BookFavesPage> {
  late final BookRepository _bookRepository;
  late Future<List<FaveBookItem>> _bookFuture;

  @override
  void initState() {
    super.initState();
    _bookRepository = context.read();
    _bookFuture = _bookRepository.getFaveItems();
  }

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
                      Navigator.of(context).pop();
                    },
                    child: AppIcons.back),
                Expanded(
                  child: Center(
                    child: Text(
                      'Wish List',
                      style: AppTypography.headline2Bold.copyWith(
                        color: AppColors.baseOnPrimaryLight,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder<List<FaveBookItem>>(
                future: _bookFuture,
                builder: (context, snapshot) {
                  final books = snapshot.data ?? [];
                  return ListView.builder(
                    itemBuilder: (_, index) => GestureDetector(
                      onTap: () {
                        _removeFromFaves(books[index].faveId);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                books[index].imageUrl,
                                height: 184,
                                width: 328,
                              ),
                            ),
                          ),
                          const SizedBox(height: 28),
                          Text(
                            books[index].name,
                            style: AppTypography.headline1Bold.copyWith(
                                color: AppColors.baseOnPrimaryLight,
                                overflow: TextOverflow.ellipsis),
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
                            books[index].authors,
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
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 8),
                                      Center(
                                        child: Text(
                                          'Released',
                                          style: AppTypography.subtitle2Regular
                                              .copyWith(
                                                  color: AppColors
                                                      .baseOnPrimaryLight),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Center(
                                        child: Text(
                                          books[index].date.substring(0, 4),
                                          style: AppTypography.body1SemiBold
                                              .copyWith(
                                                  color: AppColors.basePrimary),
                                        ),
                                      ),
                                    ],
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
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 8),
                                      Center(
                                        child: Text(
                                          'Pages',
                                          style: AppTypography.subtitle2Regular
                                              .copyWith(
                                                  color: AppColors
                                                      .baseOnPrimaryLight),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Center(
                                        child: Text(
                                          books[index].pages.toString(),
                                          style: AppTypography.body1SemiBold
                                              .copyWith(
                                                  color: AppColors.basePrimary),
                                        ),
                                      ),
                                    ],
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Rating',
                                          style: AppTypography.subtitle2Regular
                                              .copyWith(
                                                  color: AppColors
                                                      .baseOnPrimaryLight),
                                        ),
                                        const SizedBox(height: 4),
                                        Center(
                                          child: Text(
                                            books[index]
                                                .rating
                                                .toInt()
                                                .toString(),
                                            style: AppTypography.body1SemiBold
                                                .copyWith(
                                                    color:
                                                        AppColors.basePrimary),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                    itemCount: books.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _removeFromFaves(String faveId) async {
    await _bookRepository.removeFromFaves(faveId);
    setState(() {
      _bookFuture = _bookRepository.getFaveItems();
    });
  }
}

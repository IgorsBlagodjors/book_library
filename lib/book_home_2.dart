import 'package:book_library/design_system/app_colors.dart';
import 'package:book_library/design_system/app_icons.dart';
import 'package:book_library/design_system/app_typography.dart';
import 'package:book_library/design_system/book_info.dart';
import 'package:book_library/design_system/books_repository.dart';
import 'package:book_library/design_system/button_design.dart';
import 'package:book_library/design_system/in_memory_books_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookHome2 extends StatefulWidget {
  const BookHome2({super.key});

  @override
  State<BookHome2> createState() => _BookHome2State();
}

class _BookHome2State extends State<BookHome2> {
  late final BooksRepository booksRepository;
  Future<List<BookInfo>>? booksFuture;
  @override
  void initState() {
    booksRepository = context.read();
    booksFuture = booksRepository.getBooks();
    super.initState();
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
                AppIcons.back,
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
                'assets/images/second_scren.jpg',
                height: 184,
                width: 328,
              ),
            ),
            const SizedBox(height: 28),
            Text(
              'The City of Mist',
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
              'Carlos Ruiz Zafon',
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
                              '2021',
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
                              '176',
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
                              '4',
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
                      "Ruiz Zafón’s visionary storytelling prowess is a genre unto itself.”—USA Today Return to the mythical Barcelona library known as the Cemetery of Forgotten Books in this posthumous collection of stories from the New York Times bestselling author of The Shadow of the Wind and The Labyrinth of the Spirits. Bestselling author Carlos Ruiz Zafón conceived of this collection of stories as an appreciation to the countless readers who joined him on the extraordinary journey that began with The Shadow of the Wind. Comprising eleven stories, most of them never before published in English, The City of Mist offers the reader compelling characters, unique situations, and a gothic atmosphere reminiscent of his beloved Cemetery of Forgotten Books quartet. The stories are mysterious, imbued with a sense of menace, and told with the warmth, wit, and humor of Zafón's inimitable voice. A boy decides to become a writer when he discovers that his creative gifts capture the attentions of an aloof young beauty who has stolen his heart. A labyrinth maker flees Constantinople to a plague-ridden Barcelona, with plans for building a library impervious to the destruction of time. A strange gentleman tempts Cervantes to write a book like no other, each page of which could prolong the life of the woman he loves. And a brilliant Catalan architect named Antoni Gaudí reluctantly agrees to cross the ocean to New York, a voyage that will determine the fate of an unfinished masterpiece. Imaginative and beguiling, these and other stories in The City of Mist summon up the mesmerizing magic of their brilliant creator and invite us to come dream along with him",
                      style: AppTypography.body2Regular
                          .copyWith(color: AppColors.baseOnPrimaryLight)),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Text(InMemoryBooksRepository.textSecondPageLW,
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

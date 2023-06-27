import 'package:book_library/design_system/book_character.dart';
import 'package:book_library/design_system/book_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksListPage extends StatefulWidget {
  final String passedId = 'DAAAAAAACAAJ';
  const BooksListPage({super.key});

  @override
  State<BooksListPage> createState() => _BooksListPageState();
}

class _BooksListPageState extends State<BooksListPage> {
  late final BookRepository _bookRepository;
  late Future<BookCharacter> _bookFuture;

  @override
  void initState() {
    super.initState();
    _bookRepository = context.read();
    _bookFuture = _bookRepository.getOneCharacterInfo(widget.passedId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<BookCharacter>(
        future: _bookFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final data = snapshot.data ;
          return Column(
            children: [
              Text(data!.description),
              Text(data.title),
              Text(data.publishedDate),
              Text(data.id),

            ],
          );
        },
      ),
    );
  }
}

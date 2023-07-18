import 'package:book_library/design_system/book_info.dart';
import 'package:book_library/design_system/books_repository.dart';

class InMemoryBooksRepository implements BooksRepository {
  @override
  Future<List<BookInfo>> getBooks() async {
    return _books;
  }

  @override
  Future<List<BookInfo>> search(String query) async {
    return _books.where((element) => element.title.contains(query)).toList();
  }

  final List<BookInfo> _books = const [
    BookInfo(
        title: 'Marina',
        author: 'Carlos Ruiz Zafon',
        assetImage: 'assets/images/painting1.jpg',
        grade: '(49)',
        description:
            'Quince años mas tarde, la memoria de aquel dia ha vuelto a mi. He visto a aquel muchacho vagando entre las brumas de la estacion de Francia y el nombre de Marina se ha encendido de nuevo como una herida fresca. Todos tenemos un secreto encerrado bajo llave en el atico del alma. este es el mio.',
        releasedDate: '2014',
        numberOfPage: '336',
        averageRating: '4.4',
        rating: 0),
    BookInfo(
      title: 'The City of Mist',
      author: 'Carlos Ruiz Zafon',
      assetImage: 'assets/images/painting2.jpg',
      grade: '(2)',
      description:
          "Ruiz Zafón’s visionary storytelling prowess is a genre unto itself.”—USA Today Return to the mythical Barcelona library known as the Cemetery of Forgotten Books in this posthumous collection of stories from the New York Times bestselling author of The Shadow of the Wind and The Labyrinth of the Spirits. Bestselling author Carlos Ruiz Zafón conceived of this collection of stories as an appreciation to the countless readers who joined him on the extraordinary journey that began with The Shadow of the Wind. Comprising eleven stories, most of them never before published in English, The City of Mist offers the reader compelling characters, unique situations, and a gothic atmosphere reminiscent of his beloved Cemetery of Forgotten Books quartet. The stories are mysterious, imbued with a sense of menace, and told with the warmth, wit, and humor of Zafón's inimitable voice. A boy decides to become a writer when he discovers that his creative gifts capture the attentions of an aloof young beauty who has stolen his heart. A labyrinth maker flees Constantinople to a plague-ridden Barcelona, with plans for building a library impervious to the destruction of time. A strange gentleman tempts Cervantes to write a book like no other, each page of which could prolong the life of the woman he loves. And a brilliant Catalan architect named Antoni Gaudí reluctantly agrees to cross the ocean to New York, a voyage that will determine the fate of an unfinished masterpiece. Imaginative and beguiling, these and other stories in The City of Mist summon up the mesmerizing magic of their brilliant creator and invite us to come dream along with him",
      releasedDate: '2021',
      numberOfPage: '176',
      averageRating: '4.5',
      rating: 4,
    ),
    BookInfo(
      title: 'God versus Gods',
      author: 'Carlos Ruiz Zafon',
      assetImage: 'assets/images/painting3.jpg',
      grade: '(6)',
      description:
          'The story is enchanting, artistic. and very much a literary fiction with the pulse of a thriller. It’s been a long while since I’ve read a book which is literary fiction at the heart but is penned so full of suspense that is required to fuel a thriller. I won’t say I liked the protagonist at the end of the story. I disliked him to a great extent; David Martin is not someone I could like a lot. I admire his persistence to write despite  all the odds against him. I admire his resilience when his lover Christine marries his best friend Vidal; when his book fails while a book he has written for Vidal succeeds; when he realizes that Christina has always used him, and so on.',
      releasedDate: '2021',
      numberOfPage: '176',
      averageRating: '4.5',
      rating: 5,
    ),
    BookInfo(
      title: 'Marina',
      author: 'Carlos Ruiz Zafon',
      assetImage: 'assets/images/painting4.jpg',
      grade: '(0)',
      description:
          'Quince años mas tarde, la memoria de aquel dia ha vuelto a mi. He visto a aquel muchacho vagando entre las brumas de la estacion de Francia y el nombre de Marina se ha encendido de nuevo como una herida fresca. Todos tenemos un secreto encerrado bajo llave en el atico del alma. este es el mio.',
      releasedDate: '2014',
      numberOfPage: '336',
      averageRating: '4.4',
      rating: 0,
    ),
    BookInfo(
      title: 'Quicklet on Carlos Ruiz Zafon’s',
      author: 'Luke Trayser',
      assetImage: 'assets/images/painting5.jpg',
      grade: '(0)',
      description:
          "ABOUT THE BOOKIf you'll allow me an immediate personal tangent, I feel obligated to tell you my favorite book of all time is 100 Years of Solitude by Gabriel Garcia Marquez. I read it in high school and came away shocked at how deeply I connected with a genre as fantastical as magical realism. Reading The Shadow of the Wind conjured memories of my first experience with 100 Years of Solitude. Both stories span generations and have a dizzying amount of characters, most of whom never meet, but all of whom are mysteriously connected by a powerful force.",
      releasedDate: '2011',
      numberOfPage: '43',
      averageRating: '5',
      rating: 0,
    ),
    BookInfo(
      title: 'The Barcelona of Carlos Ruizza...',
      author: 'Carlos Ruiz Zafon',
      assetImage: 'assets/images/painting7.jpg',
      grade: '(49)',
      description:
          'Con la colaboración del propio Carlos Ruiz Zafón y del periodista Sergio Vila-Sanjuán, Sergi Dòria nos muestra los escenarios barceloneses de las novelas en un emocionante recorrido entre la ciudad real y la de la ficción, entre la actualidad y la época de la peripecia novelesca.',
      releasedDate: '2008',
      numberOfPage: '250',
      averageRating: '5',
      rating: 4,
    ),
  ];
  static const textSecondPageLW =
      "Ruiz Zafón’s visionary storytelling prowess is a genre unto itself.”—USA Today Return to the mythical Barcelona library known as the Cemetery of Forgotten Books in this posthumous collection of stories from the New York Times bestselling author of The Shadow of the Wind and The Labyrinth of the Spirits. Bestselling author Carlos Ruiz Zafón conceived of this collection of stories as an appreciation to the countless readers who joined him on the extraordinary journey that began with The Shadow of the Wind. Comprising eleven stories, most of them never before published in English, The City of Mist offers the reader compelling characters, unique situations, and a gothic atmosphere reminiscent of his beloved Cemetery of Forgotten Books quartet. The stories are mysterious, imbued with a sense of menace, and told with the warmth, wit, and humor of Zafón's inimitable voice. A boy decides to become a writer when he discovers that his creative gifts capture the attentions of an aloof young beauty who has stolen his heart. A labyrinth maker flees Constantinople to a plague-ridden Barcelona, with plans for building a library impervious to the destruction of time. A strange gentleman tempts Cervantes to write a book like no other, each page of which could prolong the life of the woman he loves. And a brilliant Catalan architect named Antoni Gaudí reluctantly agrees to cross the ocean to New York, a voyage that will determine the fate of an unfinished masterpiece. Imaginative and beguiling, these and other stories in The City of Mist summon up the mesmerizing magic of their brilliant creator and invite us to come dream along with him";
}

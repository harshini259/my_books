import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'books_event.dart';
part 'books_state.dart';

final List<Book> books = [
    Book(
      title: '1984',
      author: 'George Orwell',
      description: 'A dystopian novel set in a totalitarian regime that uses surveillance and mind control.',
      imageUrl: 'https://example.com/1984.jpg',
    ),
    Book(
      title: 'To Kill a Mockingbird',
      author: 'Harper Lee',
      description: 'A novel about racial injustice in the Deep South, seen through the eyes of a young girl.',
      imageUrl: 'https://example.com/tokillamockingbird.jpg',
    ),
    Book(
      title: 'The Great Gatsby',
      author: 'F. Scott Fitzgerald',
      description: 'A tragic love story set in the Roaring Twenties that critiques the American Dream.',
      imageUrl: 'https://example.com/greatgatsby.jpg',
    ),
    Book(
      title: 'Moby Dick',
      author: 'Herman Melville',
      description: 'An epic tale of a sea captain’s obsessive quest to hunt down the white whale.',
      imageUrl: 'https://example.com/mobydick.jpg',
    ),
    Book(
      title: 'Pride and Prejudice',
      author: 'Jane Austen',
      description: 'A classic novel about love, social standing, and the struggles of women in 19th-century England.',
      imageUrl: 'https://example.com/prideandprejudice.jpg',
    ),
    Book(
      title: 'The Catcher in the Rye',
      author: 'J.D. Salinger',
      description: 'A story about adolescent alienation and rebellion, told through the voice of Holden Caulfield.',
      imageUrl: 'https://example.com/catcherintherye.jpg',
    ),
    Book(
      title: 'The Lord of the Rings',
      author: 'J.R.R. Tolkien',
      description: 'An epic fantasy adventure about the battle between good and evil in Middle-earth.',
      imageUrl: 'https://example.com/lordoftherings.jpg',
    ),
    Book(
      title: 'Brave New World',
      author: 'Aldous Huxley',
      description: 'A dystopian novel that imagines a future society driven by consumerism and technological control.',
      imageUrl: 'https://example.com/bravenewworld.jpg',
    ),
    Book(
      title: 'Harry Potter and the Sorcerer\'s Stone',
      author: 'J.K. Rowling',
      description: 'The first book in the series about a young wizard and his adventures at Hogwarts.',
      imageUrl: 'https://example.com/harrypotter1.jpg',
    ),
    Book(
      title: 'The Alchemist',
      author: 'Paulo Coelho',
      description: 'A philosophical story about following one\'s dreams and personal legend.',
      imageUrl: 'https://example.com/thealchemist.jpg',
    ),
];

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  
  BooksBloc() : super(BooksState(books: books)) {
    on<SortByAuthour>((event, emit) {
      var newBooks = state.books.toList();
      newBooks.sort((a,b)=> a.author.compareTo(b.author));
      emit(BooksState(books: newBooks));
    });
    on<SortByTitle>((event, emit) {
      var newBooks = state.books.toList();
      newBooks.sort((a,b)=> a.title.compareTo(b.title));
      emit(BooksState(books: newBooks));
    });
  }
}


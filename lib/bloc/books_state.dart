part of 'books_bloc.dart';

@immutable
class BooksState {
  const BooksState({required this.books});

  final List<Book> books; 
}

@immutable
class Book{
  final String title;
  final String author;
  final String description;  
  final String imageUrl;

  const Book({
    required this.title, required this.author, required this.description, required this.imageUrl
    });
}

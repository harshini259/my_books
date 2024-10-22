part of 'books_bloc.dart';

@immutable
sealed class BooksEvent {}

final class SortByAuthour extends BooksEvent{}

final class SortByTitle extends BooksEvent{}
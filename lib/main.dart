import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_books/bloc/books_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => BooksBloc(),
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Books",
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color.fromRGBO(72, 74, 126, 1),
        ),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Club Home"),
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FilterRow(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Books",
              style: theme.textTheme.headlineSmall,
            ),
          ),
          const BooksRow(),
        ],
      ),
    );
  }
}

class BooksRow extends StatelessWidget {
  const BooksRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksBloc, BooksState>(
      builder: (context, state) {
        return SizedBox(
          height: 150,
          child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              for (var book in state.books)
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookDetail(book),
                        ));
                  },
                  child: Card(
                    child: Image.network(book.imageUrl),
                  ),
                ),
              const SizedBox(width: 10), // give it width
            ],
          ),
        );
      },
    );
  }
}

class BookDetail extends StatelessWidget {
  final Book book;
  const BookDetail(
    this.book, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Detail"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Image.network(
              book.imageUrl,
              height: 300,
            ),
            const SizedBox(height: 10),
            Text(
              book.title,
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            Text(book.author, style: theme.textTheme.titleSmall),
            const SizedBox(height: 10),
            Text(book.description),
          ],
        ),
      ),
    );
  }
}

class FilterRow extends StatefulWidget {
  const FilterRow({
    super.key,
  });

  @override
  State<FilterRow> createState() => _FilterRowState();
}

class _FilterRowState extends State<FilterRow> {
  var sortTypeAuthor = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        const Text("Sort By"),
        const SizedBox(width: 20), // give it width
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: sortTypeAuthor ? Colors.white : Colors.grey,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
          onPressed: () {
            context.read<BooksBloc>().add(SortByAuthour());
            setState(() {
              sortTypeAuthor = true;
            });
          },
          child: const Text('Author'),
        ),
        const SizedBox(width: 10), // give it width
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: !sortTypeAuthor ? Colors.white : Colors.grey,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
          onPressed: () {
            context.read<BooksBloc>().add(SortByTitle());
            setState(() {
              sortTypeAuthor = false;
            });
          },
          child: const Text('Title'),
        )
      ]),
    );
  }
}

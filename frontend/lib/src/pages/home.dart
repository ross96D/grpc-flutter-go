import 'package:flutter/material.dart';
import 'package:frontend/src/generated/book.pbgrpc.dart';
import 'package:frontend/src/statics.dart';
import 'package:frontend/src/utils/colors.dart';
import 'package:grpc/grpc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late BookServiceClient _bookService;
  List<Book> books = [];

  @override
  void initState() {
    _bookService = BookServiceClient(Connection.channel);
    getBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Home Page")),
        automaticallyImplyLeading: false,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 384),
        itemCount: books.length,
        itemBuilder: (context, i) {
          return _createBookWidget(books[i]);
        },
      ),
    );
  }

  Future<void> getBooks() async {
    books = [];
    Map<String, String> metadata = {}..addEntries([Authorization.getAuth]);
    ResponseStream<Book> resp = _bookService.getAllBooks(
      GetAllBooksParams(),
      options: CallOptions(
        metadata: metadata,
      )
    );
    await for (final r in resp) {
      books.add(r);
      setState(() {
        books = books;
    });
    }
  }

  Widget _createBookWidget(Book book) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: Card(
        child: Column(
          children: [
            Text(book.title),
            Text(book.description),
            Image.network("http://localhost:8081/${book.coverUrl}", width: 800, height: 200),
            Text("${book.author.name} ${book.author.lastname}"),
          ],
        ),
      ),
    );
  }
}
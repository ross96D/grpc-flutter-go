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
  List<Widget> wbooks = [];

  @override
  void initState() {
    print("INIT");

    _bookService = BookServiceClient(Connection.channel);
    getBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("BUILD");

    return Scaffold(
      backgroundColor: MColor.scaffoldBackground,
      appBar: AppBar(
        title: const Center(child: Text("Home Page")),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Column(
            children: wbooks,
          )
        ]
      ),
    );
  }

  Future<void> getBooks() async {
    books = [];
    wbooks = [];
    print("RPC CALL");
    Map<String, String> metadata = {}..addEntries([Authorization.getAuth]);
    print(metadata);
    ResponseStream<Book> resp = _bookService.getAllBooks(
      GetAllBooksParams(),
      options: CallOptions(
        metadata: metadata,
      )
    );
    print("RPC RESP");
    await for (final r in resp) {
      books.add(r);
      wbooks.add(_createBookWidget(r));
      setState(() {
        books = books;
        wbooks = wbooks;
    });
    }
  }

  Widget _createBookWidget(Book book) {
    print(book.coverUrl);
    return Container(
      color: MColor.foregroundColor,
      child: Row(
        children: [
          Text(book.title),
          Text(book.description),
          Image.network("http://localhost:8081/${book.coverUrl}"),
          Text(book.title),
        ],
      ),
    );
  }
}
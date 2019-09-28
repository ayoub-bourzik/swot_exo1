import 'package:flutter/material.dart';
import 'articles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Mes Articles',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.orange.shade800,
      ),
      body: MyArticles(),
    );
  }
}

class MyArticles extends StatefulWidget {
  MyArticles({Key key}) : super(key: key);

  _MyArticlesState createState() => _MyArticlesState();
}

class _MyArticlesState extends State<MyArticles> {
  final _articles = articles;
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _articles.length,
      itemBuilder: _buildItem,
    );
  }

  Widget _buildItem(context, index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Title : ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              _articles[index].title,
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
        leading: IconButton(
          icon: isFavorited ? Icon(Icons.star) : Icon(Icons.star_border),
          onPressed: () {
            setState(() {
             isFavorited = !isFavorited; 
            });
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:swot_exo1/detail_page.dart';
import 'articles.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Colors.orange.shade800,
        accentColor: Colors.white,
      ),
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Mes Articles',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.cast),
                child: Text("News"),
              ),
              Tab(
                icon: Icon(Icons.star),
                child: Text("Favorited"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MyArticles(),
            MyFavoritedArticles(),
          ],
        ),
      ),
    );
  }
}

class MyArticles extends StatefulWidget {
  MyArticles({Key key}) : super(key: key);

  _MyArticlesState createState() => _MyArticlesState();
}

class _MyArticlesState extends State<MyArticles> {
  final _articles = articles;

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
      child: Card(
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '${_articles[index].commentCount} Comments',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                )
              ],
            ),
            leading: IconButton(
              icon: _articles[index].isFavorited
                  ? Icon(Icons.star)
                  : Icon(Icons.star_border),
              onPressed: () {
                setState(() {
                  _articles[index].isFavorited = !_articles[index].isFavorited;
                  if (_articles[index].isFavorited)
                    favoritedArticles.add(_articles[index]);
                  else
                    favoritedArticles.removeAt(index);
                });
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(
                          article: _articles[index],
                        )),
              );
            },
          ),
        ),
      ),
    );
  }
}

class MyFavoritedArticles extends StatefulWidget {
  @override
  _MyFavoritedArticlesState createState() => _MyFavoritedArticlesState();
}

class _MyFavoritedArticlesState extends State<MyFavoritedArticles> {
  final _favoritedArticles = favoritedArticles;

  @override
  Widget build(BuildContext context) {
    if (_favoritedArticles.length > 0)
      return ListView.builder(
        itemCount: _favoritedArticles.length,
        itemBuilder: _buildItem,
      );
    else
      return Center(
        child: Text('There is no favorited article yet !'),
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
              _favoritedArticles[index].title,
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}

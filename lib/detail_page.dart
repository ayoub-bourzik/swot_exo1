import 'package:flutter/material.dart';
import 'package:swot_exo1/articles.dart';

class DetailPage extends StatelessWidget {
  final Article article;

  DetailPage({
    @required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 25.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  article.title,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: article.isFavorited
                      ? Icon(Icons.star, size: 35.0,)
                      : Icon(Icons.star_border, size: 35.0,),
                  onPressed: (){},
                ),
              ],
            ),
            SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        article.text,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 22.0,
                      ),
                      Text(
                        '${article.commentCount} Comments',
                        style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade500),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

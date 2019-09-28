import 'package:meta/meta.dart';

class Article {
  final int id;
  final String title;
  final String text;
  final int commentCount;

  Article({
    @required this.id,
    @required this.title,
    this.text,
    this.commentCount,
  });
}


final articles = [
  Article(
    id: 10,
    title: 'Cour Flutter 1',
    text: 'On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. avantage du Lorem Ipsum sur un texte générique',
    commentCount: 17
  ),
  Article(
    id: 20,
    title: 'Cour Flutter 2',
    text: 'On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. avantage du Lorem Ipsum sur un texte générique',
    commentCount: 79
  ),
  Article(
    id: 30,
    title: 'Cour Flutter 3',
    text: 'On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. avantage du Lorem Ipsum sur un texte générique',
    commentCount: 43
  ),
  Article(
    id: 40,
    title: 'Cour Flutter 4',
    text: 'On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. avantage du Lorem Ipsum sur un texte générique',
    commentCount: 77
  ),
];

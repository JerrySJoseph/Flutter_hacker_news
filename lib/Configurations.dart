import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppConfigurations {
  //Colors defined here
  static Color PrimaryColor = Colors.blueAccent;
  static Color SecondaryColor = Colors.amberAccent;
  static Color BackgroundClor = Colors.white;
  static Color TextColor = Colors.black54;
  static Color IconColor = Colors.black54;
  static Color TitleTextColor = Colors.black45;

  // Styles defined
  static TextStyle HeadingTextStyle = TextStyle(color: TextColor, fontSize: 20);
  static TextStyle SubTitleTextStyle =
      TextStyle(color: TextColor, fontSize: 15);
  static TextStyle itemArticleTitleTextStyle =
      TextStyle(color: TitleTextColor, fontSize: 20);
  static TextStyle itemArticleSubtitleTextStyle =
      TextStyle(color: PrimaryColor, fontSize: 15, fontStyle: FontStyle.italic);
}

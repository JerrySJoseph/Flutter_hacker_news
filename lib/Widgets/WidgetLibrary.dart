import 'package:flutter/material.dart';
import 'package:hacker_news/Configurations.dart';
import 'package:hacker_news/Models/ModelLibrary.dart';

Widget MainAppBar(String title) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: AppConfigurations.HeadingTextStyle,
    ),
    elevation: 0,
    backgroundColor: AppConfigurations.BackgroundClor,
  );
}

Widget _itemArticle(Article model) {
  return ExpansionTile(
    title: Text(
      model.title,
      style: AppConfigurations.itemArticleTitleTextStyle,
    ),
    subtitle: Text(
      model.by,
      style: AppConfigurations.itemArticleSubtitleTextStyle,
    ),
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            model.url,
            style: TextStyle(color: Colors.blue),
          ),
          IconButton(
            icon: Icon(Icons.link),
            onPressed: () {
              print("URL: ${model.url}");
            },
          )
        ],
      )
    ],
  );
}

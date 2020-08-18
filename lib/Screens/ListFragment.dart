import 'package:flutter/material.dart';
import 'package:hacker_news/Models/ModelLibrary.dart';

import '../ApiHelper.dart';
import '../Configurations.dart';

class ListFragment extends StatefulWidget {
  String URL;

  ListFragment({this.URL});

  @override
  _ListFragmentState createState() => _ListFragmentState();
}

class _ListFragmentState extends State<ListFragment> {
  List<Article> models = [];
  bool loading;
  int currentpage = 0;

  @override
  Widget build(BuildContext context) {
    return loading ? ShowNone() : ShowList();
  }

  Widget ShowList() {
    return ListView.builder(
        itemCount: models.length,
        itemBuilder: (context, index) {
          return Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: ListTile(
                  hoverColor: AppConfigurations.PrimaryColor,
                  title: Text(
                    getSubString(models[index].title, 35),
                    style: AppConfigurations.itemArticleTitleTextStyle,
                  ),
                  subtitle: Text(
                    "By ${models[index].by}",
                    textAlign: TextAlign.start,
                    style: AppConfigurations.itemArticleSubtitleTextStyle,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      print("On press Launch");
                    },
                  ),
                ),
              ));
        });
  }

  Widget ShowNone() {
    return Text("Loading data.. Please Wait");
  }

  String getSubString(String string, int length) {
    if (string.length > length) return string.substring(0, length) + "...";
    return string;
  }

  void LoadData(int limit) async {
    if (widget.URL == "TOP") {
      setState(() {
        loading = true;
        models.clear();
      });
      List<int> ids = await ApiHelper.fetchTopStoriesIds();
      if (limit > ids.length) limit = ids.length;
      for (int i = 0; i < limit; i++) {
        Article model = await ApiHelper.fetchArticle(ids[i]);
        setState(() {
          loading = false;
          models.add(model);
        });
      }
    } else {
      setState(() {
        loading = true;
        models.clear();
      });
      List<int> ids = await ApiHelper.fetchAskStoriesIds();
      for (int i = 0; i < ids.length; i++) {
        Article model = await ApiHelper.fetchArticle(ids[i]);
        setState(() {
          loading = false;
          models.add(model);
        });
      }
    }
  }

  @override
  void initState() {
    LoadData(10);
  }
}

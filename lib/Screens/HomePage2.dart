import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hacker_news/ApiHelper.dart';
import 'package:hacker_news/Configurations.dart';
import 'package:hacker_news/Models/ModelLibrary.dart';
import 'package:hacker_news/Screens/ListFragment.dart';

class HomePage2 extends StatefulWidget {
  String title, Status;
  HomePage2({this.title});

  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  List<Widget> pages = [
    ListFragment(
      URL: "TOP",
    ),
    ListFragment(
      URL: "ASK",
    ),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfigurations.BackgroundClor,
      appBar: AppBar(
        backgroundColor: AppConfigurations.BackgroundClor,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: AppConfigurations.IconColor,
          ),
          onPressed: () {
            print("On Menu Pressed");
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/hacker-news.png",
              height: 40,
              width: 40,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              widget.title,
              style: AppConfigurations.HeadingTextStyle,
            )
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: AppConfigurations.IconColor,
            ),
            onPressed: () {
              print("On More Pressed");
            },
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: pages[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.new_releases), title: Text("Top Stories")),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_answer), title: Text("Ask, Show, Job"))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen();

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final String username = "Username";
  final String level = "LVL 80";
  final String progress = "Progress: 60%";
  final List<String> _quests = ["Квест 1", "Квест 2"];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new CircleAvatar(child: new Text(username[0])),
              new Container(
                padding: const EdgeInsets.only(top: 16),
                child: Text(username),
              ),
              new Container(
                padding: const EdgeInsets.only(top: 8),
                child: Text(level),
              ),
              new Container(
                padding: const EdgeInsets.only(top: 4),
                child: Text(progress),
              ),
              new Container(
                padding: EdgeInsets.all(16),
                child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Игровой рейтинг"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star_border),
                          Icon(Icons.star_border),
                        ],
                      )
                    ],
                ),
              ),
              new Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Авторский рейтинг"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star_border),
                      ],
                    )
                  ],
                ),
              ),
              new Container(
                padding: EdgeInsets.all(16),
                child: new Row(
                  children: <Widget>[
                    Text("Квесты"),
                  ],
                ),
              ),
              Expanded(
                child: _buildQuests(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuests() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _quests.length*2,
        itemBuilder: (context, i) {
          if (i.isOdd) {
            return Divider();
          }
          final index = i ~/ 2;
          return _buildRow(_quests[index]);
        });
  }

  Widget _buildRow(String title) {

    return ListTile(
      title: Text(
        title,
        style: _biggerFont,
      ),
      onTap: () {
        _handleDidSelectQuest(title);
      },
    );
  }

  void _handleDidSelectQuest(String title) {
    print(title);
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}
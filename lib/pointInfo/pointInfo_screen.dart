import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quest/src/locations.dart';
import 'taskSection.dart';
import 'chatMessage.dart';
import 'package:quest/profile/profile_screen.dart';

class PointInfoScreen extends StatefulWidget {
  PointInfoScreen(this.office);
  final Office office;
  final int questions = 3;

  @override
  _PointInfoScreenState createState() => _PointInfoScreenState();
}

class _PointInfoScreenState extends State<PointInfoScreen> {

  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();
  int answers = 0;
  String _progress = "🛅 🛅 🛅";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.office.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TaskSection(widget.office, _progress),
            new Divider(height: 1.0),
            new Flexible(
              child: new ListView.builder(
                padding: new EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_, int index) => _messages[index],
                itemCount: _messages.length,
              ),
            ),
            new Divider(height: 1.0),
            new Container(
              decoration: new BoxDecoration(
                  color: Theme.of(context).cardColor
              ),
              child: _buildTextComposer(),
            ),
          ],
        ),
      ),
    );
  }

  void _handleCompletePoint() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return ProfileScreen();
          }
      ),
    );
  }

  void _handleSubmitted(String text) {
    if (text.isNotEmpty) {
      String result;
      if (widget.office.address.contains(text)) {
        answers += 1;
        result = "✅";
      } else {
        result = "❌";
      }
      String progress = "";
      for (int i = 0; i < widget.questions; i++) {
        if (i < answers) {
          progress += "✅";
        } else {
          progress += "🛅";
        }
        if (i < widget.questions - 1) {
          progress += " ";
        }
      }

      _textController.clear();
      ChatMessage message = new ChatMessage(
        username: "Username",
        text: text,
        description: result,
      );
      setState(() {
        _progress = progress;
        _messages.insert(0, message);
      });

      if (answers >= widget.questions) {
        new Timer(const Duration(seconds: 1), _handleCompletePoint);
      }
    }
  }

  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: new InputDecoration.collapsed(
                    hintText: "Send an answer"),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }

}


import 'package:flutter/material.dart';
import 'emotions.dart';

class Emotioncard extends StatelessWidget {
  // const Emotioncard({
  //   Key key,
  // }) : super(key: key);
  final Emotion emotion;
  final Function delete;
  Emotioncard({this.emotion, this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(emotion.text,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.pink[800],
                  )),
              SizedBox(height: 6.0),
              Text(
                emotion.statement,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.pink[300],
                ),
              ),
              SizedBox(height: 8.0),
              FlatButton.icon(
                onPressed: delete,
                label: Text('Delete emotion'),
                icon: Icon(Icons.delete),
              ),
            ]),
      ),
    );
  }
}

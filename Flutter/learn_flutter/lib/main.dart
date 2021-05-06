import 'package:flutter/material.dart';
import 'emotions.dart';
import 'emotion_card.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int level = 0;
  List<Emotion> emotions = [
    Emotion(text: 'Happy', statement: 'Happppyyyyyy'),
    Emotion(text: 'Happy', statement: 'Happppyyyyyy'),
    //Emotion(text: 'Happy', statement: 'Happppyyyyyy'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Facial Emotion Recognizer'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            level += 1;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.pink[800],
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/stars2.jpg'),
                  radius: 40.0,
                ),
              ),
              Divider(
                height: 90.0,
                color: Colors.grey[800],
              ),
              Center(
                child: Text('This app recognizes emotions in real time',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2.0,
                    )),
              ),
              SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  Center(
                    child: Text('Please upload an image',
                        style: TextStyle(
                          color: Colors.grey[600],
                          letterSpacing: 2.0,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Icon(
                    Icons.file_upload,
                  ),
                ],
              ),
              //SizedBox(height: 30.0),
              Text('Network Used: $level',
                  style: TextStyle(
                    color: Colors.grey[600],
                    letterSpacing: 2.0,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 30.0),
              Column(
                children: emotions
                    .map((emotion) => Emotioncard(
                        emotion: emotion,
                        delete: () {
                          setState(() {
                            emotions.remove(emotion);
                          });
                        }))
                    .toList(),
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.email,
                    color: Colors.grey[450],
                  ),
                  SizedBox(width: 100.0),
                  Text(
                    'devangidp2000@gmail.com',
                    style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 15.0,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_firebase_app1/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.yellow[50],
        appBar: AppBar(
          title: Text('NoteBook'),
          backgroundColor: Colors.teal[100],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}

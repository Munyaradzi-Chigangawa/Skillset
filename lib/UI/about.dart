import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'About',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop()),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 8, bottom: 4),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "App Info",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Card(
                    child:Container(
                      child: Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(15),
                        child: Column(children: <Widget>[
                          Column(
                            children:<Widget>[
                              ...ListTile.divideTiles(
                                color: Colors.grey,
                                tiles: [
                                  ListTile(
                                    leading: Icon(Icons.info),
                                    title: Text('Skillset'),
                                    subtitle: Text('App developed to help people find IT services providers in various disciplines.'),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.phone_android),
                                    title: Text('Version'),
                                    subtitle: Text('0.1.1'),
                                  )
                                ]
                              )
                            ]
                          )
                        ],)
                      ),
                      )
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.only(left: 8, bottom: 4),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Developer",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Card(
                    child:Container(
                      child: Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(15),
                        child: Column(children: <Widget>[
                          Column(
                            children:<Widget>[
                              ...ListTile.divideTiles(
                                color: Colors.grey,
                                tiles: [
                                  ListTile(
                                    leading: Icon(Icons.person),
                                    title: Text('Munyaradzi Chigangawa'),
                                    subtitle: Text('Chinhoyi, Zimbabwe'),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.email),
                                    title: Text('Email'),
                                    subtitle: Text('munyaradzichigangawa6@gmail.com'),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.link),
                                    title: Text('LinkedIn'),
                                    subtitle: Text('Munyaradzi Chigangawa'),
                                  )
                                ]
                              )
                            ]
                          )
                        ],)
                      ),
                      )
                  )
                ],
              ))
        ],
      )),
    );
  }
}

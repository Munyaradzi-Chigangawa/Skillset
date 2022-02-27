import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillset/Notifier/notifier.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProfileNotifier profileNotifier = Provider.of<ProfileNotifier>(context);
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: SingleChildScrollView(
          child: Stack(
        children: <Widget>[
          SizedBox(
              height: 250,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                        profileNotifier.currentProfile.image,
                      ),
                    )),
                width: double.infinity,
              )),
          Container(
              margin: EdgeInsets.fromLTRB(16.0, 200, 16, 16),
              child: Column(children: <Widget>[
                Stack(children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(16.0),
                      margin: EdgeInsets.only(top: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 96.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 10,),
                                    Text(
                                      profileNotifier.currentProfile.name,
                                      style: TextStyle(fontSize: 16.5),
                                    ),
                                    ListTile(
                                      contentPadding: EdgeInsets.all(0),
                                      title: Text((profileNotifier
                                          .currentProfile.profession).replaceAll("#","\n")),
                                      subtitle: Text(profileNotifier
                                          .currentProfile.location),
                                    ),
                                  ]),
                            ),
                            SizedBox(height: 10),
                          ])),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                            profileNotifier.currentProfile.image,
                          ),
                        )),
                    margin: EdgeInsets.only(left: 16),
                  )
                ]),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(children: <Widget>[
                    ListTile(
                      title: Text("Contact Information"),
                    ),
                    Divider(),
                    ListTile(
                      title: Text("e-mail"),
                      subtitle: Text(profileNotifier.currentProfile.email),
                      leading: Icon(Icons.email),
                    ),
                    Divider(),
                    ListTile(
                      title: Text("Phone"),
                      subtitle: Text(profileNotifier.currentProfile.phone),
                      leading: Icon(Icons.phone),
                    ),
                    Divider(),
                    ListTile(
                      title: Text("LinkedIn"),
                      subtitle: Text(profileNotifier.currentProfile.linkedin),
                      leading: Icon(Icons.link),
                    ),
                    Divider(),
                    ListTile(
                      title: Text("About"),
                      subtitle: Text(profileNotifier.currentProfile.about),
                      leading: Icon(Icons.info_outline),
                    ),
                  ]),
                ),
                SizedBox(height: 10),
                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: RaisedButton(
                        color: Colors.green.shade800,
                        child: Text("WhatsApp"),
                        onPressed: () async {
                          String url = profileNotifier.currentProfile.whatsapp;
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not Open WhatsApp $url';
                          }
                        },
                      )),
                      Expanded(
                          child: RaisedButton(
                              color: Colors.blue.shade800,
                              child: Text("Call"),
                              onPressed: () async {
                                String url = 'tel:' +
                                    profileNotifier.currentProfile.call;
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not Call $url';
                                }
                              }))
                    ],
                  ),
                ),
              ])),
        ],
      )),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.of(context).pop()),
        elevation: 0,
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skillset/Notifier/notifier.dart';
import 'package:skillset/UI/about.dart';
import 'package:provider/provider.dart';
import 'package:skillset/api/api.dart';
import 'details.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState>_drawerKey = GlobalKey();
  @override
  void initState() {
    ProfileNotifier profileNotifier = Provider.of<ProfileNotifier>(context, listen: false);
    getProfiles(profileNotifier);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ProfileNotifier profileNotifier = Provider.of<ProfileNotifier>(context);

    Future<void> _refreshList() async {
      getProfiles(profileNotifier);
    }

    print("Loading...");
    return Scaffold(
      key: _drawerKey,
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              _drawerKey.currentState.openDrawer();
            }
            ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: new RefreshIndicator(
        child: ListView.builder(
        itemBuilder: (BuildContext context, int index){
          return Container(
          height: 100,
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
            child:ListTile(
            leading: CachedNetworkImage(imageUrl:profileNotifier.profileList[index].image,
            fit: BoxFit.fitHeight,
            //height:100,
            alignment: Alignment.centerLeft,
            ),
            title: Text(profileNotifier.profileList[index].name),
            subtitle: Text((profileNotifier.profileList[index].profession).replaceAll("#","\n")),
            onTap: (){
              profileNotifier.currentProfile = profileNotifier.profileList[index];
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context){
                  return Details();
                })
              );
            },
          ),
          margin: EdgeInsets.all(7),
          ),
          elevation: 2,
          ),);
        }, 
        itemCount: profileNotifier.profileList.length,
      ),
      onRefresh: _refreshList,
      ),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
          DrawerHeader(
            child: Text(''),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('Assets/Images/Skillset.png'),
              fit: BoxFit.fitWidth,
              ),
              color: Colors.transparent,
            ),
          ),
          ListTile(
            title: Text("Home"),
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          new Divider(),
          ListTile(
            title: Text("About"),
            leading: Icon(Icons.info),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => About()));
            },
          ),
          new Divider(),
        ]),
      ),
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skillset/Model/model.dart';
import 'package:skillset/Notifier/notifier.dart';

getProfiles(ProfileNotifier profileNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance
  .collection('Profiles')
  .orderBy('name', descending: false)
  .getDocuments();

  List<Profile> _profileList = [];

  snapshot.documents.forEach((document) { 
    Profile profile = Profile.fromMap(document.data);
    _profileList.add(profile);
  });

  profileNotifier.profileList = _profileList;
  
}
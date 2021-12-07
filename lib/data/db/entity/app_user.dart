import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AppUser {
  String id;
  String name;
  int age;
  String number;
  String platform;
  String game;
  String profilePhotoPath;
  String bio = "";

  AppUser(
      {@required this.id,
      @required this.name,
      @required this.age,
      @required this.number,
      @required this.platform,
      @required this.game,
      @required this.profilePhotoPath});

  AppUser.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot['id'];
    name = snapshot['name'];
    age = snapshot['age'];
    number = snapshot['number'];
    platform = snapshot['platform'];
    game = snapshot['game'];
    profilePhotoPath = snapshot['profile_photo_path'];
    bio = snapshot.get('bio') ?? '';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'age': age,
      'number': number,
      'platform': platform,
      'game': game,
      'profile_photo_path': profilePhotoPath,
      'bio': bio
    };
  }
}



import 'package:flutter/widgets.dart';

class accountSchedule with ChangeNotifier {

  var nameofuser = '';
  var profilepicture = '';
  var noofposts = '';
  var followerscount = '';
  var followingcount = '';
  var bio = '';
  var postsidlist = '';

  var userIsFollowing = false;


  void setnameofuser(String name) {
    nameofuser = name;
    notifyListeners();
  }

  void setprofilepicture(String profilepic) {
    profilepicture = profilepic;
    notifyListeners();
  }

  void setnoofposts(String posts) {
    noofposts = posts;
    notifyListeners();
  }

  void setfollowerscount(String followers) {
    followerscount = followers;
    notifyListeners();
  }

  void setfollowingcount(String following) {
    followingcount = following;
    notifyListeners();
  }

  void setbio(String bio1) {
    bio = bio1;
    notifyListeners();
  }

  void setpostsidlist(String postsid) {
    postsidlist = postsid;
    notifyListeners();
  }

  void setuserIsFollowing(bool isFollowing) {
    userIsFollowing = isFollowing;
    notifyListeners();
  }

  String get getnameofuser => nameofuser;

  String get getprofilepicture => profilepicture;

  String get getnoofposts => noofposts;

  String get getfollowerscount => followerscount;

  String get getfollowingcount => followingcount;

  String get getbio => bio;

  String get getpostsidlist => postsidlist;

  bool get getuserIsFollowing => userIsFollowing;

}
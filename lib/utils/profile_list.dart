class ProfileData {
  final String nameofuser;
  final String profilepicture;
  final int noofposts;
  final int followerscount;
  final int followingcount;
  final String bio;
  final List<dynamic> postsidlist;

  ProfileData({
    required this.nameofuser,
    required this.profilepicture,
    required this.noofposts,
    required this.followerscount,
    required this.followingcount,
    required this.bio,
    required this.postsidlist,
  });
}
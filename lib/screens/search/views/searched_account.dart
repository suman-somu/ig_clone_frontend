import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
// import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:instgram_clone/screens/search/services/search_account_service.dart';

import '../../../services/appwrite_image_preview.dart';

class SearchAccount extends StatefulWidget {
  final String searchAccountUsername;

  const SearchAccount({Key? key, required this.searchAccountUsername})
      : super(key: key);

  @override
  State<SearchAccount> createState() => SearchAccountState();
}

class SearchAccountState extends State<SearchAccount> {
  var nameofuser = '';
  var profilepicture = '';
  var noofposts = '';
  var followerscount = '';
  var followingcount = '';
  var bio = '';
  var postsidlist = '';

  var userIsFollowing = false;

  @override
  void initState() {
    super.initState();

    getProfileDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Animate(
      delay: const Duration(milliseconds: 0),
      effects: const [
        FadeEffect(duration: Duration(milliseconds: 300)),
        SlideEffect(
          duration: Duration(milliseconds: 300),
          begin: Offset(0.4, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => {Navigator.pop(context)},
            child: const Icon(Icons.arrow_back_ios_new),
          ),
          title: Text(
            (nameofuser == '') ? '...' : nameofuser,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 50.0,
                          backgroundColor: Color.fromARGB(255, 255, 0, 85),
                          backgroundImage:
                              (profilepicture != 'YOUR_DEFAULT_AVATAR_URL')
                                  ? NetworkImage(
                                      profilepicture,
                                    )
                                  : null,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Text(
                              (noofposts == '') ? '-1' : noofposts.toString(),
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Text('Posts'),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              (followerscount == '')
                                  ? '-1'
                                  : followerscount.toString(),
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Text('Followers'),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              (followingcount == '')
                                  ? '-1'
                                  : followingcount.toString(),
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Text('Following'),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Photographer | Traveller',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      (bio == '') ? 'THERE IS NO BIO' : bio,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    alignment: Alignment.bottomCenter,
                                    backgroundColor: Colors.white,
                                    title: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                        (!userIsFollowing)
                                            ? 'Follow ?'
                                            : 'Unfollow ?',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'Cancel',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          (userIsFollowing)
                                              ? UnfollowAccount('sam')
                                              : FollowAccount('sam');
                                          Navigator.pop(context);
                                          setState(() {
                                            userIsFollowing = !userIsFollowing;
                                          });
                                        },
                                        child: Text(
                                          (!userIsFollowing)
                                              ? 'Follow'
                                              : 'Unfollow',
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                      .animate(
                                          delay:
                                              const Duration(milliseconds: 0))
                                      .slideY(
                                          duration:
                                              const Duration(milliseconds: 50),
                                          begin: -0.2,
                                          end: -0.4);
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(100, 40),
                              backgroundColor: (!userIsFollowing)
                                  ? Colors.blue.shade600
                                  : Colors.grey.shade200,
                              foregroundColor: (!userIsFollowing)
                                  ? Colors.white
                                  : Colors.black,
                              elevation: 0,
                              textStyle: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                                (!userIsFollowing) ? 'Follow' : 'Following'),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text(
                                          'Message has not been built yet',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          )),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            'OK',
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(100, 40),
                              backgroundColor: Colors.grey.shade600,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              textStyle: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('Message'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      height: 0,
                      // thickness: 0.5,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemCount: (postsidlist.isNotEmpty)
                          ? postsidlist.split(',').length
                          : 0,
                      itemBuilder: (context, index) {
                        var postID = postsidlist.split(',');
                        // print("indexvalue = ${index}");
                        // print("postID[index] = ${postID[index]}");
                        return appwriteImage(postID[index]);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getProfileDetails() async {
    var profile = await searchAccount(widget.searchAccountUsername);
    setState(() {
      nameofuser = profile['nameofuser'].toString();
      profilepicture = profile['profilepicture'].toString();
      noofposts = profile['noofposts'].toString();
      followerscount = profile['followerscount'].toString();
      followingcount = profile['followingcount'].toString();
      bio = profile['bio'].toString();
      // postsidlist = profile['postsidlist']!;
      postsidlist = profile['postsidlist']!.substring(1,profile['postsidlist']!.length-1);

      print("returned list: &" + postsidlist+"&");
      // var postID = postsidlist.split(',')[0];
      // print(postID);
      // print(postsidlist.isEmpty);
    });
  }
}

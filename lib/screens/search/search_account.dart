import 'package:flutter/material.dart';
import 'package:instgram_clone/services/search_account_service.dart';

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
    var itemCount = 10;
    return Scaffold(
      appBar: AppBar(
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
                        backgroundImage:
                            AssetImage('assets/images/profileimage.png'),
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
                                  backgroundColor: Colors.white,
                                  title: Text(
                                    (!userIsFollowing)
                                        ? 'Follow ?'
                                        : 'Unfollow ?',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
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
                                );
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
                          child:
                              Text((!userIsFollowing) ? 'Follow' : 'Following'),
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
                    itemCount: itemCount,
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.amber,
                        // child: Image.asset(
                        //   'assets/images/image_$index.png',
                        //   fit: BoxFit.cover,
                        // ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  void getProfileDetails() async{
    var profile = await searchAccount(widget.searchAccountUsername);
    setState(() {
      nameofuser = profile['nameofuser'].toString();
      profilepicture = profile['profilepicture'].toString();
      noofposts = profile['noofposts'].toString();
      followerscount = profile['followerscount'].toString();
      followingcount = profile['followingcount'].toString();
      bio = profile['bio'].toString();
      postsidlist = profile['postsidlist'].toString();
    });

  }
}
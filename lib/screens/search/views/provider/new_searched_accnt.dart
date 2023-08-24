

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:instgram_clone/screens/search/accountSchedule.dart';
import 'package:provider/provider.dart';

import '../../../../services/appwrite_image_preview.dart';

class searchAccnt extends StatelessWidget {
  const searchAccnt({super.key});

  @override
  Widget build(BuildContext context) {

    // final accountSchedule = Provider.of<accountSchedule>(context);
    return Consumer<accountSchedule>(
      builder: (context, schedule, _) => Animate(
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
              (schedule.getnameofuser == '') ? '...' : schedule.getnameofuser,
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
                                (schedule.getprofilepicture != 'YOUR_DEFAULT_AVATAR_URL')
                                    ? NetworkImage(
                                        schedule.getprofilepicture,
                                      )
                                    : null,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Text(
                                (schedule.getnoofposts == '') ? '-1' : schedule.getnoofposts.toString(),
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
                                (schedule.getfollowerscount == '')
                                    ? '-1'
                                    : schedule.getfollowerscount.toString(),
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
                                (schedule.getfollowingcount == '')
                                    ? '-1'
                                    : schedule.getfollowingcount.toString(),
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
                        (schedule.getbio == '') ? 'THERE IS NO BIO' : schedule.getbio,
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
                                          (!schedule.getuserIsFollowing)
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
                                            // (schedule.getuserIsFollowing)
                                            Navigator.pop(context);

                                          },
                                          child: Text(
                                            (!schedule.getuserIsFollowing)
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
                                backgroundColor: (!schedule.getuserIsFollowing)
                                    ? Colors.blue.shade600
                                    : Colors.grey.shade200,
                                foregroundColor: (!schedule.getuserIsFollowing)
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
                                  (!schedule.getuserIsFollowing) ? 'Follow' : 'Following'),
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
                        itemCount: (schedule.getpostsidlist.isEmpty)
                            ? schedule.getpostsidlist.split(',').length
                            : 0,
                        itemBuilder: (context, index) {
                          List<dynamic> parsedList;
                          List<String> postsidlistStrings = [""];
                          if (schedule.getpostsidlist.isNotEmpty) {
                            parsedList = json.decode(schedule.getpostsidlist);
                            postsidlistStrings =
                                parsedList.map((id) => id.toString()).toList();
                          }
                          var postId = postsidlistStrings[index];
                          var postID = schedule.getpostsidlist.split(',');
                          print("to pass the id = "+schedule.getpostsidlist);
                          return appwriteImage(postId);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
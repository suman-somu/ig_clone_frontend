import 'package:flutter/material.dart';
import 'package:instgram_clone/screens/mesages/messages_page.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../../../models/FeedModel.dart';
import '../services/feed_service.dart';
import '../../../utils/widgets/PostWidget.dart';

class HomeFeed extends StatefulWidget {
  const HomeFeed({Key? key});

  @override
  _HomeFeedState createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  Future<List<Feed>> _getHomeFeed() async {
    return await getHomeFeed();
  }

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
      _getHomeFeed();
    });
    refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    refreshController.loadComplete();

    // Load the next set of images
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Instagram",
              style: TextStyle(
                fontFamily: 'Cookie',
                fontWeight: FontWeight.w500,
                fontSize: 35,
                letterSpacing: 1,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MessagesPage(),
                      ),
                    );
              },
              child: SizedBox(
                height: 25,
                child: Image.asset('assets/images/messages.png'),
              ),
            ),
          ],
        ),
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        shadowColor: Colors.grey,
      ),
      body: FutureBuilder<List<Feed>>(
        future: _getHomeFeed(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<Feed> posts = snapshot.data!;

            return SmartRefresher(
              controller: refreshController,
              enablePullDown: true,
              enablePullUp: true,
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return PostWidget(feed: posts[index]);
                },
              ),
            );
          }
        },
      ),
    );
  }
}

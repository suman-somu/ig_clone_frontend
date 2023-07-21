import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../../services/feed_service.dart';
import '../../widgets/PostWidget.dart';

class HomeFeed extends StatelessWidget {
  const HomeFeed({Key? key});

  @override
  Widget build(BuildContext context) {
    List posts = getFeed();

    RefreshController refreshController =
        RefreshController(initialRefresh: false);

    void onRefresh() async {
      await Future.delayed(const Duration(milliseconds: 1000));
      refreshController.refreshCompleted();
    }

    void onLoading() async {
      await Future.delayed(const Duration(milliseconds: 1000));
      refreshController.loadComplete();
    }

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
              onTap: () {},
              child: SizedBox(
                height: 25,
                child: Image.asset('assets/images/messages.png'),
              ),
            ),
          ],
        ),
      ),
      body: SmartRefresher(
        controller: refreshController,
        enablePullDown: true,
        enablePullUp: true,
        onRefresh: onRefresh,
        onLoading: onLoading,
        child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return PostWidget(feed: posts[index]);
          },
        ),
      ),
    );
  }
}

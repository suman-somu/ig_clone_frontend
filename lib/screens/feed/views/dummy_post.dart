import 'package:flutter/material.dart';

class DummyPost extends StatefulWidget {

  const DummyPost({super.key});

  @override
  State<DummyPost> createState() => _DummyPostState();
}

class _DummyPostState extends State<DummyPost> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(50)
                            ),
                        child: const Center(child: Icon(Icons.person)),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Text(
                          "JOHN DOE",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8.0),
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey[300],
                ),
                const SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (selected) {
                            selected = false;
                          } else {
                            selected = true;
                          }
                        });
                      },
                      isSelected: selected,
                      icon: const Icon(Icons.favorite_border),
                      selectedIcon: const Icon(Icons.favorite),
                      color: (selected) ? Colors.redAccent : Colors.black,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.comment_outlined),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.share_outlined),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "100",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                       Text(
                        " likes",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: const [
                        TextSpan(
                          text: "John Doe",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                         WidgetSpan(child: SizedBox(width: 10)),
                        TextSpan(text: "first post"),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  height: 50,
                  indent: 10,
                  endIndent: 10,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(50)
                            ),
                        child: const Center(child: Icon(Icons.person)),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Text(
                          "JOHN",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8.0),
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey[300],
                ),
                const SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (selected) {
                            selected = false;
                          } else {
                            selected = true;
                          }
                        });
                      },
                      isSelected: selected,
                      icon: const Icon(Icons.favorite_border),
                      selectedIcon: const Icon(Icons.favorite),
                      color: (selected) ? Colors.redAccent : Colors.black,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.comment_outlined),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.share_outlined),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "1",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                       Text(
                        " likes",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: const [
                        TextSpan(
                          text: "John",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                         WidgetSpan(child: SizedBox(width: 10)),
                        TextSpan(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's "),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  height: 50,
                  indent: 10,
                  endIndent: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

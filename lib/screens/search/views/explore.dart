import 'package:flutter/material.dart';

import 'predictions.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<String> _imageList = []; // List of images
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Load initial set of images
    _loadImages();
    // Add scroll listener
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // Reached the bottom of the list, load more images
      _loadImages();
    }
  }

  void _loadImages() {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });

      Future.delayed(const Duration(seconds: 2), () {
        List<String> newImages = List.generate(
          21,
          (index) =>
          'https://public.bnbstatic.com/static/academy/uploads-original/0ee9d7d59d424a7c8bd7d70c86070beb.png'
        );

        setState(() {
          _isLoading = false;
          _imageList.addAll(newImages);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 10, right: 20, left: 10),
              child: SizedBox(
                height: 40.0, // Adjust the height as needed
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchPrediction(),
                      ),
                    );
                  },
                  child: Container(
                    height: 40.0,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(width: 10),
                        Text(
                          'Search',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                controller: _scrollController,
                itemCount: _imageList.length + 1,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 1.0,
                ),
                itemBuilder: (context, index) {
                  if (index < _imageList.length) {
                    return Image.network(
                      _imageList[index],
                      fit: BoxFit.cover,
                    );
                  } else if (_isLoading) {
                    return const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

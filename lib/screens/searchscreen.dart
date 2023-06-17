import 'package:flutter/material.dart';

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
              'https://img.freepik.com/free-photo/blossom-floral-bouquet-decoration-colorful-beautiful-flowers-background-garden-flowers-plant-pattern-wallpapers-greeting-cards-postcards-design-wedding-invites_90220-1103.jpg',
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
  padding: const EdgeInsets.only(top: 20, bottom: 10, right: 20, left: 10),
  child: Container(
    height: 40.0, // Adjust the height as needed
    child: TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
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

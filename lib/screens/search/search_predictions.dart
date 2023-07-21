import 'package:flutter/material.dart';
import 'package:instgram_clone/services/search_prediction_service.dart';

import '../../models/list.dart';

class SearchPrediction extends StatefulWidget {
  const SearchPrediction({super.key});

  @override
  State<SearchPrediction> createState() => SsearchPredictionState();
}

class SsearchPredictionState extends State<SearchPrediction> {
  late FocusNode _focusNode = FocusNode();
  TextEditingController SearchPredictionKeywords = TextEditingController();

  //make a example json response list
  // List<<PredictionList>> searchPredictionList = [{nameofuser: Suman Sahoo, username: sam, profilePicture: YOUR_DEFAULT_AVATAR_URL}, {nameofuser: Suman Sahoo, username: sumansah00, profilePicture: YOUR_DEFAULT_AVATAR_URL}, {username: sumansahoo, profilePicture: YOUR_DEFAULT_AVATAR_URL}]

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Automatically request focus when the screen is loaded
    FocusScope.of(context).requestFocus(_focusNode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 10, right: 20, left: 10),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const SizedBox(
                  width: 40,
                  height: 20,
                  child: Icon(Icons.arrow_back_ios_new),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: TextField(
                  controller: SearchPredictionKeywords,
                  autofocus: true, // Automatically open the keyboard
                  focusNode: _focusNode,
                  onChanged: (text) {
                    // if (text.isNotEmpty) {
                    // }
                      updatelist();
                  },
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: Colors.grey,
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
            ],
          ),
        ),
      ),
    );
  }

  updatelist() {
    String text = SearchPredictionKeywords.text;
    text = text.trimLeft();
    text = text.trimRight();
    if (text.isNotEmpty) {
      searchPredictionService(SearchPredictionKeywords.text);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:instgram_clone/screens/search/search_account.dart';
import 'package:instgram_clone/services/search_prediction_service.dart';


class SearchPrediction extends StatefulWidget {
  const SearchPrediction({super.key});

  @override
  State<SearchPrediction> createState() => SsearchPredictionState();
}

class SsearchPredictionState extends State<SearchPrediction> {
  late FocusNode _focusNode = FocusNode();
  TextEditingController SearchPredictionKeywords = TextEditingController();

  List<Map<String, String>> searchResults = [];

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
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const SizedBox(
                      width: 40,
                      height: 20,
                      child: Icon(Icons.arrow_back_ios_new),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      controller: SearchPredictionKeywords,
                      autofocus: true, // Automatically open the keyboard
                      focusNode: _focusNode,
                      onChanged: (text) {
                        updatelist();
                      },
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: const Icon(Icons.search),
                        prefixIconColor: Colors.grey,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 5.0),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(searchResults[index]['nameofuser'] ?? ''),
                      subtitle: Text(searchResults[index]['username'] ?? ''),
                      leading: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 255, 0, 85),
                        backgroundImage: NetworkImage(
                          searchResults[index]['profilePicture'] ?? '',
                        ),
                      ),
                      onTap: () {
                        var searchAccountUsername = searchResults[index]['username'].toString();
                        FocusScope.of(context).unfocus();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchAccount(searchAccountUsername: searchAccountUsername,),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updatelist() async {
    String text = SearchPredictionKeywords.text.trim();
    if (text.isNotEmpty) {
      var results = await searchPredictionService(text);
      print("Results = $results");

      // Convert the List<dynamic> to List<Map<String, String>>
      List<Map<String, String>> typedResults = results.map((dynamic item) {
        return Map<String, String>.from(item);
      }).toList();
      print(typedResults);

      setState(() {
        searchResults = typedResults;
      });
    } else {
      setState(() {
        searchResults = [];
      });
    }
  }
}

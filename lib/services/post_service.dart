import 'dart:io';

import 'package:http/http.dart' as http;

var url = 'localhost:8080';

// main(){
//   var image = File('assets/images/about.png');
//   postImage(image, 'what is up');
// }

void postImage(List<File> images, String caption) async {
  var uri = Uri.http(url, 'api/user/post');
  var request = http.MultipartRequest('POST', uri);
  if(caption.isNotEmpty) {
    request.fields['caption'] = caption;
  }
  for (var image in images) {
    request.files.add(await http.MultipartFile.fromPath(
      'photo', // Same name as defined in the backend ('photo')
      image.path,
    ));
  }

  var response = await request.send();
  if (response.statusCode == 200) {
    print('Uploaded!');
  } else {
    print('Upload failed with status code: ${response.statusCode}');
  }
}
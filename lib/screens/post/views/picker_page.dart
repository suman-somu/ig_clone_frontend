import 'dart:io';

import 'package:flutter/material.dart';
import 'package:insta_assets_picker/insta_assets_picker.dart';
import 'package:instgram_clone/screens/post/services/post_service.dart';

import '../../../utils/widgets/cropresultsview.dart';
import '../../homepage.dart';

class PickerPage extends StatefulWidget {
  const PickerPage({super.key});

  @override
  State<PickerPage> createState() => _PickerPageState();
}

class _PickerPageState extends State<PickerPage> {
  final _instaAssetsPicker = InstaAssetPicker();
  final _provider = DefaultAssetPickerProvider(maxAssets: 10);

  List<AssetEntity> selectedAssets = <AssetEntity>[];
  InstaAssetsExportDetails? exportDetails;

  @override
  void dispose() {
    _provider.dispose();
    _instaAssetsPicker.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _openPicker();
    });
  }

  void _openPicker() async {
    await InstaAssetPicker.pickAssets(
      context,
      pickerTheme: ThemeData(
        canvasColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: Theme.of(context)
              .appBarTheme
              .titleTextStyle
              ?.copyWith(color: Colors.white),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.blue,
            disabledForegroundColor: Colors.blue,
          ),
        ),
      ),
      title: 'New Post',
      maxAssets: 10,
      cropDelegate: const InstaAssetCropDelegate(
        preferredSize: 1080,
        cropRatios: [1 / 1, 4 / 5],
      ),
      onCompleted: (cropStream) {
        cropStream.asBroadcastStream();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                PickerCropResultScreen(cropStream: cropStream),
          ),
        );
      },
    );
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class PickerCropResultScreen extends StatefulWidget {
  const PickerCropResultScreen({Key? key, required this.cropStream})
      : super(key: key);

  final Stream<InstaAssetsExportDetails> cropStream;

  @override
  _PickerCropResultScreenState createState() => _PickerCropResultScreenState();
}

class _PickerCropResultScreenState extends State<PickerCropResultScreen> {
  List<AssetEntity> selectedAssets = [];
  List<File> croppedFiles = [];
  double? progress;

  @override
  void initState() {
    super.initState();
    widget.cropStream.listen((InstaAssetsExportDetails data) {
      setState(() {
        selectedAssets = data.selectedAssets;
        croppedFiles = data.croppedFiles;
        progress = data.progress;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height - kToolbarHeight;

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PickerCaptionScreen(
                      croppedFiles: croppedFiles,
                    ),
                  ),
                );
              },
              child: const Text(
                "Next",
                style: TextStyle(color: Colors.blue, fontSize: 17),
              ),
            ),
          ),
        ],
      ),
      body: CropResultView(
        selectedAssets: selectedAssets,
        croppedFiles: croppedFiles,
        progress: progress,
        heightFiles: height / 2,
        heightAssets: height / 4,
      ),
    );
  }
}

class PickerCaptionScreen extends StatelessWidget {
  const PickerCaptionScreen({super.key, required this.croppedFiles});

  final List<File> croppedFiles;

  @override
  Widget build(BuildContext context) {
    var captionController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Post'),
        actions: [
          TextButton(
            child: const Text(
              "Share",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 15,
              ),
            ),
            onPressed: () async {
              await postImageEvent(croppedFiles, captionController);
              Navigator.popUntil(context, (route) => route.isFirst);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  SizedBox(
                    height: 80,
                    child: Image.file(croppedFiles.first, fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      controller: captionController,
                      maxLength: 2200,
                      maxLines: 100,
                      decoration: const InputDecoration(
                        hintText: 'Write a caption...',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 1,
              thickness: 0.3,
            ),
            ListTile(
              title: const Text(
                'Tag People',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () {
                // Add your logic for tagging people here
              },
            ),
            const Divider(
              height: 1,
              thickness: 0.3,
            ),
            ListTile(
              title: const Text(
                'Add Location',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () {
                // Add your logic for adding location here
              },
            ),
            const Divider(
              height: 1,
              thickness: 0.3,
            ),
            ListTile(
              title: const Text(
                'Add Music',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () {
                // Add your logic for adding photo here
              },
            ),
            const Divider(
              height: 1,
              thickness: 0.3,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> postImageEvent(
      List<File> imagelist, TextEditingController caption) async {
    postImage(imagelist, caption.text);
  }
}

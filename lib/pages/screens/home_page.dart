import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saasapp/widgets/image_previve.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ImagePicker imagepicker;
  String? pickedImagepath;
  bool isImagePicked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagepicker = ImagePicker();
  }

  //Function to pick and image
  void _pickImage({required ImageSource sourse}) async {
    final pickedimage = await imagepicker.pickImage(source: sourse);
    if (pickedimage != null) {
      return;
    }
    setState(() {
      pickedImagepath = pickedimage!.path;
      isImagePicked = true;
    });
  }

  //show bottom sheet

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text("Chose the Image"),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(sourse: ImageSource.gallery);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera),
                title: Text("Take the poto"),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(sourse: ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),

              child: ImagePrevev(iamgepath: pickedImagepath),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,

              children: [
                ElevatedButton(
                  onPressed: _showBottomSheet,
                  child: Text(
                    "pick Image",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),

            if (isImagePicked)
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Process Image",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

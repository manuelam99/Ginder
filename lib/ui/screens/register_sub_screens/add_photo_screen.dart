import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tinder_app_flutter/ui/widgets/rounded_icon_button.dart';
import 'package:tinder_app_flutter/ui/widgets/image_portrait.dart';
import 'package:tinder_app_flutter/util/constants.dart';

class AddPhotoScreen extends StatefulWidget {
  final Function(String) onPhotoChanged;

  AddPhotoScreen({@required this.onPhotoChanged});

  @override
  _AddPhotoScreenState createState() => _AddPhotoScreenState();
}

class _AddPhotoScreenState extends State<AddPhotoScreen> {
  final picker = ImagePicker();
  String _imagePath;

  Future pickImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      widget.onPhotoChanged(pickedFile.path);

      setState(() {
        _imagePath = pickedFile.path;
      });
    }

    Navigator.pop(context);
  }

  Future pickImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      widget.onPhotoChanged(pickedFile.path);

      setState(() {
        _imagePath = pickedFile.path;
      });
    }

    Navigator.pop(context);
  }

  void pickImageSource(){
    showModalBottomSheet(
      context: context, 
      builder: (BuildContext context){
        return Container(
          height: 100,
          color: kColorPrimaryVariant,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: pickImageFromGallery, child: Text("Galería")),
                ElevatedButton(onPressed: pickImageFromCamera, child: Text("Cámara"))
              ],
            ),
          ),
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Foto de perfil',
            style: Theme.of(context).textTheme.headline3,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Stack(
                    children: [
                      Container(
                        child: _imagePath == null
                            ? ImagePortrait(imageType: ImageType.NONE)
                            : ImagePortrait(
                                imagePath: _imagePath,
                                imageType: ImageType.FILE_IMAGE,
                              ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: _imagePath == null
                              ? RoundedIconButton(
                                  onPressed: pickImageSource,
                                  iconData: Icons.add,
                                  iconSize: 20,
                                )
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

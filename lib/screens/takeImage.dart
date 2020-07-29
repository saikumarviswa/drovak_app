import 'dart:io';

//import 'package:drovakapp/screens/addDetails.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'addDetails.dart';


class TakeImage extends StatefulWidget{

  TakeImage({Key key}) : super(key : key);

  _TakeImage createState() => _TakeImage();

}

class _TakeImage extends State<TakeImage>{


  File imageFile;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Add Image"),
      ),
      body: Container(
        decoration: new BoxDecoration(
          image:  new DecorationImage(
            image: new ExactAssetImage('assets/login.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
            decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  colors: <Color>[
                    const Color.fromRGBO(0,0,255,0.5),
                    const Color.fromRGBO(51, 51, 63, 0.9),
                  ],
                  stops: [0.2, 1.0],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(0.0, 1.0),
                ),
            ),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 30,),
                new Container(
                    width: 190.0,
                    height: 190.0,
                    alignment: Alignment.center,
                    decoration: new BoxDecoration(
                      image:new DecorationImage(
                        image: new ExactAssetImage('assets/tick.png'),
                        fit: BoxFit.cover,),
                    )
                ),
                InkWell(
                  onTap: (){
                    _getImage(1);
                  },
                  child: Container(
                      height: 180,
                      width: 180,
                      alignment: Alignment.center,
                      child: Center(child : new Image(image: new ExactAssetImage('assets/camera.png'),)
                      )

                  ),
                ),
                SizedBox(height: 40,),
                InkWell(
                  onTap: (){
                    _getImage(2);
                  },
                  child: Container(
                      height: 180,
                      width: 180,
                      alignment: Alignment.center,
                      child: Center(child : new Image(image: new ExactAssetImage('assets/gallary.png'),)
                      )

                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
  Future _getImage(int type) async {

    var image = await ImagePicker().getImage(
        source: type == 1 ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 50
    );

    File croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
      maxWidth: 600,
      maxHeight: 600,
    );

    /*var compressedFile = await FlutterImageCompress.compressWithFile(
      croppedFile.path,
      croppedFile.path,
      quality: 50,
    );*/

    setState(() {
      imageFile = croppedFile;
      if(imageFile != null) {
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new AddDetails(
                imageFile: imageFile)));
      }else{

      }
    });
  }



}
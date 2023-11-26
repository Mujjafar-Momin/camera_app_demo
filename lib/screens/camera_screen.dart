import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key, required this.camera});
final List<CameraDescription>camera;
  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController controller;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=CameraController(widget.camera[0],ResolutionPreset.max );
    controller.initialize().then((value){
      if(!mounted){
        return;
      }
      setState(() {

      });
    }).catchError((error, stackTrace){
        print("Error $error");
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return CameraPreview(controller);
  }
}

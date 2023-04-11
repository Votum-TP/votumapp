import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:lottie/lottie.dart';
import 'package:votum/providers/CameraProvider.dart';

import 'components/CamaraDetectionPreview.dart';
import 'components/Cameraheader.dart';

List<CameraDescription>? cameras;

class AuthenticationPage extends StatefulWidget {
  //final String CodigoUsuario;
  //final int IdEleccion;

  @override
  State<AuthenticationPage> createState()  => _AuthenticationPageState();

}

class _AuthenticationPageState extends State<AuthenticationPage> {

  late CameraController controller;
  @override
  void initState() {

  }

  @override
  void dispose() {

  }

  _onBackPressed() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Autenticación'),
      ),
      body: FutureBuilder(
        future: initializationCamera(),
        builder: (context,snapshot){
           if(snapshot.connectionState == ConnectionState.done){
             return Stack(
               children: [
                 SizedBox(
                   width: MediaQuery.of(context).size.width,
                   height: MediaQuery.of(context).size.height,
                   child: CameraPreview(controller),
                 ),
                 Center(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Expanded(
                         child: Padding(
                           padding: const EdgeInsets.only(bottom: 100),
                           child: Lottie.asset("Assets/loading.json",
                               width: MediaQuery.of(context).size.width * 0.7),
                         ),
                       ),
                     ],
                   ),
                 )
               ],
             );
           } else {
             return Center(
               child: CircularProgressIndicator(),
             );
           }
        },
      ),
    );

  }

  Future<void> initializationCamera() async {
    var cameras = await availableCameras();
    controller = CameraController(
      cameras[EnumCameraDescription.back.index],
      ResolutionPreset.medium,
      imageFormatGroup:  ImageFormatGroup.yuv420
    );
    await controller.initialize();
  }

}

enum EnumCameraDescription {
  front, back
}
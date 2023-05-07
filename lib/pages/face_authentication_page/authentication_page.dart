import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:votum/providers/CameraProvider.dart';
import 'package:votum/providers/Voto_Provider.dart';
import 'package:votum/utils/alert.dart';

import '../../main.dart';
import 'components/CamaraDetectionPreview.dart';
import 'components/Cameraheader.dart';

List<CameraDescription>? cameras;

class AuthenticationPage extends StatefulWidget {
  final  IdEleccion;

  const AuthenticationPage({super.key, required this.IdEleccion});

  @override
  State<AuthenticationPage> createState()  => _AuthenticationPageState();

}

class _AuthenticationPageState extends State<AuthenticationPage> {

  late File imageFile;
  late CameraController controller;
  VotoProvider votoProvider = new VotoProvider();
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
        title: Text(
          "Autenticación Facial",
          style: GoogleFonts.poppins(
              fontSize: 19.0,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),

      ),
      body: FutureBuilder(
        future: initializationCamera(),
        builder: (context,snapshot){
           if(snapshot.connectionState == ConnectionState.done){
             return Stack(
               alignment: Alignment.bottomCenter,
               children: [
                 SizedBox(
                   width: MediaQuery.of(context).size.width,
                   height: MediaQuery.of(context).size.height,
                   child: CameraPreview(controller),
                 ),
                 Center(
                   child: Column(
                     children: [
                       Expanded(
                         child: Padding(
                           padding: const EdgeInsets.only(bottom: 100),
                           child: Lottie.asset("Assets/loading.json",
                               width: MediaQuery.of(context).size.width * 0.7),
                         ),
                         
                       ),
                       InkWell(
                         onTap: () => onTakePicture(),
                         child: Padding(
                           padding: const EdgeInsets.symmetric(vertical: 20.0),
                           child: CircleAvatar(
                             radius: 30.0,
                             backgroundColor: Colors.white,
                           ),
                         ),
                       ),


                     ],
                   ),

                 ),

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

  onTakePicture() async {
    await controller.takePicture().then((XFile xfile){
      if(mounted) {
        if(xfile != null){
          showDialog(context: context, builder: (context)=> AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Pad.padding),
            ),
            title: Center(child: Text('Rostro detectado'),),
            content: SizedBox(
              width: 300.0,
              height: 250.0,
              child: CircleAvatar(
                radius: 80,
                backgroundImage: Image.file(File(xfile.path)).image,
              ),
            ),
            actions: <Widget>[
              Wrap(
                direction: Axis.horizontal,
                spacing: 100, // <-- Spacing between children
                children: <Widget>[
                  TextButton(
                    child: Text('NO'),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  TextButton(
                    child: Text('YES'),
                    onPressed: () {
                      votoProvider.autenticarVoto(localStorage.get('codigo').toString(), widget.IdEleccion, imageFile, context);

                    },
                  )
                ],
              )
            ],
          ));
          imageFile = File(xfile.path);
        }
      }
      });

  }

}

enum EnumCameraDescription {
  front, back
}
class Pad{
  Pad._();
  static const double padding =20;
  static const double avatarRadius =45;
}

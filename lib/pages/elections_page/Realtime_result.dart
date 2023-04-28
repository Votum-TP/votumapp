import 'package:flutter/material.dart';
import 'package:votum/model/Eleccion.dart';

class RealtimeResult extends StatefulWidget {
  @override
  _RealtimeResultState createState() =>  _RealtimeResultState();
  
}

class _RealtimeResultState extends State<RealtimeResult>{

  Eleccion election = new Eleccion();

  int totalVotosContados(){
    int totalcount =  0;
    /*for(var participantes in election.participantes) {
      totalcount += participantes['id'];
    }*/
    return totalcount;
  }
  double Porcentaje(int totalVotos, int participantesVotos){
    return (participantesVotos/totalVotos) * 100;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
}
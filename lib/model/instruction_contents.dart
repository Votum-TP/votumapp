class InstructionContent {
  String? image;
  String? text;

  InstructionContent({this.image, this.text});
}

List<InstructionContent> contents = [
  InstructionContent(
      image: 'Assets/images/instruccion1.png',
      text: 'You will need to verify your vote with your'
          ' fingerprint and PIN. Impersonation is an offence.'),

  InstructionContent(
      image: 'Assets/images/instruccion2.png',
      text: 'Deberá verificar su voto con su'
          ' rostro o con una clave dinámica'),
  InstructionContent(
      image: 'Assets/images/instruccion3.png',
      text: 'Sus intenciones de voto y decisiones, '
          'debe mantenerse en secreto tanto antes como después de la elección. '),
];
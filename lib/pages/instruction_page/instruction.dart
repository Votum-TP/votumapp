import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:votum/pages/elections_page/election_poll.dart';

import '../../model/instruction_contents.dart';
import 'component/primary_button.dart';

class InstructionScreen extends StatefulWidget {
  String electionId;

  InstructionScreen({
    required this.electionId,
  });

  @override
  State<InstructionScreen> createState() => _InstructionScreenState();
}

class _InstructionScreenState extends State<InstructionScreen> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        Container(
                          child: Image.asset(
                            contents[i].image!,
                            fit: BoxFit.cover,
                          ),
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.4,
                        ),
                        SizedBox(height: 19),
                        Text(
                          contents[i].text!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  contents.length,
                      (index) => buildDot(index, context),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: PrimaryButton(
                text: currentIndex == contents.length - 1
                    ? 'Ingresar'
                    : 'Continuar',

                onPress: () {
                  if (currentIndex == contents.length - 1) {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ElectionPoll(userId: 1, electionId: int.parse(widget.electionId),)));
                  }
                  _controller!.nextPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.bounceIn,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 35 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? Color(0xff3F468F
        ) : Color(0xFFD9D9D9),
      ),
    );
  }
}
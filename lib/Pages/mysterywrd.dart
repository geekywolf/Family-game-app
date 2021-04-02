import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MysteryWord extends StatefulWidget {
  @override
  _MysteryWordState createState() => _MysteryWordState();
}

class _MysteryWordState extends State<MysteryWord> {
  int randomNumberGenerator() {
    Random random = new Random();
    // ignore: unused_local_variable
    int randomNumberbuilder;
    return randomNumberbuilder = random.nextInt(68);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int randomNumber = randomNumberGenerator();
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                scale: 0.8,
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Center(
              child: Text(
                'Mystery Word',
                style: GoogleFonts.sansita(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.info_outline,
                  color: Colors.white,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Center(
                            child: Text(
                              "How To Play",
                              style: GoogleFonts.sansita(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          content: Text(
                            "Ask your friends to give you clues, dance, sing, do mimes and you should try to guess what the word or phrase is! Just guess the word from your friends' clues before the timer runs out! Challenge your friends to play!",
                            style: GoogleFonts.ebGaramond(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        );
                      });
                },
              )
            ],
            backgroundColor: Color.fromRGBO(15, 3, 58, 1),
          ),
          body: Center(
            child: FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('assets/json/DB.json'),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                var newData = json.decode(snapshot.data.toString());

                return ListView.builder(
                  // Build the ListView
                  itemCount: newData == null ? 0 : 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(top: size.height * 0.33),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: size.width * 0.95,
                            height: size.height * 0.11,
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                newData['charades'][randomNumber].toUpperCase(),
                                style: GoogleFonts.ebGaramond(
                                  color: Colors.black,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.2,
                          ),
                          MaterialButton(
                            minWidth: size.width * 0.9,
                            height: size.height * 0.08,
                            onPressed: () {
                              setState(() {
                                randomNumber = randomNumberGenerator();
                              });
                            },
                            color: Color.fromRGBO(0, 59, 54, 1),
                            child: Text(
                              "NEXT",
                              style: GoogleFonts.sansita(
                                fontSize: 40,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

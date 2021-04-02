import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KissMaryKill extends StatefulWidget {
  @override
  _KissMaryKillState createState() => _KissMaryKillState();
}

class _KissMaryKillState extends State<KissMaryKill> {
  int randomNumberGenerator() {
    Random random = new Random();
    // ignore: unused_local_variable
    int randomNumberbuilder;
    return randomNumberbuilder = random.nextInt(109);
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
                color: Color.fromRGBO(255, 255, 130, 1),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Center(
              child: Text(
                'Kiss Marry Kill',
                style: GoogleFonts.sansita(
                  color: Color.fromRGBO(255, 255, 130, 1),
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.info_outline,
                  color: Color.fromRGBO(255, 255, 130, 1),
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
                            "Kiss Marry Kill is a question and answer game. One source describes it as a game in which people fantasize about which of the three choices they would exercise on someone. In the game, one person poses three names of people known to the other, typically either names of people known in their personal lives, or names of celebrities. The other person then has to decide which of the three they would kiss (or have sexual intercourse with), which one they would marry, and which one they would kill.",
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
            backgroundColor: Color.fromRGBO(0, 59, 54, 1),
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
                            height: size.height * 0.13,
                            color: Colors.white,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  newData['KissMarryKill'][randomNumber],
                                  style: GoogleFonts.ebGaramond(
                                    color: Colors.black,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                            color: Color.fromRGBO(255, 255, 130, 1),
                            child: Text(
                              "NEXT",
                              style: GoogleFonts.sansita(
                                fontSize: 40,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
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

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:convert';
import 'dart:math';

class Charades extends StatefulWidget {
  @override
  _CharadesState createState() => _CharadesState();
}

class _CharadesState extends State<Charades> {
  int randomNumberGenerator() {
    Random random = new Random();
    // ignore: unused_local_variable
    int randomNumberbuilder;
    return randomNumberbuilder = random.nextInt(67);
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
                color: Color.fromRGBO(208, 0, 0, 1),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Center(
              child: Text(
                'Charades',
                style: GoogleFonts.sansita(
                  color: Color.fromRGBO(208, 0, 0, 1),
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.info_outline,
                  color: Color.fromRGBO(208, 0, 0, 1),
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
                            "Charades is a game of pantomimes: you have to act out a phrase or word without speaking, your team members try to guess what the phrase is. Your team members must guess the phrase as quickly as possible before time runs out.",
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
            backgroundColor: Color.fromRGBO(255, 255, 130, 1),
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
                            width: size.width * 0.9,
                            height: size.height * 0.08,
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                newData['charades'][randomNumber].toUpperCase(),
                                style: GoogleFonts.ebGaramond(
                                  color: Colors.black,
                                  fontSize: 35,
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
                            color: Color.fromRGBO(208, 0, 0, 1),
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

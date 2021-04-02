import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:convert';
import 'dart:math';

class Riddles extends StatefulWidget {
  @override
  _RiddlesState createState() => _RiddlesState();
}

class _RiddlesState extends State<Riddles> {
  int randomNumberGenerator() {
    Random random = new Random();
    // ignore: unused_local_variable
    int randomNumberbuilder;
    return randomNumberbuilder = random.nextInt(36);
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
                color: Color.fromRGBO(33, 5, 87, 1),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Center(
              child: Text(
                'Riddles',
                style: GoogleFonts.sansita(
                  color: Color.fromRGBO(33, 5, 87, 1),
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.info_outline,
                  color: Color.fromRGBO(33, 5, 87, 1),
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
                            " Come on you should know how to answer riddles. Click on View answer if you need any help",
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
                bool _obscuretext = true;

                return ListView.builder(
                  // Build the ListView
                  itemCount: newData == null ? 0 : 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(top: size.height * 0.13),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: size.width * 0.95,
                            height: size.height * 0.36,
                            color: Colors.white,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                child: Text(
                                  "Question: " +
                                      newData['RiddleQuestion'][randomNumber],
                                  style: GoogleFonts.ebGaramond(
                                    color: Colors.black,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: size.width * 0.6,
                                height: size.height * 0.09,
                                color: _obscuretext
                                    ? Color.fromRGBO(255, 255, 130, 1)
                                    : Colors.white,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      "Answer: " +
                                          newData['RiddleAnswer'][randomNumber],
                                      style: GoogleFonts.ebGaramond(
                                        color: Colors.black,
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              MaterialButton(
                                minWidth: size.width * 0.1,
                                height: size.height * 0.09,
                                onPressed: () {
                                  if (_obscuretext = true) {
                                    setState(() {
                                      _obscuretext = false;
                                    });
                                  }
                                  if (_obscuretext = false) {
                                    setState(() {
                                      _obscuretext = true;
                                    });
                                  }
                                },
                                color: Color.fromRGBO(255, 255, 130, 1),
                                child: Text(
                                  _obscuretext ? "View Answer" : "Hide Answer",
                                  style: TextStyle(
                                    color: Color.fromRGBO(33, 5, 87, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.08,
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
                                color: Color.fromRGBO(33, 5, 87, 1),
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

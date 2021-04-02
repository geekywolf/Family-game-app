import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Gamedata {
  const Gamedata({this.name, this.color, this.accent, this.subcolor});

  final String name;
  final color;
  final accent;
  final subcolor;
}

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Gamedata> datalist = [
    Gamedata(
        name: "Charades",
        color: Color.fromRGBO(255, 255, 130, 0),
        accent: Color.fromRGBO(208, 0, 0, 1),
        subcolor: Color.fromRGBO(208, 0, 0, 1)),
    Gamedata(
        name: "Kiss,Marry,Kill",
        color: Color.fromRGBO(0, 59, 54, 0),
        accent: Colors.black,
        subcolor: Color.fromRGBO(255, 255, 130, 1)),
    Gamedata(
        name: "Mystery Word",
        color: Color.fromRGBO(15, 3, 58, 0),
        accent: Color.fromRGBO(0, 59, 54, 1),
        subcolor: Color.fromRGBO(0, 59, 54, 1)),
    Gamedata(
        name: "Never Have I Ever",
        color: Color.fromRGBO(245, 138, 7, 0),
        accent: Color.fromRGBO(33, 5, 87, 1),
        subcolor: Color.fromRGBO(33, 5, 87, 1)),
    Gamedata(
        name: "Riddles",
        color: Color.fromRGBO(255, 255, 130, 0),
        accent: Color.fromRGBO(33, 5, 87, 1),
        subcolor: Color.fromRGBO(33, 5, 87, 1)),
    Gamedata(
      name: "Truth or Dare",
      color: Color.fromRGBO(208, 0, 0, 0),
      accent: Color.fromRGBO(33, 5, 87, 1),
      subcolor: Color.fromRGBO(245, 138, 7, 1),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/joystick.jpg"),
                scale: 0.8,
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Center(
                child: Text(
              'Games',
              style: GoogleFonts.sansita(
                color: Colors.white,
                fontSize: 27,
                fontWeight: FontWeight.w700,
              ),
            )),
            backgroundColor: Color.fromRGBO(245, 138, 7, 1),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: Text(
                  "Pick Your Poison.",
                  style: GoogleFonts.sansita(
                    color: Color.fromRGBO(33, 5, 87, 1),
                    fontSize: 27,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                height: size.height * 0.75,
                child: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  scrollDirection: Axis.horizontal,
                  itemCount: datalist.length,
                  itemBuilder: (context, index) {
                    return Material(
                      child: InkWell(
                        splashColor: datalist[index].accent,
                        borderRadius: BorderRadius.circular(37.0),
                        onTap: () {
                          Navigator.pushNamed(context, datalist[index].name);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(37.0),
                            boxShadow: [
                              BoxShadow(
                                color: datalist[index].color.withOpacity(0.9),
                                spreadRadius: 2,
                                blurRadius: 1,
                                offset:
                                    Offset(2, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          height: size.height * 0.48,
                          width: size.width * 0.8,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 120, top: 350),
                            child: Column(
                              children: [
                                Container(
                                  height: size.height * 0.05,
                                  width: size.width * 0.5,
                                  decoration: BoxDecoration(
                                    color: datalist[index].subcolor,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(7.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(7.0),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      datalist[index].name,
                                      style: GoogleFonts.ebGaramond(
                                        color: Colors.grey[200],
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

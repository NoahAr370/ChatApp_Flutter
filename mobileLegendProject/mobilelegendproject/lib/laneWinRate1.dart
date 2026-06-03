import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mobilelegendproject/provider/themeProvider.dart';
import 'package:provider/provider.dart';

class Lanewinrate1 extends StatefulWidget {
  const Lanewinrate1({super.key});

  @override
  State<Lanewinrate1> createState() => _LanewinrateState();
}

class _LanewinrateState extends State<Lanewinrate1> {
  final gradientcolor = [
    Color(0xff8f00ff), // violet
    Colors.indigo,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.red,
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pVider = Provider.of<Themeprovider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 247, 247, 247),
        //backgroundColor: Colors.blueGrey[50],
        leading: Image.asset("assets/images/sqlogo.jpg"),
        title: Text(
          "WAR ROOM",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [
          PopupMenuButton<String>(
              icon: Icon(
                Icons.more_vert,
                color: pVider.isDark ? Colors.purple : Colors.black,
              ),
              itemBuilder: (context) => [
                    PopupMenuItem(
                        onTap: () => pVider.lightmode(),
                        value: "theme",
                        child: ListTile(
                          leading: Icon(
                            Icons.light_mode_sharp,
                            color: pVider.isDark
                                ? Colors.deepPurpleAccent
                                : Colors.amber,
                          ),
                          title: Text("Light Mode"),
                        )),
                    PopupMenuItem(
                        onTap: () => pVider.nightmode(),
                        child: ListTile(
                          leading: Icon(
                            Icons.nightlight_sharp,
                            color: pVider.isDark
                                ? Colors.deepPurpleAccent
                                : Colors.amber,
                          ),
                          title: Text("Dark Mode"),
                        ))
                  ])
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  "META ANALYTICS",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.lightBlue),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  "SEASON RANKINGS",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              _gsProfile(),
              _Edith(),
              _Lane(),
              ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.all(10),
                children: [
                  laneCard(
                      image: "assets/images/mm.jpg",
                      number: "1",
                      hero: "BEATRIX",
                      winrate: "58.9%",
                      c1: "Marksman",
                      c2: "LateGame"),
                  laneCard(
                      image: "assets/images/mage.jpg",
                      number: "2",
                      hero: "BRODY",
                      winrate: "55.2%",
                      c1: "Marksman",
                      c2: "Burst DAG"),
                  laneCard(
                      image: "assets/images/fg.jpg",
                      number: "3",
                      hero: "BEATRIX",
                      winrate: "54.8%",
                      c1: "Marksman",
                      c2: "ANTI-DMG"),
                ],
              ),
              _MetaShift(),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          backgroundColor: Provider.of<Themeprovider>(context).isDark
              ? Color.fromARGB(255, 147, 131, 37)
              : Color(0xFFB0BEC5),
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.black,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
            switch (index) {
              case 0:
                context.go('/home');
                break;
              case 1:
                context.go('/explore');
                break;
              case 2:
                context.go('/ranking');
                break;
              case 3:
                context.go('/profile');
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.explore,
              ),
              label: "Explore",
            ),
            BottomNavigationBarItem(
              //icon: Icon(Icons.workspace_premium),
              //icon: Icon(Icons.emoji_events),
              icon: Icon(Icons.military_tech),
              label: "Ranking",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            )
          ]),
    );
  }

  _gsProfile() {
    return Container(
      margin: EdgeInsets.all(25),
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              //image: AssetImage("assets/images/gusion1.jpg"),
              image: AssetImage("assets/images/gs1.jpg"),
              fit: BoxFit.cover)),
      child: Stack(
        children: [
          Positioned(
            bottom: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      // width: 150,
                      // height: 30,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "MOST PLAYED",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 17,
                    ),
                    Icon(
                      Icons.star,
                      color: Color(0XFFFFD700),
                    ),
                    Text(
                      "S-TIER",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.amberAccent,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Text(
                  "GUSION",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Row(
                  children: [
                    Text(
                      "WIN RATE",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "MATCHES",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "BAN RATE",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "64.2%",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "1,240",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "42.5%",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _Edith() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [
            Colors.deepPurple,
            // const Color.fromARGB(255, 42, 72, 86)
            const Color.fromARGB(255, 210, 190, 129)
          ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.trending_up,
                color: Colors.amber,
                size: 35,
              ),
              Text(
                "RISINGSTAR",
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 17),
              )
            ],
          ),
          Text(
            "EDITH",
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
          ),
          RichText(
              text: const TextSpan(
                  style:
                      TextStyle(color: Colors.white, fontSize: 16, height: 1.5),
                  children: [
                TextSpan(text: "Win rate increased by "),
                TextSpan(
                    text: "+5.2%",
                    style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                  text: ' following recent\npatch adjustments.',
                ),
              ])),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                  shadowColor: Colors.black,
                  foregroundColor: Colors.black,
                  backgroundColor: Color(0xFF7E57C2)),
              onPressed: () {},
              child: Center(
                  child: Text(
                "VIEW BUILD",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.white),
              )))
        ],
      ),
    );
  }

  _Lane() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(15)),
                  foregroundColor: Colors.black,
                  shadowColor: Provider.of<Themeprovider>(context).isDark
                      ? Colors.white
                      : Colors.purple,
                  backgroundColor: const Color.fromARGB(255, 0, 2, 2)),
              onPressed: () {},
              child: Text(
                "GOLD LANE",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(15)),
                  foregroundColor: Colors.black,
                  shadowColor: Provider.of<Themeprovider>(context).isDark
                      ? Colors.white
                      : Colors.purple,
                  backgroundColor: const Color.fromARGB(255, 0, 2, 2)),
              onPressed: () {},
              child: Text(
                "MID LANE",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(15)),
                  foregroundColor: Colors.black,
                  shadowColor: Provider.of<Themeprovider>(context).isDark
                      ? Colors.white
                      : Colors.purple,
                  backgroundColor: Colors.black),
              onPressed: () {},
              child: Text(
                "EXP LANE",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  _MetaShift() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          gradient: LinearGradient(colors: [
            Colors.deepPurple,
            // const Color.fromARGB(255, 42, 72, 86)
            const Color.fromARGB(255, 210, 190, 129)
          ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "CURRENT META SHIFT",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Assassins are dominating the current jungle meta due to imcreased gold efficiency in the first 5 minutes.Consider banning JOY or NOlAN in high Mythic lobbies",
              style: GoogleFonts.gideonRoman(fontSize: 20, color: Colors.white),
              textAlign: TextAlign.justify,
            ),
          ),
          Row(
            children: [
              Container(
                width: 70,
                height: 60,
                margin: EdgeInsets.fromLTRB(18, 15, 0, 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(colors: [
                    const Color.fromARGB(255, 186, 197, 68),
                    Colors.deepPurple,
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      Text(
                        "TANK",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: Colors.cyan, fontSize: 17),
                      ),
                      Text("DECREASED",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.white, fontSize: 7))
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 35,
              ),
              Container(
                width: 70,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(colors: [
                    const Color.fromARGB(255, 186, 197, 68),
                    Colors.deepPurple,
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      Text(
                        "MAGE",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: Colors.cyan, fontSize: 17),
                      ),
                      Text("STABLE",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.white, fontSize: 8))
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 35,
              ),
              Container(
                width: 70,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(colors: [
                    const Color.fromARGB(255, 186, 197, 68),
                    Colors.deepPurple,
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      Text(
                        "ASS",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: Colors.cyan, fontSize: 17),
                      ),
                      Text("TRENDING",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.white, fontSize: 8))
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget laneCard({
    required String image,
    required String hero,
    required String winrate,
    required String c1,
    required String c2,
    required String number,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      padding: EdgeInsets.fromLTRB(0, 0, 12, 10),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.deepPurple,
            const Color.fromARGB(255, 42, 72, 86)

            // const Color.fromARGB(255, 210, 190, 129)
          ]),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(7),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    bottom: -12,
                    right: -14,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.black87),
                      child: Center(
                          child: Text(
                        number,
                        style: TextStyle(color: Colors.white),
                      )),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "BEATRIX",
                  style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 25,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blueGrey),
                      child: Center(
                        child: Text(
                          c1,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 9.5,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 70,
                      height: 25,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blueGrey),
                      child: Center(
                        child: Text(
                          c2,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 9.5,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "WIN RATE",
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  winrate,
                  style: GoogleFonts.poppins(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

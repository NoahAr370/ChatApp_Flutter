import 'package:flutter/material.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'package:mobilelegendproject/provider/theme.dart';
import 'package:mobilelegendproject/provider/themeProvider.dart';
import 'package:provider/provider.dart';

class Lanewinrate extends StatefulWidget {
  const Lanewinrate({super.key});

  @override
  State<Lanewinrate> createState() => _LanewinrateState();
}

class _LanewinrateState extends State<Lanewinrate> {
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
  final List<Widget> pages = [
    Center(
      child: Text(
        "Home",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
      ),
    ),
    Center(
      child: Text("Explore",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
    ),
    Center(
      child: Text("Ranking",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
    ),
    Center(
      child: Text("profile",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
    )
  ];
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
              ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                //physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                children: [
                  laneCard(
                    title: "GOLD\nLANE",
                    subtitle: "SIGNATURE",
                    subhero: ":BEATRIX",
                    hero: "BEATRIX",
                    winRate: "58.9%",
                    image: "assets/images/mm.jpg",
                  ),
                  laneCard(
                    title: "MID\nLANE",
                    subtitle: "SIGNATURE",
                    subhero: ":YVE",
                    hero: "VALENTINA",
                    winRate: "54.5%",
                    image: "assets/images/mage.jpg",
                  ),
                  laneCard(
                    title: "EXP\nLANE",
                    subtitle: "SIGNATURE",
                    subhero: ":YU ZHONE",
                    hero: "TERIZLA",
                    winRate: "53.1%",
                    image: "assets/images/fg.jpg",
                  ),
                  laneCard(
                    title: "JUNGLE\nLANE",
                    subtitle: "SIGNATURE",
                    subhero: ":LANCELOT",
                    hero: "NOLAN",
                    winRate: "61.2%",
                    image: "assets/images/nolan1.jpg",
                  ),
                  laneCard(
                    title: "ROAM\nLANE",
                    subtitle: "SIGNATURE",
                    subhero: ":KHUFRA",
                    hero: "MINOTAUR",
                    winRate: "53.1%",
                    image: "assets/images/tank.jpg",
                  ),
                ],
              ),
              _MetaShift(),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                    width: 170,
                    height: 50,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              const Color.fromARGB(255, 186, 197, 68),
                              Colors.deepPurple,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        borderRadius: BorderRadius.circular(16)),
                    child: ElevatedButton(
                      onPressed: () {
                        if (currentIndex == 3) {
                          context.go("/profile");
                          setState(() {});
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          iconColor: Colors.white,
                          backgroundColor: Colors.transparent),
                      child: Center(child: pages[currentIndex]),
                    )),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          backgroundColor: Colors.lightGreen,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.black,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: pVider.isDark
                    ? Color.fromARGB(255, 147, 131, 37)
                    : Color(0xFFB0BEC5)),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.explore,
                ),
                label: "Explore",
                backgroundColor: pVider.isDark
                    ? Color.fromARGB(255, 147, 131, 37)
                    : Color(0XFFB0BEC5)),
            BottomNavigationBarItem(
                //icon: Icon(Icons.workspace_premium),
                //icon: Icon(Icons.emoji_events),
                icon: Icon(Icons.military_tech),
                label: "Ranking",
                backgroundColor: pVider.isDark
                    ? Color.fromARGB(255, 147, 131, 37)
                    : Color(0XFFB0BEC5)),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
                backgroundColor: pVider.isDark
                    ? Color.fromARGB(255, 147, 131, 37)
                    : Color(0XFFB0BEC5))
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
                GradientAnimationText(
                    text: Text(
                      "GUSION",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    colors: gradientcolor,
                    duration: Duration(seconds: 1)),
                // Text(
                //   "GUSION",
                //   style: Theme.of(context).textTheme.titleLarge?.copyWith(
                //       fontSize: 50,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.white),
                // ),
                Row(
                  children: [
                    Text(
                      "WIN RATE",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 14,
                          color: Colors.limeAccent,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "MATCHES",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 14,
                          color: Colors.limeAccent,
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
                          color: Colors.limeAccent),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "64.2%",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 28,
                          color: Color(0XFFFFD700),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "1,240",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 28,
                          color: Color(0XFFFFD700),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "42.5%",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 28,
                          color: Color(0XFFFFD700),
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
            const Color.fromARGB(255, 227, 192, 90)
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
}

Widget laneCard({
  required String title,
  required String subtitle,
  required String subhero,
  required String hero,
  required String winRate,
  required String image,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    height: 120,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        //color: Colors.grey[900],
        gradient: LinearGradient(colors: [
          const Color.fromARGB(255, 96, 66, 147),
          const Color.fromARGB(255, 242, 181, 0)
        ])),
    child: Row(
      children: [
        /// LEFT SIDE

        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 8,
                      ),
                    ),
                    Text(
                      subhero,
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),

        /// RIGHT SIDE (Image + Gradient + Text)
        Expanded(
          flex: 6,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            child: Stack(
              children: [
                /// Image
                Positioned.fill(
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),

                /// Gradient overlay
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          // ignore: deprecated_member_use
                          Colors.black.withOpacity(0.8),
                          Colors.transparent,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                ),

                /// Text
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "TOP PICK",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        hero,
                        style: const TextStyle(
                          color: Colors.lightBlueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "WIN RATE $winRate",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

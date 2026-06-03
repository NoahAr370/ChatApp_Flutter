import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobilelegendproject/provider/themeProvider.dart';
import 'package:provider/provider.dart';

class Activepage extends StatefulWidget {
  const Activepage({super.key});

  @override
  State<Activepage> createState() => _ActivepageState();
}

class _ActivepageState extends State<Activepage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final pVider = Provider.of<Themeprovider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 247, 247, 247),
        leading: Image.asset("assets/images/sqlogo.jpg"),
        title: Text(
          "WAR ROOM",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold, color: Colors.purple, fontSize: 20),
        ),
        actions: [
          Icon(
            Icons.notifications,
            color: Colors.deepPurple,
          ),
          SizedBox(
            width: 20,
          ),
          PopupMenuButton<String>(
              icon: Icon(
                Icons.settings,
                color: pVider.isDark ? Colors.deepPurpleAccent : Colors.black,
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _RecruitContainer(),
              _ActivePings(),
              _Data1(),
              _Data2(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "TACTICAL COMMS",
                      style: GoogleFonts.poppins(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              commenttextContainer(),
              _TopPerformersContainer(),
              _WinRateContainer(),
              SizedBox(
                height: 30,
              ),
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

  _RecruitContainer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: EdgeInsets.fromLTRB(17, 15, 17, 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          gradient: Provider.of<Themeprovider>(context).isDark
              ? LinearGradient(colors: [Color(0xFFC8A96E), Color(0xFF111111)])
              : LinearGradient(
                  colors: [Color(0xFF3D4A5C), Color(0xFFE8D5A3)],
                  //colors: [Color(0xFF4A3548), Color(0xFFE8DCC8)]
                )),
      child: Column(
        children: [
          Text(
            "RECRUIT SQUAD MATES",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
          Text(
            "Launch a tactical ping to your squad.Define your lane and find the perfect synergy for Rank Push.",
            style: GoogleFonts.aBeeZee(fontSize: 15.5, color: Colors.white),
            textAlign: TextAlign.justify,
          ),
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(),
              onPressed: () {},
              icon: Icon(
                Icons.rocket_launch,
                size: 23,
              ),
              label: Text(
                "GATHER PLAYERS",
                style: TextStyle(fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }

  _ActivePings() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("ACTIVE PINGS",
              style: GoogleFonts.gabarito(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Provider.of<Themeprovider>(context).isDark
                      ? Color(0xFF4A3548)
                      : Colors.grey[500]),
              onPressed: () {},
              child: Text(
                "3ONLINE",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }

  _Data1() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 15, 10, 20),
      margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          gradient: Provider.of<Themeprovider>(context).isDark
              ? LinearGradient(colors: [Color(0xFFC8A96E), Color(0xFF111111)])
              : LinearGradient(
                  colors: [Color(0xFF3D4A5C), Color(0xFFE8D5A3)],
                  //colors: [Color(0xFF4A3548), Color(0xFFE8DCC8)]
                )),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10),
                  child: Image.asset(
                    "assets/images/roamlogo.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tank/Roam Needed",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "BY SKY_DRAGON . 2M AGO",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 160, 133, 25),
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  "URGENT",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                height: 40,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(30),
                          child: Image.asset(
                            "assets/images/fg.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(30),
                          child: Image.asset(
                            "assets/images/gs.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 40,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(40)),
                        child: Center(
                          child: Text(
                            "+2",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 132, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(20),
                  ),
                  backgroundColor: Colors.blueGrey),
              onPressed: () {},
              child: Text(
                "JOIN LOBBY",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }

  _Data2() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 15, 10, 20),
      margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          gradient: Provider.of<Themeprovider>(context).isDark
              ? LinearGradient(colors: [Color(0xFFC8A96E), Color(0xFF111111)])
              : LinearGradient(
                  colors: [Color(0xFF3D4A5C), Color(0xFFE8D5A3)],
                  //colors: [Color(0xFF4A3548), Color(0xFFE8DCC8)]
                )),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10),
                  child: Image.asset(
                    "assets/images/junglelogo.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Classic Chill",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "BY MOONCHLD . 15M AGO",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                height: 40,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(30),
                          child: Image.asset(
                            "assets/images/fg.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(30),
                          child: Image.asset(
                            "assets/images/gs.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 40,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(40)),
                        child: Center(
                          child: Text(
                            "+2",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 118, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(20),
                  ),
                  backgroundColor: Colors.blueGrey),
              onPressed: () {},
              child: Text(
                "REQUEST INVITE",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }

  commenttextContainer() {
    return Center(
      child: Container(
        width: 376,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //     // colors: [Color(0xFF3D4A5C), Color(0xFFE8D5A3)],
          //     colors: [Color(0xFF4A3548), Color(0xFFE8DCC8)]),

          gradient: Provider.of<Themeprovider>(context).isDark
              ? LinearGradient(colors: [Color(0xFFC8A96E), Color(0xFF111111)])
              //colors: [Color(0xFF3D4A5C), Color(0xFFE8D5A3)],
              //colors: [Color(0xFF4A3548), Color(0xFFE8DCC8)])
              : LinearGradient(colors: [Color(0xff1A1C2E), Color(0xff1A1C2E)]),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Message 1
            _chatTile(
              image:
                  "https://i.pinimg.com/1200x/64/fa/08/64fa08e3966f423c730748da99f82830.jpg",
              name: "Sky_Dragon",
              time: "09:42 PM",
              message:
                  "Can anyone play mid? Our last game Ling was too aggressive.",
              nameColor: Colors.blueGrey,
            ),

            const SizedBox(height: 20),

            /// Message 2
            _chatTile(
              image:
                  "https://i.pinimg.com/736x/ff/85/85/ff85851ab789b4b5a2528731d903c525.jpg",
              name: "Valkyrie_X",
              time: "09:43 PM",
              message: "I got mid. Pharsa or Yve?",
              nameColor: Colors.amber,
            ),

            const SizedBox(height: 20),

            Text(
              "SQUAD PING • 'RANK PUSH IN 5 MINS' SENT",
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 11,
              ),
            ),

            const SizedBox(height: 20),

            /// Your Message
            Align(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "09:45 PM   You",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 220,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xff6C63FF),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Text(
                      "Go for Pharsa. We need more high ground defense.",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            /// Input Box
            Container(
              height: 55,
              decoration: BoxDecoration(
                color: const Color(0xff2A2C3D),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 15),
                  const Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Type tactical message...",
                        hintStyle: TextStyle(
                          color: Colors.white54,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                      color: Color(0xffB6A7FF),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  _TopPerformersContainer() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 12, 10, 20),
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        gradient: Provider.of<Themeprovider>(context).isDark
            ? LinearGradient(colors: [Color(0xFFC8A96E), Color(0xFF111111)])
            : LinearGradient(
                colors: [Color(0xFF3D4A5C), Color(0xFFE8D5A3)],
                //colors: [Color(0xFF4A3548), Color(0xFFE8DCC8)]
              ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            "TOP PERFORMERS",
            style: GoogleFonts.poppins(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "01   Sky_Dragon",
                style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                "MVP 14x",
                style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
          SizedBox(
            height: 11,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "02   Valkyrie_X",
                style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                "MVP 9x",
                style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  _WinRateContainer() {
    return Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 25),
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: Provider.of<Themeprovider>(context).isDark
                ? LinearGradient(colors: [Color(0xFFC8A96E), Color(0xFF111111)])
                : LinearGradient(
                    colors: [Color(0xFF3D4A5C), Color(0xFFE8D5A3)],
                    //colors: [Color(0xFF4A3548), Color(0xFFE8DCC8)]
                  )),
        child: Column(
          children: [
            Text(
              "RECENT SQUAD WINRATE",
              style: GoogleFonts.poppins(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 11,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "DOMINATING",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  "78%",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: 0.78, // 78%
                minHeight: 10,
                backgroundColor: Colors.grey.shade800,
                valueColor: const AlwaysStoppedAnimation(Colors.white
                    //Color(0xFF9DD6FF),
                    ),
              ),
            )
          ],
        ));
  }

  Widget _chatTile({
    required String image,
    required String name,
    required String time,
    required String message,
    required Color nameColor,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 22,
          backgroundImage: NetworkImage(image),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: nameColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    time,
                    style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

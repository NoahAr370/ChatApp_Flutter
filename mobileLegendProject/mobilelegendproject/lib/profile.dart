import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobilelegendproject/provider/themeProvider.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final List<String> images = [
    "assets/images/ml1.jpg",
    "assets/images/ml2.jpg",
    "assets/images/ml3.jpg",
    "assets/images/ml4.jpg",
    "assets/images/ml6.jpg",
  ];
  late File file;
  bool isFile = false;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pVider = Provider.of<Themeprovider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 247, 247, 247),
        leading: Image.asset(
          "assets/images/sqlogo.jpg",
        ),
        title: Text(
          "WAR ROOM",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
              ),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            _profileData(),
            _Comingsoon(),
            _text(),
            SizedBox(
              height: 10,
            ),
            _makeMlCarouselSlide(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "ACCOUNT STATISTICS",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 380,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                // border: Border.all(
                //     color: Provider.of<Themeprovider>(context).isDark
                //         ? Colors.white
                //         : Colors.black,
                //     width: 2),
                color: Colors.grey[500],
              ),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  makeListinformation(
                      text1: "fighter",
                      text2:
                          "A Fighter is a balanced hero with both damage and durability. Fighters usually fight at close range and can survive longer than most damage dealers. They are commonly played in the EXP Lane and are strong in 1v1 battles and team fights.",
                      image: "assets/images/me1.jpg"),
                  makeListinformation(
                      text1: "Mage",
                      text2:
                          "A Mage is a hero that uses magic skills to deal burst damage and crowd control. Mages usually play in the Mid Lane because they can quickly rotate to help teammates.",
                      image: "assets/images/me2.jpg"),
                  makeListinformation(
                      text1: "Marksman",
                      text2:
                          "A Marksman is a ranged damage dealer that mainly uses basic attacks. Marksmen are weak early game but become extremely powerful in late game after getting items. They usually play in the Gold Lane.",
                      image: "assets/images/me3.jpg"),
                  makeListinformation(
                      text1: "Jungle",
                      text2:
                          "The Jungler is the hero responsible for farming jungle monsters, securing buffs, and helping teammates through rotations and ganks. The Jungler is one of the most important roles because they control the game's tempo.",
                      image: "assets/images/me4.jpg"),
                  makeListinformation(
                      text1: "Jungle",
                      text2:
                          "A Tank is a durable hero with high HP and defense. Tanks are usually the front line of the team and protect teammates during battles. Their main job is to absorb damage and create opportunities for the team.",
                      image: "assets/images/me4.jpg"),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _makeShareProfileButton(),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          backgroundColor: Provider.of<Themeprovider>(context).isDark
              ? Color.fromARGB(255, 147, 131, 37)
              : Color(0xFFB0BEC5),
          // backgroundColor: Colors.lightGreen,
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
              icon: GestureDetector(
                  onTap: () => context.go("/"), child: Icon(Icons.home)),
              label: "home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: "Explore",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.military_tech),
              label: "Ranking",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ]),
    );
  }

  //[Color(0xFF7B9E87), Color(0xFFC8A96E)]
  _profileData() {
    return Container(
      width: 400,
      height: 180,
      margin: EdgeInsets.all(17),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.purple, width: 0.8),
          gradient: LinearGradient(
            colors: [Color(0xFF3D4A5C), Color(0xFFC8A965)],
          ),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none, //အတာပါမှ မပါရင် ပျောက်နေမယ်
              children: [
                Container(
                  width: 103,
                  height: 110,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(14),
                    child: GestureDetector(
                      onTap: () async {
                        final ImagePicker picker = ImagePicker();
                        final image =
                            await picker.pickImage(source: ImageSource.gallery);
                        if (image == null) {
                          return;
                        } else {
                          isFile = true;
                          file = File(image.path);
                          setState(() {});
                        }
                      },
                      child: isFile
                          ? Image.file(
                              file,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              "assets/images/me1.jpg",
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: -10,
                    right: -20,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "LVL 85",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent),
                      ),
                    ))
              ],
            ),
            SizedBox(
              width: 23,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Padding(padding: EdgeInsetsGeometry.only(top: 8)),
                Text(
                  "XenonBlade_99",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  "ID: 48293021  (2041)",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 15, color: Colors.white),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(3, 30, 0, 0),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      width: 160,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Icon((Icons.groups_3),
                              color: Colors.cyanAccent, size: 22),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "AETHER",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                Text(
                                  "VANGUARD",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 20, 0, 0),
                      child: Icon(
                        Icons.star_rounded,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _Comingsoon() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(17, 0, 0, 20),
          width: 170,
          height: 150,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFF3D4A5C),
                Color(0xFFC8A965),
              ], begin: Alignment.centerLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.indigo, width: 1.5)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock,
                color: Colors.white,
                size: 30,
              ),
              Text(
                "COMING SOON",
                style: TextStyle(color: Colors.white, fontSize: 17),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(27, 0, 17, 20),
          width: 170,
          height: 150,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFF3D4A5C),
                Color(0xFFC8A965),
              ], begin: Alignment.centerLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.indigo, width: 1.5)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock,
                color: Colors.white,
                size: 30,
              ),
              Text(
                "COMING SOON",
                style: TextStyle(color: Colors.white, fontSize: 17),
              )
            ],
          ),
        ),
      ],
    );
  }

  _text() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "MOST PLAYED HEROES",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          Text(
            "VIEW ALL",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      ),
    );
  }

  _makeMlCarouselSlide() {
    return CarouselSlider.builder(
      itemCount: images.length,
      options: CarouselOptions(
        height: 220,
        viewportFraction: 0.55,
        enlargeCenterPage: true,
        padEnds: false,
        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
        autoPlay: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
      ),
      itemBuilder: (context, index, realIndex) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(images[index]),
                fit: BoxFit.cover,
              )),
        );
      },
    );
  }

  _makeShareProfileButton() {
    return Container(
      width: 170,
      height: 50,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF2E2A4A),
            Color(0xFFC8C0E8),
          ], begin: Alignment.centerLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Provider.of<Themeprovider>(context).isDark
                  ? Colors.white.withOpacity(0.5)
                  : Colors.purple.withOpacity(0.4),
              blurRadius: 5,
              spreadRadius: 1,
              offset: Offset(3, 1),
            )
          ]),
      child: ElevatedButton.icon(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              iconColor: Colors.white, backgroundColor: Colors.transparent),
          icon: Icon(Icons.people),
          label: Center(
            child: Text(
              "Share Profile",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          )),
    );
  }

  Widget makeListinformation({
    required String text1,
    required String text2,
    required String image,
  }) {
    return Card(
      elevation: Provider.of<Themeprovider>(context).isDark ? 5 : 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10)),
      shadowColor: Provider.of<Themeprovider>(context).isDark
          ? Colors.white
          : Colors.purpleAccent,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF3D4A5C), Color(0xFFC8A965)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadiusGeometry.circular(10)),
        child: Row(
          children: [
            SizedBox(
              width: 70,
              height: 70,
              child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(70),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  )),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      text1,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.justify,
                    text2,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  )
                ],
              ),
            )),
            Icon(
              Icons.sports_esports,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

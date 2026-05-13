import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  String simpletext =
      """မြကန်သာ၊ တောင်ကျချောင်းတေး၊ရေဝင်ပြေးလှည့်၊ ရေအေးကြည်စွာ၊ကန်ပိုင်မာလလျက်၊ ကြာပေါင်း ထုံထုံ၊ငှက်မျိုးစုံသည်၊ ဘုံဝတိ ံသာ၊နန္ဒာပေလော၊ တူစွ ဟုတ္တာ။""";
  List<String> cats = [
    "Economic",
    "Polities",
    "Technology",
    "Lifestyle",
    "Latest"
  ];
  late TabController _tabController;
  late String currentCats;
  int currentIndex = 0;
  List<String> images = [
    "assets/images/me1.jpg",
    "assets/images/me2.jpg",
    "assets/images/me3.jpg",
    "assets/images/me4.jpg",
    "assets/images/me5.jpg",
  ];

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      setState(() {
        currentIndex = _tabController.index;
        currentCats = cats[currentIndex];
      });
    });
    currentCats = cats[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              expandedHeight: 50,
              title: TabBar(
                  controller: _tabController,
                  dividerColor: Colors.transparent,
                  tabs: [
                    Tab(
                      text: "Economic",
                    ),
                    Tab(
                      text: "Polities",
                    ),
                    Tab(
                      text: "Technology",
                    ),
                    Tab(
                      text: "Lifestyle",
                    ),
                    Tab(
                      text: "Latest",
                    ),
                  ]),
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(160),
                  child: CarouselSlider(
                      items: images.map((img) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              decoration:
                                  BoxDecoration(color: Colors.transparent),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  img,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 160,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        //onPageChanged: callbackFunction,
                        scrollDirection: Axis.horizontal,
                      )))),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        currentCats,
                        style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            childCount: 40,
            (BuildContext context, index) => _makeNewList(),
          ))
        ],
      ),
    );
  }

  _makeNewList() {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10)),
      elevation: 3,
      child: Row(
        children: [
          SizedBox(
              width: 100,
              height: 60,
              child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(20),
                  child: Image.asset(
                    images[2],
                    fit: BoxFit.cover,
                  ))),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    simpletext,
                    style: GoogleFonts.padauk(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "15 minutes ago",
                        style: GoogleFonts.crimsonText(
                            color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        "အမည်မသိ ရှေးစာဆို",
                        style: GoogleFonts.crimsonText(
                            color: Colors.blueGrey, fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

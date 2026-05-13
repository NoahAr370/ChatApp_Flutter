import 'package:flutter/material.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Comment"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                CommentTile(
                    name: "NoahAr",
                    time: "4:30 PM",
                    comment:
                        "မြန်မာစာစတင်ဖြစ်ပေါ်လာခြင်းသည် မြန်မာသည် ပျူစာရေးနည်းကို စံတင်ပြီး (၁၂)ရာစုတွင် မြန်မာဘာသာ ပေါ်ထွန်းလာခဲ့ခြင်းဖြစ်သည်။",
                    avatar: "assets/images/me1.jpg"),
                CommentTile(
                    name: "NoahAr",
                    time: "4:30 PM",
                    comment:
                        "မြန်မာစာစတင်ဖြစ်ပေါ်လာခြင်းသည် မြန်မာသည် ပျူစာရေးနည်းကို စံတင်ပြီး (၁၂)ရာစုတွင် မြန်မာဘာသာ ပေါ်ထွန်းလာခဲ့ခြင်းဖြစ်သည်။",
                    avatar: "assets/images/me1.jpg"),
                CommentTile(
                    name: "NoahAr",
                    time: "4:30 PM",
                    comment:
                        "မြန်မာစာစတင်ဖြစ်ပေါ်လာခြင်းသည် မြန်မာသည် ပျူစာရေးနည်းကို စံတင်ပြီး (၁၂)ရာစုတွင် မြန်မာဘာသာ ပေါ်ထွန်းလာခဲ့ခြင်းဖြစ်သည်။",
                    avatar: "assets/images/me1.jpg"),
                CommentTile(
                    name: "NoahAr",
                    time: "4:30 PM",
                    comment:
                        "မြန်မာစာစတင်ဖြစ်ပေါ်လာခြင်းသည် မြန်မာသည် ပျူစာရေးနည်းကို စံတင်ပြီး (၁၂)ရာစုတွင် မြန်မာဘာသာ ပေါ်ထွန်းလာခဲ့ခြင်းဖြစ်သည်။",
                    avatar: "assets/images/me1.jpg"),
                CommentTile(
                    name: "NoahAr",
                    time: "4:30 PM",
                    comment:
                        "မြန်မာစာစတင်ဖြစ်ပေါ်လာခြင်းသည် မြန်မာသည် ပျူစာရေးနည်းကို စံတင်ပြီး (၁၂)ရာစုတွင် မြန်မာဘာသာ ပေါ်ထွန်းလာခဲ့ခြင်းဖြစ်သည်။",
                    avatar: "assets/images/me1.jpg"),
                CommentTile(
                    name: "NoahAr",
                    time: "4:30 PM",
                    comment:
                        "မြန်မာစာစတင်ဖြစ်ပေါ်လာခြင်းသည် မြန်မာသည် ပျူစာရေးနည်းကို စံတင်ပြီး (၁၂)ရာစုတွင် မြန်မာဘာသာ ပေါ်ထွန်းလာခဲ့ခြင်းဖြစ်သည်။",
                    avatar: "assets/images/me1.jpg"),
                CommentTile(
                    name: "NoahAr",
                    time: "4:30 PM",
                    comment:
                        "မြန်မာစာစတင်ဖြစ်ပေါ်လာခြင်းသည် မြန်မာသည် ပျူစာရေးနည်းကို စံတင်ပြီး (၁၂)ရာစုတွင် မြန်မာဘာသာ ပေါ်ထွန်းလာခဲ့ခြင်းဖြစ်သည်။",
                    avatar: "assets/images/me1.jpg"),
                CommentTile(
                    name: "NoahAr",
                    time: "4:30 PM",
                    comment:
                        "မြန်မာစာစတင်ဖြစ်ပေါ်လာခြင်းသည် မြန်မာသည် ပျူစာရေးနည်းကို စံတင်ပြီး (၁၂)ရာစုတွင် မြန်မာဘာသာ ပေါ်ထွန်းလာခဲ့ခြင်းဖြစ်သည်။",
                    avatar: "assets/images/me1.jpg"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                      hintText: "Write a comment",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        //borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.brown[100]),
                )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.send,
                      color: Colors.deepOrangeAccent,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CommentTile extends StatelessWidget {
  final String name;
  final String time;
  final String comment;
  final String avatar;

  const CommentTile({
    super.key,
    required this.name,
    required this.time,
    required this.comment,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(5)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(avatar),
              radius: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        name,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontSize: 16, color: Colors.black87),
                      ),
                      // SizedBox(
                      //   width: 120,
                      // ),
                      Text(
                        time,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontSize: 17, color: Colors.grey[500]),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700]),
                        text: comment,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Reply",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.deepOrange, fontSize: 16),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

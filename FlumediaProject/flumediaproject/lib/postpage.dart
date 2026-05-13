import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Postpage extends StatefulWidget {
  const Postpage({super.key});

  @override
  State<Postpage> createState() => _PostpageState();
}

class _PostpageState extends State<Postpage> {
  List<String> images = [
    "assets/images/me1.jpg",
    "assets/images/me2.jpg",
    "assets/images/me3.jpg",
    "assets/images/me4.jpg",
    "assets/images/me5.jpg",
  ];
  final String para1 =
      """မြန်မာစာစတင်ဖြစ်ပေါ်လာခြင်းသည် မြန်မာသည် ပျူစာရေးနည်းကို စံတင်ပြီး (၁၂)ရာစုတွင် မြန်မာဘာသာ ပေါ်ထွန်းလာခဲ့ခြင်းဖြစ်သည်။မြန်မာနိုင်ငံ စတင်တည်ထောင်စဉ်ကာလ အနော်ရထာမင်း၏ လက်ထက်တွင် သက္ကတဘာသာစာဖြင့် ရေးသောအုတ်ခွက်စာများ၊ ပါဠိစာများဖြင့်ရေးသော အုတ်ခွက်စာများကို အထောက်အထားပြုကာ မြန်မာ့တို့သည် မူလက ပါဠိနှင့် သက္ကတဘာသာတို့ကို ရင်းနှီးခဲ့ကြောင်း သိရသည်။ သက္ကတဘာသာသည် မဟာယာန ဗုဒ္ဓဘာသာနှင့် ဆက်နွယ်ပြီး ပါဠိဘာသာသည် ထေရဝါဒဗုဒ္ဓဘာသာနှင့် နှီးနွယ်ကြောင်းသိရသည်။""";
  final String para2 =
      """မြန်မာတို့သည် တိုင်းခြားဘာသာဖြစ်သော ပါဠိစာကိုဗုဒ္ဓဘာသာစာပေအဖြစ်  လက်ခံလာချိန်တွင် မြန်မာတိုင်းရင်းသားများ၏ စာပေဖြစ်သော ပျူစာတို့သည် ရှင်သန်နှင့် နေပြီးဖြစ်ကြောင်း သိရသည်။ မြန်မာစာပေါ်ပေါက်လာသော အခါတွင် မြန်မာတို့သည် မြန်မာစာနှင့်အတူ တိုင်းရင်း ပျူ၊ မွန်စာပေတို့ကိုလည်း ဆက်လက်ပြုစုလာခဲ့ကြပြီး ခရစ်နှစ်(၁၁၁၃)ခုနှစ် တွင် ရာဇကုမာရ်မင်းသား ရေးထိုးသော မြစေတီ ကျောက်စာတွင် ပျူ၊ မွန်၊ မြန်မာဘာသာ တို့ကို ပါဠိစာပေနှင့် အတူ ယှဉ်တွဲ တွေ့ရှိရသည်။ ပါဠိစာပေမှ မြန်မာစာပေသို့ အပြန်အလှန် ဘာသာပြန် အရေးအသားနှင့် ပါဠိဘာသာပြန်ရေးသည့် အရေးအသားများ ထွန်းကားလာခဲ့ပြီး (၁၁)ရာစု အနော်ရထာမင်း လက်ထက်တွင် ထေရဝါဒဗုဒ္ဓသာသနာနှင့် အတူ ပိဋိကတ်စာပေများ ပုဂံသို့ရောက်ရှိလာပြီးနောက်တွင် (၁၁) ရာစု နှောင်းပိုင်းတွင် မြန်မာစာ စတင် ပေါ်ပေါက် ထွန်းကားခဲ့ကြောင်း သမိုင်းအထောက်အထားများက ပြဆိုထားသည်။""";
  final String para3 =
      """မြန်မာစာ ပေါ်ပေါက်လာပုံကို ပုဂံခေတ် ကျန်စစ်သားမင်း နတ်ရွာစံပြီး ခရစ်နှစ် (၁၁၁၃) ခန့်တွင် ရေးထိုးသော ရာဇကုမာရ်ကျောက်စာသည် သက္ကရာဇ် အခိုင်အမာ ပါသော အစောဆုံး မြန်မာစာ ဖြစ်ကြောင်းသိရသည်။ မြန်မာစာစတင် ဖော်ပြရာတွင် ဗုဒ္ဓစာပေများကို ကျောက်စာ၊ မှင်စာများဖြင့် ဇာတ်နိပါတ်၊ ပန်းချီ၊ ပန်းပု များနှင့် အတူ မှင်ဖြင့် ဖော်ပြကြပြီး ကျောက်စာများ ၊ မှင်စာများ စတင် ပေါ်ပေါက်လာခဲ့ရကြောင်း သိရသည်။ နောက်ပိုင်းတွင် ဗုဒ္ဓစာပေ အကြောင်းအရာများကို စကားပြေဖြင့်လည်းကောင်း ကဗျာများဖြင့်လည်းကောင်း ဖွဲ့နွဲလာကြပြီး ဗုဒ္ဓစာပေကို အခြေခံကာ မြန်မာစာပေ အရေးအဖွဲ့ အမျိုးမျိုး ပေါ်ထွန်းလာရကြောင်းသိရသည်။ ပါဠိ၊ ပျူ၊ မွန်၊ မြန်မာ ဟူသော ဘာသာစကားတို့မှ စကားလုံးများကို မွေးစား သုံးနှုန်းခြင်း၊ ဘာသာပြန်သုံးနှုန်းခြင်းတို့ဖြင့် မြန်မာစကား နှင့် စာပေ ဖွံ့ဖြိုးကြွယ်ဝ လာခဲ့ သည်ဟု ဆိုကြသည်။ ပင်းယခေတ် (၁၃၀၉ ခုနှစ် ခန့် မှ ၁၃၆၀) နှင့် အင်းဝခေတ် (၁၃၆၄ မှ ၁၄၈၆) တစ်လျောက်လုံးတွင် မြန်မာတို့သည် ဗုဒ္ဓစာပေအမွေအနှစ်များကို ပါဠိဘာသာမှ တစ်ဆင့် ဘာသာပြန်ပြုစုလာခဲ့ကြပြီး မြန်မာစာပေအနေနှင့် အရေးအသား အသုံးအနှုန်းများ ခိုင်မြဲစွာ အမြစ်တွယ် ထွန်းကားနေပြီ ဖြစ်သည်။""";
  final String titleString =
      """သတင်းခေါင်းစဥ်သည် ဤနေရာတွင် ဖြစ်ပေါ်မည် ဖြစ်၍ သတင်းဖတ်သူများအနေနှင့် ခေါင်းစဥ်ကို ဤနေရာတွင် ဖတ်ရန်""";

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        expandedHeight: 400,
        pinned: false,
        floating: false,
        flexibleSpace: Image.asset(
          images[1],
          fit: BoxFit.contain,
        ),
      ),
      SliverToBoxAdapter(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.heart_broken,
                        color: Colors.red,
                      )),
                  Text("127 Likes",
                      style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.bold, fontSize: 12))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "15 Hours ago",
                    style: TextStyle(
                        color: Colors.blueGrey, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "NoahAr",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 96, 161, 193),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Container(
                width: 5,
                height: 40,
                decoration: BoxDecoration(color: Colors.purpleAccent),
              ),
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SelectableText.rich(TextSpan(
                    style: GoogleFonts.padauk(
                        fontWeight: FontWeight.bold, fontSize: 16),
                    text: titleString)),
              ))
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Column(
                children: [
                  _makeRichText(para1),
                  SizedBox(
                    height: 15,
                  ),
                  _makeRichText(para2),
                  SizedBox(
                    height: 15,
                  ),
                  _makeRichText(para3)
                ],
              ),
            ),
          ),
        ),
      ),
    ]));
  }

  _makeRichText(String word) {
    return RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 13),
            children: [
              WidgetSpan(
                  child: SizedBox(
                width: 30,
              )),
              TextSpan(text: word)
            ]));
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobilelegendproject/activePage.dart';
import 'package:mobilelegendproject/laneWinRate.dart';
import 'package:mobilelegendproject/laneWinRate1.dart';
import 'package:mobilelegendproject/loginPage.dart';

import 'package:mobilelegendproject/profile.dart';
import 'package:mobilelegendproject/provider/themeProvider.dart';
import 'package:provider/provider.dart';

final GoRouter router = GoRouter(
  //အပြင်ထုတ်လိုက်ရင် Dark/light mode change ရင် rebuildပြန်မလုပ်   refresh ပြန်မဖစ်/ app စ run တုန်းက တစ်ခါပဲ create လုပ်တယ်။
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => Loginpage(),
    ),
    GoRoute(path: "/home", builder: (context, state) => Activepage()),
    GoRoute(path: "/explore", builder: (context, state) => Lanewinrate()),
    GoRoute(path: "/ranking", builder: (context, state) => Lanewinrate1()),
    GoRoute(
      path: "/profile",
      builder: (context, state) => Profile(),
    ),
  ],
);

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Themeprovider(),
        ),
      ],
      child: const Myapp(),
    ),
  );
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: Provider.of<Themeprovider>(context).isDark
          ? ThemeMode.dark
          : ThemeMode.light,
    );
  }
}

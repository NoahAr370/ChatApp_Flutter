import 'package:flumediaproject/homepage.dart';
import 'package:flumediaproject/loginPage.dart';
import 'package:flumediaproject/pages/editAccount.dart';
import 'package:flumediaproject/pages/provider/UserProvider.dart';
import 'package:flumediaproject/pages/provider/UtilProvider.dart';
import 'package:flumediaproject/pages/provider/settingPage.dart';

// import 'package:flumediaproject/pages/provider/commentPage.dart';

//import 'package:flumediaproject/pages/provider/settingPage.dart';
import 'package:flumediaproject/pages/provider/themeProvider.dart';
import 'package:flumediaproject/postpage.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);//အပေါ်က ဟာတေွနဲ့ မရှုပ်အောင်သုံးတာ//safeareaလို
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Themeprovider(),
      ),
      ChangeNotifierProvider(create: (context) => Utilprovider()),
      ChangeNotifierProvider(create: (context) => Userprovider())
    ],
    child: Myapp(),
  ));
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => Loginpage(),
      ),
      GoRoute(
        path: "/login",
        builder: (context, state) => Loginpage(),
      ),
      GoRoute(
        path: "/home",
        builder: (context, state) => Homepage(),
      ),
      GoRoute(path: "/post", builder: (context, state) => Postpage()),
      GoRoute(path: "/setting", builder: (context, state) => Settingpage()),
      GoRoute(
        path: "/editAccount",
        builder: (context, state) => Editaccount(),
      )
    ]);

    return MaterialApp.router(
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
        theme: Provider.of<Themeprovider>(context).themeMode);
  }
}

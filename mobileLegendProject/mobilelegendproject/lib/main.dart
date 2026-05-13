import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
//import 'package:mobilelegendproject/demo.dart';
import 'package:mobilelegendproject/laneWinRate.dart';
import 'package:mobilelegendproject/provider/themeProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Themeprovider(),
      ),
    ],
    child: Myapp(),
  ));
  ;
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    GoRouter _router = GoRouter(routes: [
      GoRoute(path: "/", builder: (context, state) => Lanewinrate()),
    ]);

    return MaterialApp.router(
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
        theme: Provider.of<Themeprovider>(context).themeMode);
  }
}

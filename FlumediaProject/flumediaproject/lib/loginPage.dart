import 'package:flumediaproject/pages/provider/UserProvider.dart';
import 'package:flumediaproject/registerPage.dart';
import 'package:flumediaproject/utils/Kop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Loginpage extends StatelessWidget {
  Loginpage({super.key});

  final gradientcolor = [
    Color(0xff8f00ff), // violet
    Colors.indigo,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.red,
  ];
  @override
  Widget build(BuildContext context) {
    var pVider = Provider.of<Userprovider>(context);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GradientAnimationText(
                text: Text('User Logic',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontSize: 40)),
                colors: gradientcolor,
                duration: Duration(seconds: 5),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (value) => pVider.nameChange(value),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.brown[100],
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.lightBlue,
                    ),
                    label: Text(
                      "Username",
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      //borderSide: BorderSide(color: Colors.red, width: 10)
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (value) => pVider.passwordChange(value),
                obscureText: pVider.isHidePass,
                decoration: InputDecoration(
                    fillColor: Colors.brown[100],
                    filled: true,
                    labelText: "Password",
                    suffixIcon: InkWell(
                      onTap: () => pVider.toggleShow(),
                      child: Icon(
                        pVider.isHidePass
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.purpleAccent,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.lightBlue,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forget Your Password?",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              pVider.isLoading
                  ? Kop.showLoadingIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        bool isSuccess = await pVider.login();
                        if (isSuccess) {
                          context.pushReplacement("/home");
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(pVider.error),
                            backgroundColor: Colors.brown,
                          ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.lightGreenAccent,
                          elevation: 10,
                          shadowColor: Colors.lightBlueAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(5)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 52, vertical: 14),
                          backgroundColor: Colors.amber),
                      child: Text(
                        "Logic",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
              SizedBox(
                height: 45,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Registerpage()));
                },
                child: Align(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.black),
                      ),
                      Text(
                        "Sign up",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.lightBlue),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

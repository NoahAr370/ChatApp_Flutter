import 'package:flumediaproject/loginPage.dart';
import 'package:flumediaproject/pages/provider/UserProvider.dart';
import 'package:flumediaproject/utils/Kop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:provider/provider.dart';

class Registerpage extends StatelessWidget {
  Registerpage({super.key});

  //bool isHidden = true;
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
    Userprovider pVider = Provider.of<Userprovider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                GradientAnimationText(
                    text: Text(
                      "Register",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontSize: 40),
                    ),
                    colors: gradientcolor,
                    duration: Duration(seconds: 5)),
                SizedBox(
                  height: 38,
                ),
                TextField(
                  onChanged: (value) =>
                      Provider.of<Userprovider>(context, listen: false)
                          .nameChange(value),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(),
                      labelText: "name",
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.greenAccent,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (value) =>
                      Provider.of<Userprovider>(context, listen: false)
                          .displayNameChange(value),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(),
                      labelText: "Display Name",
                      prefixIcon: Icon(
                        Icons.people,
                        color: Colors.greenAccent,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (value) =>
                      Provider.of<Userprovider>(context, listen: false)
                          .phoneChange(value),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(),
                    labelText: "Phone",
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.greenAccent,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (value) =>
                      Provider.of<Userprovider>(context, listen: false)
                          .passwordChange(value),
                  obscureText: pVider.isHidePass,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[100],
                      suffixIcon: InkWell(
                        onTap: () => pVider.toggleShow(),
                        // {
                        //   // setState(() {
                        //   //   isHidden = !isHidden;
                        //   // });
                        // },
                        child: Icon(
                          pVider.isHidePass
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.purpleAccent,
                        ),
                      ),
                      labelText: "Password",
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.greenAccent,
                      ),
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forget your password?",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.indigoAccent),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                pVider.isLoading
                    ? Kop.showLoadingIndicator()
                    : ElevatedButton(
                        onPressed: () async {
                          bool isSuccess = await Provider.of<Userprovider>(
                                  context,
                                  listen: false)
                              .register();
                          if (isSuccess) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                      title: Text("Register Success!"),
                                      content: Text(
                                          "Registration Success,Login now"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Loginpage()));
                                            },
                                            child: Text("Go To Login"))
                                      ]);
                                });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(pVider.error),
                              backgroundColor: Colors.blueGrey,
                            ));
                            Kop.errorToast(context, "Registration Fail!");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 7,
                          shadowColor: Colors.brown,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(5)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          backgroundColor: Colors.lightGreenAccent,
                        ),
                        child: Text(
                          "Register",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontSize: 30),
                        )),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Loginpage()));
                  },
                  child: Align(
                    // alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.blueGrey),
                        ),
                        Text(
                          "Sign in",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.lightBlueAccent),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

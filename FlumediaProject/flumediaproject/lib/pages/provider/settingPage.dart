import 'package:flumediaproject/pages/provider/UserProvider.dart';
import 'package:flumediaproject/pages/provider/theme.dart';
import 'package:flumediaproject/pages/provider/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Settingpage extends StatelessWidget {
  Settingpage({super.key});

  bool isDark = false;
  bool isNoti = false;
  bool isPri = false;
  @override
  Widget build(BuildContext context) {
    isDark = Provider.of<Themeprovider>(context).themeMode == darkMode;
    var pVider = Provider.of<Userprovider>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Setting",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  children: [
                    CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(pVider.user.profile)),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pVider.user.displayName,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          pVider.user.phone,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontSize: 16, color: Colors.blueGrey),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Sign Out--${pVider.user.name}",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontSize: 16, color: Colors.pinkAccent),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    //  color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8)),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    SwitchListTile(
                        title: Text(
                          "Dark Mode",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontSize: 14),
                        ),
                        value: isDark,
                        onChanged: (value) {
                          Provider.of<Themeprovider>(context,
                                  listen: false) //listenပါမှအလုပ်လုပ်
                              .toggleTheme();
                        }),
                    // Divider(),
                    SwitchListTile(
                        title: Text(
                          "Notification",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontSize: 14),
                        ),
                        value: isNoti,
                        onChanged: (value) {
                          // setState(() {
                          //   isNoti = value; //value
                          //});
                        })
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    //  color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(7)),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () => context.push("/editAccount"),
                      title: Text("Edit Account"),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                      iconColor: Colors.brown,
                    ),
                    Divider(),
                    ListTile(
                      title: Text("Change Password"),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                      iconColor: Colors.brown,
                    ),
                    Divider(),
                    ListTile(
                      title: Text("Language"),
                      trailing: Icon(Icons.arrow_forward_ios_sharp),
                    ),
                    Divider()
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  //color: Colors.red[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Privacy and Security",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontSize: 20),
                    ),
                    SwitchListTile(
                        title: Text("Private Account"),
                        value: isPri,
                        onChanged: (value) {
                          // setState(() {
                          //   isPri = value;
                          // });
                        }),
                    ListTile(
                      title: Text("Privacy and Security Help"),
                      trailing: Icon(Icons.arrow_forward_ios_sharp),
                      iconColor: Colors.brown,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

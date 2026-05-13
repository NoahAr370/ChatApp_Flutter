import 'package:flumediaproject/pages/provider/UserProvider.dart';
import 'package:flumediaproject/utils/Kop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Editaccount extends StatefulWidget {
  const Editaccount({super.key});

  @override
  State<Editaccount> createState() => _EditaccountState();
}

class _EditaccountState extends State<Editaccount> {
  @override
  Widget build(BuildContext context) {
    var pVider = Provider.of<Userprovider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Account"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(pVider.user.profile),
              ),
              TextButton(
                onPressed: () {},
                child: Text("Upload New Image"),
              ),
              SizedBox(
                height: 30,
              ),
              Text(pVider.user.name),
              Row(
                children: [
                  Expanded(
                      child: TextField(
                    onChanged: (value) => pVider.nameChange(value),
                    decoration: InputDecoration(
                        hintText: "Name Change",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: Colors.green, width: 10))),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        bool isSuccess = await Provider.of<Userprovider>(
                                context,
                                listen: false)
                            .editName();
                        if (isSuccess) {
                          Kop.successToast(
                              context, "Name Successfully Changed!");
                        } else {
                          Kop.errorToast(context, "Name Change Fail!");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero),
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 19)),
                      child: Text("Change"))
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                        hintText: "Password Change",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: Colors.green, width: 10))),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero),
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 19)),
                      onPressed: () {},
                      child: Text("Change"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

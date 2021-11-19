import 'package:flutter/material.dart';

class DetailUserPage extends StatefulWidget {
  const DetailUserPage({Key? key}) : super(key: key);

  @override
  _DetailUserPageState createState() => _DetailUserPageState();
}

class _DetailUserPageState extends State<DetailUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 120,
            width: 120,
            child: const CircleAvatar(
              radius: 30.0,
              backgroundImage:
                  NetworkImage("https://reqres.in/img/faces/7-image.jpg"),
              backgroundColor: Colors.transparent,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text("nama",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          const SizedBox(
            height: 5,
          ),
          const Text("emailll",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18)),
        ],
      ),
    ));
  }
}

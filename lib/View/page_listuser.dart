import 'package:flutter/material.dart';
import 'package:maimaiid_test/View/page_add_user.dart';
import 'package:maimaiid_test/View/page_detailuser.dart';

class ListUserPage extends StatefulWidget {
  const ListUserPage({Key? key}) : super(key: key);

  @override
  _ListUserPageState createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List User")),
      floatingActionButton: Container(
        width: 150,
        child: FloatingActionButton(
          isExtended: true,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PageAddUser()));
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: [Icon(Icons.add), Text("add user")],
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DetailUserPage()));
                    },
                    child: const ListTile(
                        title: Text("Michael Lawson"),
                        subtitle: Text("michael.lawson@reqres.in"),
                        leading: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: NetworkImage(
                              "https://reqres.in/img/faces/7-image.jpg"),
                          backgroundColor: Colors.transparent,
                        )),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

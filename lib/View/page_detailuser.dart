import 'package:flutter/material.dart';
import 'package:maimaiid_test/Service/api_service.dart';

class DetailUserPage extends StatefulWidget {
  final int id;

  const DetailUserPage({Key? key, this.id = 1}) : super(key: key);

  @override
  _DetailUserPageState createState() => _DetailUserPageState();
}

class _DetailUserPageState extends State<DetailUserPage> {
  String nama = "";
  String email = "";
  String avatar = "";
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    ApiService().getListDetailUser(widget.id.toString()).then((value) {
      print(value["data"]);
      nama = value['data']['first_name'];
      email = value['data']['email'];
      avatar = value['data']['avatar'];
      setState(() {});
    });
  }

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
            child: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(avatar),
              backgroundColor: Colors.transparent,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(nama,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          const SizedBox(
            height: 5,
          ),
          Text(email,
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18)),
        ],
      ),
    ));
  }
}

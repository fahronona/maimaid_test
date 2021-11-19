import 'package:flutter/material.dart';

void showDialogStatus(
    BuildContext cntx, String title, String content, bool status) {
  // flutter defined function
  showDialog(
    context: cntx,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          status == true
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Ok",
                        style: TextStyle(color: Colors.blue),
                      )),
                )
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Ulangi",
                          style: TextStyle(color: Colors.blue))),
                ),
        ],
      );
    },
  );
}

import 'package:flutter/material.dart';
import 'package:maimaiid_test/Service/api_service.dart';
import 'package:maimaiid_test/component/form_component.dart';
import 'package:maimaiid_test/component/show_dialog.dart';

class PageAddUser extends StatefulWidget {
  const PageAddUser({Key? key}) : super(key: key);

  @override
  _PageAddUserState createState() => _PageAddUserState();
}

class _PageAddUserState extends State<PageAddUser> {
  TextEditingController namaCtrl = TextEditingController();
  TextEditingController jobCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form Add User")),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            formCom(namaCtrl, "Masukan nama", "Nama tidak boleh kosong"),
            formCom(
                jobCtrl, "Masukan pekerjaan", "Pekerjaan tidak boleh kosong"),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, right: 18, left: 18, bottom: 20),
              child: SizedBox(
                height: 58,
                child: ElevatedButton(
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ApiService()
                            .sendUser(namaCtrl.text, jobCtrl.text)
                            .then((value) {
                          if (value is Map<String, dynamic>) {
                            if (value.isNotEmpty) {
                              showDialogStatus(context, "Submit Berhasil",
                                  "Data berhasil disimpan", true);
                            } else {
                              showDialogStatus(
                                  context,
                                  "Submit Gagal",
                                  "Data gagal disimpan, coba ulangi lagi",
                                  false);
                            }
                          } else {
                            showDialogStatus(context, "Submit Gagal",
                                "Data gagal disimpan, coba ulangi lagi", false);
                          }
                        });
                      }
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

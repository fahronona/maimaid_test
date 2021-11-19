import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loadmore/loadmore.dart';
import 'package:maimaiid_test/Bloc/bloc.dart';
import 'package:maimaiid_test/Bloc/event.dart';
import 'package:maimaiid_test/Bloc/state.dart';
import 'package:maimaiid_test/Component/loading_circular.dart';
import 'package:maimaiid_test/Model/model_user.dart';
import 'package:maimaiid_test/View/page_add_user.dart';
import 'package:maimaiid_test/View/page_detailuser.dart';

class ListUserPage extends StatefulWidget {
  const ListUserPage({Key? key}) : super(key: key);

  @override
  _ListUserPageState createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  final UserBloc _userBloc = UserBloc(const UserInitial());
  bool isLoading = false;
  Future<bool> load() async {
    return true;
  }

  @override
  void initState() {
    _userBloc.add(GetUserList());
    super.initState();
  }

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
        body: BlocBuilder<UserBloc, UserState>(
            bloc: _userBloc,
            builder: (BuildContext context, UserState state) {
              if (state is UserInitial) {
                return loadingCircular();
              } else if (state is UserLoading) {
                return loadingCircular();
              } else if (state is UserLoaded) {
                return LoadMore(
                  isFinish: false,
                  textBuilder: DefaultLoadMoreTextBuilder.english,
                  onLoadMore: load,
                  whenEmptyLoad: false,
                  delegate: const DefaultLoadMoreDelegate(),
                  child: ListView.builder(
                      itemCount: state.userModel.data.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, right: 18, left: 18),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailUserPage(
                                                  id: state.userModel
                                                      .data[index].idUser,
                                                )));
                                  },
                                  child: ListTile(
                                      title: Text(state
                                          .userModel.data[index].firstName),
                                      subtitle: Text(
                                          state.userModel.data[index].email),
                                      leading: CircleAvatar(
                                        radius: 30.0,
                                        backgroundImage: NetworkImage(
                                            state.userModel.data[index].avatar),
                                        backgroundColor: Colors.transparent,
                                      )),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                );
              }

              return Container();
            }));
  }
}

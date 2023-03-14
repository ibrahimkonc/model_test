import 'package:flutter/material.dart';
import 'package:model_test/pages/profile/profile_page.dart';
import 'package:model_test/pages/view_models/profile_view_model.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => context.read<ProfileViewModel>().getUsers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users List"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  ListView.builder(
                    itemCount: context.watch<ProfileViewModel>().users.length,
                    itemBuilder: (context, index) {
                      User user =
                          context.watch<ProfileViewModel>().users[index];
                      return Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Stack(
                                  children: <Widget>[
                                    Positioned.fill(
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: <Color>[
                                              Color(0xFF0D47A1),
                                              Color(0xFF1976D2),
                                              Color(0xFF42A5F5),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    TextButton.icon(
                                        style: TextButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          padding: const EdgeInsets.all(16.0),
                                          textStyle:
                                              const TextStyle(fontSize: 20),
                                        ),
                                        onPressed: () async {
                                          await context
                                              .read<ProfileViewModel>()
                                              .getUser(user.id!);
                                          // ignore: use_build_context_synchronously
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ProfilePage()));
                                        },
                                        icon: Icon(Icons.portrait_outlined),
                                        label: Text(
                                            " ${user.firstName!} ${user.lastName!}")),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  if (context.watch<ProfileViewModel>().loading)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Center(child: CircularProgressIndicator()),
                      ],
                    ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 1;
                    i <= context.watch<ProfileViewModel>().totalPage;
                    i++)
                  context.watch<ProfileViewModel>().page == i
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(i.toString()),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: TextButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        const MaterialStatePropertyAll<Color>(
                                            Colors.amber)),
                                onPressed: () {
                                  context.read<ProfileViewModel>().setPage(i);
                                },
                                child: Text(i.toString())),
                          ),
                        )
              ],
            )
          ],
        ),
      ),
    );
  }
}

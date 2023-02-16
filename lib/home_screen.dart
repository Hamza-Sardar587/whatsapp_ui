import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userAvatarUrl =
      "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        //appBar: DefaultTabController(
        appBar: AppBar(
          title: Text('Whatsapp'),
          bottom: const TabBar(
            tabs: [
              //Icon(Icons.camera_alt),
              Tab(
                child: Icon(Icons.camera_alt),
              ),

              Tab(
                child: Text('Chats'),
              ),

              Tab(
                child: Text('Status'),
              ),
              Tab(
                child: Text('Calls'),
              ),
            ],
          ),
          actions: [
            Icon(Icons.search),
            SizedBox(
              width: 10,
            ),
            PopupMenuButton(
              icon: Icon(Icons.more_vert_outlined),
              itemBuilder: (context) => [
                PopupMenuItem(value: 1, child: Text('New Search')),
                PopupMenuItem(
                  value: 2,
                  child: Text('Settings'),
                ),
                PopupMenuItem(
                  value: 3,
                  child: Text('LogOut'),
                )
              ],
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),

        //),
        body: TabBarView(
          children: [
            Icon(Icons.camera_alt),
            //Text('Chats'),

            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(userAvatarUrl),
                    ),
                    title: Text('John Wick'),
                    subtitle: Text('Where is my dog?'),
                    trailing: Text('2:20 AM'),
                  );
                },
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('My Status'),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ListTile(
                          leading: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.green,
                                width: 3,
                              ),
                            ),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(userAvatarUrl),
                            ),
                          ),
                          title: Text('John Wick'),
                          subtitle: Text('posted 35 minutes ago'),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Align(child: Text('Recent Updates') , alignment: Alignment.topLeft,),
                      ],
                    );
                  } else {}
                  return ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.green,
                          width: 3,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(userAvatarUrl),
                      ),
                    ),
                    title: Text('John Wick'),
                    subtitle: Text('posted 35 minutes ago'),
                  );
                },
              ),
            ),

            //Text('Calls'),
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(userAvatarUrl),
                    ),
                    title: Text('John Wick'),
                    subtitle: Align(
                      alignment: Alignment.topLeft,
                      child: index / 2 == 0
                          ? Row(
                              children: [
                                Icon(Icons.phone),
                                SizedBox(
                                  width: 2,
                                ),
                                Text('You missed this Audio call at 2:22'),
                              ],
                            )
                          : Row(
                              children: [
                                Icon(Icons.video_call),
                                SizedBox(
                                  width: 2,
                                ),
                                Text('You missed this Video call at 2:22'),
                              ],
                            ),
                    ),
                    trailing:
                        Icon(index / 2 == 0 ? Icons.phone : Icons.video_call),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

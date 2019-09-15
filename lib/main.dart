import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './ChatItemModel.dart';
import './ChatHelper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whatsapp UI Redesigned',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  var fabIcon = Icons.message;



  Color nhColor = Color.fromRGBO(18, 140, 126, 1.0);
  Color nhColorFaded = Color.fromRGBO(37, 211, 102, 1.0);

  @override
  void initState() {
    super.initState();

    tabController = TabController(vsync: this, length: 4)
      ..addListener(() {
        setState(() {
          switch (tabController.index) {
            case 0:
              break;
            case 1:
              fabIcon = Icons.message;
              break;
            case 2:
              fabIcon = Icons.camera_enhance;
              break;
            case 3:
              fabIcon = Icons.call;
              break;
          }
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "NHwhatsApp",
          style: TextStyle(
              color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.w600),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                right:
                    20.0), // sets the edgeinsets property only for the right side
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.more_vert),
          ),
        ],
        backgroundColor: Colors.indigo,
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              icon: Text("CONGOSA"),
            ),
            Tab(
              icon: Text("STATUS"),
            ),
            Tab(
              icon: Text("CALLS"),
            ),
          ],
          indicatorColor: Colors.white,
          controller: tabController,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[



          Icon(Icons.camera_alt),  /// Here is the first child of the tabBar View
          //Which is the Camera Icon
          ListView.builder( // The ListView.Builder Builds the list view of the 
          // chats list page
            itemBuilder: (context, position) {
              ChatItemModel chatItem = ChatHelper.getChatItem(position);

              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.account_circle,
                          size: 64.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      chatItem.name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20.0),
                                    ),
                                    Text(
                                      chatItem.messageDate,
                                      style: TextStyle(color: Colors.black45),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    chatItem.mostRecentMessage,
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 16.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                ],
              );
            },
            itemCount: ChatHelper.itemCount,
          ),
          Text("Status Tab"),
          Text("Calls Tab"),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(fabIcon),
        backgroundColor: nhColorFaded,
      ),
    );
  }
}

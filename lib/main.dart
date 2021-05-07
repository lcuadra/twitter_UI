import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(
            // color: Colors.black;
            ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> names = <String>[];

  final List<int> msgCount = <int>[];

  TextEditingController nameController = TextEditingController();

  void addItemToList() {
    setState(() {
      names.insert(0, nameController.text);
      msgCount.insert(0, 0);
    });
  }

  // void cleanTextfield(){
  // if(floatingActionButton)
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.lightBlue),
        title: ListTile(
          title: Center(
            child: Icon(
              Icons.cake,
              color: Colors.lightBlue,
            ),
          ),
          trailing: Icon(
            Icons.stars_outlined,
            color: Colors.lightBlue,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("xyz"),
              accountEmail: Text("@xyz"),
              currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white, child: Text("xyz")),
            ),
            ListTile(
              title: new Text("Perfil"),
              leading: new Icon(Icons.account_box_rounded),
            ),
            ListTile(
              title: new Text("Listas"),
              leading: new Icon(Icons.list),
            ),
            ListTile(
              title: new Text("Temas"),
              leading: new Icon(Icons.bubble_chart),
            ),
            ListTile(
              title: new Text("Elementos Guardados"),
              leading: new Icon(Icons.save),
            ),
            ListTile(
              title: new Text("Momentos"),
              leading: new Icon(Icons.animation),
            ),
            Divider(
              height: 0.1,
            ),
            ListTile(
              title: Text("Confifuracion de privacidad"),
            ),
            ListTile(
              title: Text("Centro de ayuda"),
            ),
            Divider(
              height: 0.5,
            ),
            ListTile(
              leading: Icon(Icons.highlight),
              trailing: Icon(Icons.qr_code_rounded),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addItemToList();
        },
        child: Icon(Icons.add_comment, color: Colors.white),
        backgroundColor: Colors.black12,
      ),
      body: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20),
          child: TextField(
            controller: nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Add Text',
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: names.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  margin: EdgeInsets.all(2),
                  color: msgCount[index] >= 10
                      ? Colors.black
                      : msgCount[index] > 3
                          ? Colors.black
                          : Colors.black,
                  child: Center(
                    child: Text(
                      '${names[index]}',
                      // (${msgCount[index]})',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                );
              }),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        fixedColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home, color: Colors.lightBlue),
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(Icons.search, color: Colors.lightBlue),
          ),
          BottomNavigationBarItem(
            label: "notifications",
            icon: Icon(Icons.notifications, color: Colors.lightBlue),
          ),
          BottomNavigationBarItem(
            label: "Messages",
            icon: Icon(Icons.message, color: Colors.lightBlue),
          ),
        ],
        onTap: (int index) {
          setState(() {
            // _currentIndex = index;
          });
        },
      ),
    );
  }
}

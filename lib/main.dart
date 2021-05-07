import 'package:flutter/material.dart';

import 'widgets/app_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.lightBlue),
        title: Icon(
          Icons.cake,
          color: Colors.lightBlue,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.stars_outlined),
            color: Colors.lightBlue,
            onPressed: () {},
          ),
        ],
      ),
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_comment, color: Colors.white),
        backgroundColor: Colors.black12,
      ),
      body: _Body(index: currentIndex),
      bottomNavigationBar: _AppNavBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}

class _AppNavBar extends StatelessWidget {
  const _AppNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      fixedColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home, color: Colors.lightBlue),
        ),
        BottomNavigationBarItem(
          label: 'Search',
          icon: Icon(Icons.search, color: Colors.lightBlue),
        ),
        BottomNavigationBarItem(
          label: 'Notifications',
          icon: Icon(Icons.notifications, color: Colors.lightBlue),
        ),
        BottomNavigationBarItem(
          label: 'Messages',
          icon: Icon(Icons.message, color: Colors.lightBlue),
        ),
      ],
      onTap: onTap,
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: index,
      children: [
        HomePage(),
        Center(child: Text('SearchPage')),
        Center(child: Text('NotificationsPage')),
        Center(child: Text('MessagesPage')),
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: 5,
            itemBuilder: (_, int index) {
              debugPrint('building $this... ${DateTime.now()}');

              return ListTile(
                leading: CircleAvatar(),
                title: Text('Jack'),
                subtitle: Text('Facebook sucks!'),
              );
            },
          ),
        ),
      ],
    );
  }
}

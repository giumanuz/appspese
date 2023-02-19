import 'package:appspese/common/my_card.dart';
import 'package:appspese/pages/home/spese_totali_page.dart';
import 'package:flutter/material.dart';
import 'package:appspese/common/personalCard.dart';
import 'package:appspese/screens/home_screen_app_bar.dart';
import 'package:appspese/pages/home/home_page.dart';
import 'package:appspese/common/menu_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: textHolidayName('Bella zio'),
        centerTitle: true,
        backgroundColor: Colors.grey[400],
        elevation: 0.0,
        leading: CustomButtonTest(),
      ),
      body: indexPage == 0 ? const HomePage() : const SpeseTotaliPage(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            indexPage = index;
          });
        },
        backgroundColor: Colors.grey[400],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on_rounded),
            label: 'Spese Totali',
          ),
        ],
        currentIndex: indexPage,
        selectedItemColor: Colors.indigo[500],
        unselectedItemColor: Colors.grey[800],
      ),
    );
  }

  Text textHolidayName(holidayName) {
    return Text(
      holidayName,
      style: TextStyle(
        color: Colors.grey[800],
        fontSize: 20.0,
        fontFamily: 'Oxygen-Regular',
      ),
    );
  }

  myDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

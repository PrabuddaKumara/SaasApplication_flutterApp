import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:saasapp/pages/screens/home_page.dart';
import 'package:saasapp/pages/screens/user_histry_page.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({super.key});

  @override
  State<MainScreenPage> createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {

  int _selectedItem=0;
  void _onTapItem(int index){
    setState(() {
      _selectedItem=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor:Colors.white,
        backgroundColor:Color(0xFFFF7D29),
        unselectedItemColor:Colors.grey,


        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.transform),
            label: "Convension",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
        ],
        onTap: _onTapItem,
        currentIndex: _selectedItem,

      ),
      body: _selectedItem ==0 ?HomePage():UserScreenpage(),
      
      
    );
  }
}

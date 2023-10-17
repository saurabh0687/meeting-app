import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zoom/resources/auth_methods.dart';
import 'package:zoom/screens/history_meeting.dart';
import 'package:zoom/screens/meeting_screen.dart';
import 'package:zoom/utils/colors.dart';
import 'package:zoom/widgets/custom_buttons.dart';
import 'package:zoom/widgets/home_meeting_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }
  List<Widget> pages=[
     MeetingScreen(),
    const HistoryMeetingScreen(),
    const Text("contact"),
    CustomButton(text: "Log Out", onPressed:()=>AuthMethods().signOut())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Meet & chat"),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: footerColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: onPageChanged,
          currentIndex: _page,
          unselectedFontSize: 14,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.comment_bank), label: "Meet & chat"),
            BottomNavigationBarItem(
                icon: Icon(Icons.lock_clock), label: "Meetings"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: "Contacts"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: "Settings"),
          ]),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:sos_app/child/bottom_screens/add_contacts.dart';
import 'package:sos_app/child/bottom_screens/chat_page.dart';
import 'package:sos_app/child/bottom_screens/profile_page.dart';

import 'bottom_screens/contacts_page.dart';
import 'bottom_screens/homeSceendemo.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({super.key});

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  int currentIndex = 0;
  List<Widget> pages = [
    HomeScreen1(),
    AddContactsPage(),

    ChatPage(),
    ProfilePage(),
   // CheckUserStatusBeforeChat(),
    //ReviewPage(),
    // CheckUserStatusBeforeChatOnProfile(),
    //SettingsPage()
    // ReviewPage(),
    //ContactsPage(),
  ];
  onTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex:currentIndex,
          onTap: onTapped,
          type: BottomNavigationBarType.fixed,
          items:[
            BottomNavigationBarItem(
              label: 'Home',
                icon: Icon(Icons.home,
                )),
            BottomNavigationBarItem(
                label: 'Contacts',
                icon: Icon(Icons.contacts,
                )),
            BottomNavigationBarItem(
                label: 'Chats',
                icon: Icon(Icons.chat,
                )),
            BottomNavigationBarItem(
                label: 'Profile',
                icon: Icon(Icons.person_3_rounded,
                )),

          ] ),


    );
  }
}

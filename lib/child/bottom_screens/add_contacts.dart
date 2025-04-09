import 'package:flutter/material.dart';
import 'package:sos_app/child/bottom_screens/contacts_page.dart';
import 'package:sos_app/components/PrimaryButton.dart';

class AddContactsPage extends StatelessWidget {
  const AddContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            PrimaryButton(title: "Add trusted Contact", onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactsPage(), ));
            }),

          ],
        ),
      ),
    );
  }
}

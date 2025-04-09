import 'package:flutter/material.dart';

class SafeHome extends StatelessWidget {
  const SafeHome({super.key});
  showModelSafeHome (BuildContext context){
    showModalBottomSheet(
        context: context,
        builder:(context){
      return Container(
          height: MediaQuery.of(context).size.height/1.4,
         decoration: BoxDecoration(
           color: Colors.grey,
           borderRadius: BorderRadius.only(
             topLeft: Radius.circular(20),
             topRight: Radius.circular(20),
           )

         ),
          // child: Card()
      );
        });
  }
  
  @override
  Widget build(BuildContext context) {
    return Center( // Centering the card horizontally
      child: InkWell(
         onTap: () => showModelSafeHome(context),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            height: 160,
            width: MediaQuery.of(context).size.width * 0.9, // 80% of screen width
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFED8970),
                  Color(0xFFF4F4F4),
                  Color(0xFFE8DEC8),
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjust spacing
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10), // Adjust left padding
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Align text to left
                      mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
                      children: [
                        ListTile(
                          title: Text(
                            "Send Location",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),
                          ),
                          subtitle: Text("Share Location",
                          style: TextStyle(fontSize: 20),),
                        ),
                      ],
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/img.png',
                    height: 110, // Adjust image height
                    width: 110, // Adjust image width
                    fit: BoxFit.cover, // Ensure the image fits properly
                  ),
                ),
                SizedBox(width: 14), // Add some spacing
              ],
            ),
          ),
        ),
      ),
    );
  }
}

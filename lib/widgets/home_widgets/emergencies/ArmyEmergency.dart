import 'package:flutter/material.dart';
// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class ArmyEmergency extends StatelessWidget {
//   _callNumber(String number) async{
//     //set the number here
//     await FlutterPhoneDirectCaller.callNumber(number);
//   }
//   //const ArmyEmergency({super.key}); // ✅ Added constructor

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0,bottom: 5),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          // onTap: () => _callNumber('1947'),
          child: Container(

            height: 180,
            width: MediaQuery.of(context).size.width*0.7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF5ED5E4),
                    Color(0xFFFB8580),
                    Color(0xFFFBD079),
                  ],
                )),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white.withOpacity(.8),
                    child: Image.asset('assets/army.png'),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Emergency Army',
                          style: TextStyle(
                            color:Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize:MediaQuery.of(context).size.width*.06,
                          ),
                        ),
                        Text(
                          'Call 1947 for emergency',
                          style: TextStyle(
                            color:Colors.white,
                            overflow: TextOverflow.ellipsis,
                            // fontWeight: FontWeight.bold,
                            fontSize:MediaQuery.of(context).size.width*.045,
                          ),

                        ),
                        Container(
                          height: 30,
                          width: 100,

                          decoration: BoxDecoration(
                            color: Colors.white,

                            borderRadius: BorderRadius.circular(20),
                          ),
                          child:Center(
                            child: Text(
                                '1-9-4-7',
                                style: TextStyle(
                                  color:Colors.redAccent,
                                  //overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold,
                                  fontSize:MediaQuery.of(context).size.width*0.050,
                                )
                            ),
                          ) ,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

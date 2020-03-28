import 'package:flutter/material.dart';
import 'package:wastify/style.dart';
class StaffPage extends StatefulWidget {
  final String staffId;
  StaffPage({Key key, this.staffId}) : super(key: key);

  @override
  _StaffPageState createState() => _StaffPageState();
}

class _StaffPageState extends State<StaffPage> {
    double credit= 2200.00;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Card(
               shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
              child: Container(
                height: 100,

                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Image.asset("assets/user.png",height: 30,width: 30,),
                      Text("  Staff Id : ",style: subheading,),
                      Text(widget.staffId,style: heading.copyWith(fontSize: 22),)
                    ],
                  ),
                ),
              ),
            ),
             Card(
               shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  children: <Widget>[
                    Text("Monthly Credit",style: subheading,),
                    Text("Rs. "+credit.toString(),style: heading,)
                  ],
                ),
              ),
            ),
             Card(
               shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
              child: Container(
                color: Colors.green.withOpacity(0.1),
                height: 200,
                child: Center(
                  child: Text("Expected Map View"),
                ),
              ),
            ),
             Card(
               shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
              child: Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 7,),
                    Text("Next scheduling",style: heading.copyWith(fontSize: 22),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/calendar.png",height: 30,width: 30,),
                        ),
                        Text("    Tomorrow 9 am",style: normal,)
                      ],
                    )
                  ],
                ),
              ),
            )

          ],
        ),
      )),
    );
  }
}
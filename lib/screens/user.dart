import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wastify/indicator.dart';
import 'package:wastify/style.dart';

class UserPage extends StatefulWidget {
  final String userid;
  final String dustbinid;
  UserPage({Key key, this.userid, this.dustbinid}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int touchedIndex;

  @override
  Widget build(BuildContext context) {
    int coins = 1000, waste = 15;
    Widget buildR(String title, String coinp, String icon) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              icon,
              height: 30,
              width: 30,
            ),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: normal,
              ),
            ),
            FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                color: Colors.orangeAccent.withOpacity(0.2),
                onPressed: () {
                  showDialog(context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: Text("Are you sure?"),
                    content: Text(title+" for "+coinp),
                    actions: <Widget>[
                      CupertinoButton(child: Text("yes"), onPressed: (){
                        Navigator.of(context).pop();
                        int a= int.parse(coinp);
                        coins=coins-a;
                        setState(() {
                          
                          
                          print(coins);
                        });
                        
                      }),
                       CupertinoButton(child: Text("no"), onPressed: (){
                         Navigator.of(context).pop();
                       }),
                    ],
                  ),
                  );
                },
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/coin.png",
                      height: 20,
                    ),
                    Text(
                      coinp,
                      style: subheading.copyWith(color: Colors.black54),
                    ),
                  ],
                ))
          ],
        );
    return Scaffold(
      backgroundColor: Color(0xfff2f3f4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Card(
               shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
              child: Container(
                height: 100,

                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Image.asset("assets/user.png",height: 30,width: 30,),
                          Text("  UserName : ",style: subheading,),
                          Text(widget.userid,style: heading.copyWith(fontSize: 22),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Image.asset("assets/dustbin.png",height: 30,width: 30,),
                          Text("  Dustbin Id : ",style: subheading,),
                          Text(widget.dustbinid,style: heading.copyWith(fontSize: 22),)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Container(
                  height: 110,
                  child: Row(
                    children: <Widget>[
                      Flexible(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                "assets/coin.png",
                                height: 35,
                                width: 35,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                coins.toString(),
                                style: heading.copyWith(fontSize: 22),
                              )
                            ],
                          ),
                          Text(
                            "Coins earned",
                            style: subheading,
                          )
                        ],
                      )),
                      Container(
                        width: 2,
                        color: Colors.black38,
                        height: 100,
                      ),
                      Flexible(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                waste.toString(),
                                style: heading,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "kgs",
                                style: heading.copyWith(fontSize: 22),
                              )
                            ],
                          ),
                          Text(
                            "Waste disposed",
                            style: subheading,
                          )
                        ],
                      )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: 250,
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    color: Colors.lightBlueAccent.withOpacity(0.2),
                    onPressed: () {
                      showDialog(context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: Text("Your Dustbin is marked for Pickup"),
                    
                    actions: <Widget>[
                      CupertinoButton(child: Text("OK"), onPressed: (){
                        Navigator.of(context).pop();
                      }),
                       
                    ],
                  ),
                  );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "assets/pickup-truck.png",
                          height: 30,
                        ),
                        Text(
                          "    Mark for Pickup",
                          style: subheading.copyWith(color: Colors.black),
                        ),
                      ],
                    )),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Container(
                  height: 230,
                  child: Column(
                    children: <Widget>[
                      Flexible(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child:
                            buildR("Plant a tree", "200", "assets/plant.png"),
                      )),
                      Divider(
                        thickness: 2,
                      ),
                      Flexible(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child:
                            buildR("Get 10% OFF you Taxes", "700", "assets/tax.png"),
                      )),
                      Divider(
                        thickness: 2,
                      ),
                      Flexible(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: buildR("Help in children education", "300",
                            "assets/book.png"),
                      )),
                      Divider(
                        thickness: 2,
                      ),
                      GestureDetector(
                        onTap: (){
                          showDialog(context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: Text("Coming soon!"),
                    
                    actions: <Widget>[
                      CupertinoButton(child: Text("ok"), onPressed: (){
                        Navigator.of(context).pop();
                      
                      }),
                       
                    ],
                  ),
                  );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "more",
                              style: normal.copyWith(color: Colors.lightBlue),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.lightBlue,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                 shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Container(
                  height: 200,
                  child: Row(
                    children: <Widget>[
                      const SizedBox(
                        height: 18,
                      ),
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: PieChart(
                            PieChartData(
                                pieTouchData: PieTouchData(
                                    touchCallback: (pieTouchResponse) {
                                  setState(() {
                                    if (pieTouchResponse.touchInput
                                            is FlLongPressEnd ||
                                        pieTouchResponse.touchInput
                                            is FlPanEnd) {
                                      touchedIndex = -1;
                                    } else {
                                      touchedIndex =
                                          pieTouchResponse.touchedSectionIndex;
                                    }
                                  });
                                }),
                                borderData: FlBorderData(
                                  show: false,
                                ),
                                sectionsSpace: 0,
                                centerSpaceRadius: 32,
                                sections: showingSections()),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("OUT OF"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                waste.toString(),
                                style: heading,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "kgs",
                                style: heading.copyWith(fontSize: 22),
                              )
                            ],
                          ),
                          Indicator(
                            color: Color(0xff0293ee),
                            text: 'Bio-degradable',
                            isSquare: true,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Indicator(
                            color: Color(0xfff8b250),
                            text: 'Non-biodegradable',
                            isSquare: true,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Indicator(
                            color: Color(0xff845bef),
                            text: 'E-waste',
                            isSquare: true,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 28,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );

        default:
          return null;
      }
    });
  }
}

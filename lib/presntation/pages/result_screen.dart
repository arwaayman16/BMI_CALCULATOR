import 'package:flutter/material.dart';
import 'package:qize2/data/model/human.dart';
import 'package:qize2/presntation/pages/home_screen.dart';

class Result extends StatefulWidget {
  const Result({super.key, required this.h1});
  final Human h1;

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Human h = widget.h1;
  }

  @override
  Widget build(BuildContext context) {
    double res =
        (widget.h1.wieght) / ((widget.h1.hieght / 100) * (widget.h1.hieght / 100));
    return Scaffold(
      backgroundColor: Color.fromARGB(245, 3, 0, 30),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 3, 0, 24),
        foregroundColor: Colors.white,
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 16,
          ),
          Text(
            "Your Result",
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255), fontSize: 25),
          ),
           SizedBox(height: 16,),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              alignment: Alignment.center,
              //  padding: EdgeInsets.all(30),
              height: 500,
              width: 400,
              color: Color.fromARGB(102, 0, 0, 0),

              child: Column(children: [
               if(res>18.5&&res<25) Text(
                  "Normal",
                  style: TextStyle(
                      color: Color.fromARGB(108, 2, 167, 60),
                      fontSize: 25),
                )
              else if (res<18.5)Text(
                  "underWieght",
                  style: TextStyle(
                      color: Color.fromARGB(223, 248, 4, 4),
                      fontSize: 25),
                )
                 else if (res>25)Text(
                  "OverWieght",
                  style: TextStyle(
                      color: Color.fromARGB(223, 248, 199, 4),
                      fontSize: 25),
                ),

                Text(
                  "${res.toStringAsFixed(1)}",
                  style: TextStyle(
                      color: Color.fromARGB(210, 255, 255, 255),
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Normal BMI range:",
                  style: TextStyle(
                      color: Color.fromARGB(110, 255, 255, 255),
                      fontSize: 15,
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  "18.5-25 kg/m2",
                  style: TextStyle(
                      color: Color.fromARGB(210, 255, 255, 255),
                      fontSize: 25,
                      fontWeight: FontWeight.w400),
                ),

                SizedBox(height: 56,),
                 if(res>18.5&&res<25) Text(
                  
                 "you have normal body wieght \n good job",
                 textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(223, 249, 240, 240),
                      fontSize: 20),
                )
              else if (res<18.5)Text(
                
                  "you have a lower than normal body wight \n try eat more",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(223, 249, 240, 240),
                      fontSize: 20),
                )
                 else if (res>25)Text(
                  "you have a more than normal body wight \n try eat less",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(223, 249, 240, 240),
                      fontSize: 20),
                ),
              ]),
            ),
          ),
          ElevatedButton(onPressed: ()=>(), child: Text("Save Result"),style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 78, 75, 75),
                  foregroundColor: Colors.white),),
          Spacer(),
          Container(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>HomeScreen()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 252, 3, 3)),
              child: Text(
                "RE-CALCULATE",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            width: 410,
            height: 50,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:qize2/data/model/human.dart';
import 'package:qize2/presntation/pages/result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  // final Human h;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double value = 0;
  int wieght = 0;
  int age = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(245, 3, 0, 30),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 3, 0, 24),
        foregroundColor: Colors.white,
        title: Text(" BMI CALCULATOR"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(child: Gunder(icon: Icons.male, title: "Male")),
              SizedBox(
                width: 16,
              ),
              Gunder(icon: Icons.female, title: "Female"),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              alignment: Alignment.center,
              //  padding: EdgeInsets.all(30),
              height: 200,
              width: 4000,
              color: Color.fromARGB(102, 0, 0, 0),

              child: Column(children: [
                Text(
                  "HEIGHT",
                  style: TextStyle(
                      color: const Color.fromARGB(108, 255, 255, 255),
                      fontSize: 25),
                ),
                Text(
                  "${value.toInt()}cm",
                  style: TextStyle(
                      color: Color.fromARGB(210, 255, 255, 255),
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
                Slider(
                    min: 0.0,
                    max: 400,
                    value: value,
                    activeColor: Color.fromARGB(255, 217, 207, 219),
                    thumbColor: Color.fromARGB(255, 198, 21, 5),
                    onChanged: (v) {
                      print(v);
                      setState(() {
                        value = v;
                      });
                    }),
              ]),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WeightAge(
                counter: wieght,
                title: "Wieght",
                fun2: () => setState(() {
                  wieght++;
                }),
                fun1: () => setState(() {
                  wieght--;
                }),
              ),
              SizedBox(
                width: 16,
              ),
              WeightAge(
                counter: age,
                title: "Age",
                fun2: () => setState(() {
                  age++;
                }),
                fun1: () => setState(() {
                  age--;
                }),
              )
            ],
          ),
          Spacer(),
          Container(
            child: ElevatedButton(
              
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Result(
                              h1: Human(age, wieght, value.toInt()),
                            )));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 212, 3, 3)),
              child: Text(
                "CALCULATE",
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

class Gunder extends StatefulWidget {
  const Gunder({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;

  @override
  State<Gunder> createState() => _GunderState();
}

class _GunderState extends State<Gunder> {
   Color color = Color.fromARGB(102, 0, 0, 0);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GestureDetector(
        
        onTap: () {
          
          setState(() {
            color = Color.fromARGB(102, 53, 63, 126);
            // showButton = true;
          });
        },
        onDoubleTap: () {
          setState(() {
            color=Color.fromARGB(102, 0, 0, 0) ;
          });
        },
        child: Container(
          alignment: Alignment.center,
          //  padding: EdgeInsets.all(30),
          height: 200,
          width: 190,
          color: color,

          child: Column(
            children: [
              Icon(
                widget.icon,
                color: Colors.white,
                size: 100,
              ),
              Text(
                "${widget.title}",
                style: TextStyle(
                    color: const Color.fromARGB(108, 255, 255, 255),
                    fontSize: 25),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WeightAge extends StatefulWidget {
  const WeightAge({
    super.key,
    required this.title,
    required this.fun2,
    required this.fun1,
    required this.counter,
  });
  final String title;
  final int counter;
  final void Function() fun1;
  final void Function() fun2;
  @override
  State<WeightAge> createState() => _WeightAgeState();
}

class _WeightAgeState extends State<WeightAge> {
  @override
  void initState() {
    // TODO: implement initState
    // int? age = widget.agee;
    // int? wieght = widget.wieghtt;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        alignment: Alignment.center,
        //  padding: EdgeInsets.all(30),
        height: 200,
        width: 190,
        color: Color.fromARGB(102, 0, 0, 0),

        child: Column(
          children: [
            Text(
              "${widget.title}",
              style: TextStyle(
                  color: const Color.fromARGB(108, 255, 255, 255),
                  fontSize: 25),
            ),
            Text(
              " ${widget.counter}",
              style: TextStyle(
                  color: Color.fromARGB(243, 253, 246, 246),
                  fontSize: 35),
            ),
             SizedBox(height: 32,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () => widget.fun1(),
                    child: Icon(Icons.minimize),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(119, 255, 255, 255),
                        foregroundColor: Colors.black)),
                        SizedBox(width: 8,),
                ElevatedButton(
                    onPressed: () => widget.fun2(),
                    child: Icon(Icons.add),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(120, 255, 255, 255),
                        foregroundColor: Colors.black))
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Grade Me'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 String name = "";
 int currentWeek = 1;
 double lastCumulativeGrade = 0.0;
 double algo = 0.0;
 double assessments = 0.0;
 double agile = 0.0;
 double weeklyTask = 0.0;
 double currentWeekGrade = 0.0;
 double cumulativeGrade = 0.0;

// currentWeekGrade = (algo/100 * 20) + (agile/100 * 20) + (assessments/ 100 * 20) + (weeklyTask/100 * 40);
// cumulativeGrade = lastCumulativeGrade * (currentWeek - 1) + currentWeekGrade;

 final myController = TextEditingController();
 @override
 void dispose() {
//    Clean up the controller when the widget is disposed.
   myController.dispose();
   super.dispose();
 }
 // Weekly Grade = (algo/100 * 20 + agile/100 * 20 + assessments/ 100 * 20 + weeklyTask/100 * 40)
 // cumulativeGrade = (lastCumulativeGrade * (currentWeek - 1) + currentWeekGrade)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Center(
          child: ListView(
//          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "GRADE ME",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Please enter your name and your grades below.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
              ),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                    labelText: "Name: ",
                    hintText: "Oyedele Samuel"),
                onChanged: (String text){
                  setState(() {
                    name = text;
                  });
                },
                onSubmitted: (String text){
                  setState(() {
                    name = text;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "Current Week",
                    hintText: "1"),
                keyboardType: TextInputType.number,
                onChanged: (String text){
                  setState(() {
                    currentWeek = int.parse(text);
                  });
                },
                onSubmitted: (String text){
                  setState(() {
                    currentWeek = int.parse(text);
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "Last Cumulative Grade:",
                    hintText: "0.00"),
                keyboardType: TextInputType.number,
                onChanged: (String text){
                  setState(() {
                    lastCumulativeGrade = double.parse(text);
                  });
                },
                onSubmitted: (String text){
                  setState(() {
                    lastCumulativeGrade = double.parse(text);
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "Algorithms:",
                    hintText: "0.00"),
                keyboardType: TextInputType.number,
                onChanged: (var text){
                  setState(() {
                    algo = double.parse(text);
                  });
                },
                onSubmitted: (var text){
                  setState(() {
                    algo = double.parse(text);
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "Weekly Assessment Score:",
                    hintText: "0.00"),
                keyboardType: TextInputType.number,
                onChanged: (String text){
                  setState(() {
                    assessments = double.parse(text);
                  });
                },
                onSubmitted: (String text){
                  setState(() {
                    assessments = double.parse(text);
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "Agile Score:",
                    hintText: "0.00"),
                keyboardType: TextInputType.number,
                onChanged: (String text){
                  setState(() {
                    agile = double.parse(text);
                  });
                },
                onSubmitted: (String text){
                  setState(() {
                    agile = double.parse(text);
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "Weekly Task\'s score:",
                    hintText: "0.00"),
                keyboardType: TextInputType.number,
                onChanged: (String text){
                  setState(() {
                    weeklyTask = double.parse(text);
                  });
                },
                onSubmitted: (String text){
                  setState(() {
                    weeklyTask = double.parse(text);
                  });
                },
              ),
              SizedBox(height: 20,),
              Text("Hi $name, Your score for this week is $currentWeekGrade\nYour Current Cumulative Grade is $cumulativeGrade."),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentWeekGrade = (algo/100 * 20) + (agile/100 * 20) + (assessments/ 100 * 20) + (weeklyTask/100 * 40);
            cumulativeGrade = (lastCumulativeGrade * (currentWeek - 1) + currentWeekGrade) / currentWeek;
          });
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text("Hi $name, Your score for this week is $currentWeekGrade and your Current Cumulative Grade is $cumulativeGrade."),
              );
            },
          );
        },
        tooltip: 'Show me the value!',
        child: Icon(Icons.check),
      ),
    );
  }
}

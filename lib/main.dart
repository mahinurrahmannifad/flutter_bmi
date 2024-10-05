import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BMI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const MyHomePage(
        title: 'null',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var bgColor = Colors.indigo.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI Measurement'),
          backgroundColor: Colors.blueAccent.shade400,
        ),
        body: Container(
          color: bgColor,
          child: Center(
            child: Container(
              height: 500,
              width: 300,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'BMI CALCULATION',
                      style:
                          TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    TextField(
                      controller: wtController,
                      decoration: const InputDecoration(
                          label: Text('Enter Your Weight in Kg'),
                          prefixIcon: Icon(Icons.line_weight)),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    TextField(
                      controller: ftController,
                      decoration: const InputDecoration(
                          label: Text('Enter Your Height in Feet'),
                          prefixIcon: Icon(Icons.height)),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    TextField(
                      controller: inController,
                      decoration: const InputDecoration(
                          label: Text('Enter Your Height in Inch'),
                          prefixIcon: Icon(Icons.height)),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        var wt = wtController.text.toString();
                        var ft = ftController.text.toString();
                        var inch = inController.text.toString();

                        if (wt != "" && ft != "" && inch != "") {
                          var integerWt = int.parse(wt);
                          var integerFt = int.parse(ft);
                          var integerInch = int.parse(inch);

                          var totalInch = (integerFt * 12) + integerInch;
                          var totalCm = totalInch * 2.54;
                          var totalMtr = totalCm / 100;

                          var bmi = integerWt / (totalMtr * totalMtr);

                          var message = "";
                          if (bmi > 25) {
                            message = "You are OverWeight!!";
                            bgColor = Colors.orange.shade200;
                          } else if (bmi < 18) {
                            message = "You are UnderWeight";
                            bgColor = Colors.red.shade200;
                          } else {
                            message = "You are Healthy";
                            bgColor = Colors.green.shade200;
                          }

                          setState(() {
                            result =
                                "$message\nYour BMI is: ${bmi.toStringAsFixed(4)}";
                          });
                        } else {
                          setState(() {
                            result = "Please fill all the required blanks";
                          });
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blueAccent.shade400), // Change button color
                      ),
                      child: const Text(
                        'Calculate',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    Text(
                      result,
                      style: const TextStyle(fontSize: 20),
                    )
                  ]),
            ),
          ),
        ));
  }
}

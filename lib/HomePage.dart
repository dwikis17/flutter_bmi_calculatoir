import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  int _weight = 0;
  double _bmi = 0;
  int _height = 0;
  void _handleOnPressed() {
    setState(() {
      _counter += 1;
    });
    print('$_weight');
  }

  void handleCalculateBMI() {
    double bmi = ((_weight / _height / _height) * 10000);
    setState(() {
      _bmi = bmi;
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Your BMI is  $_bmi'),
      duration: const Duration(seconds: 1),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your weight',
              ),
              onChanged: (value) {
                setState(() {
                  _weight = int.parse(value);
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your height',
              ),
              onChanged: (value) {
                setState(() {
                  _height = int.parse(value);
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shadowColor: Colors.red,
                ),
                onPressed: () => handleCalculateBMI(),
                child: const Text('Calculate'),
              )
            ],
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleOnPressed,
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }
}

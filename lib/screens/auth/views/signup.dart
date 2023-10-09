import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  List<DateTime?> _dates = [
    DateTime.now(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                enabled: true,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  labelText: "Full Name",
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                        style: BorderStyle.solid),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  labelText: "Username",
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                        style: BorderStyle.solid),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                        style: BorderStyle.solid),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                        style: BorderStyle.solid),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                ),
                child: CalendarDatePicker2(
                  config: CalendarDatePicker2Config(
                    selectedDayHighlightColor: const Color(0xFF0064E0),
                    weekdayLabels: [
                      'Sun',
                      'Mon',
                      'Tue',
                      'Wed',
                      'Thu',
                      'Fri',
                      'Sat'
                    ],
                    weekdayLabelTextStyle: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                    firstDayOfWeek: 1,
                    controlsHeight: 50,
                    controlsTextStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    dayTextStyle: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                    disabledDayTextStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    // selectableDayPredicate: (day) => !day
                    //     .difference(
                    //         DateTime.now().subtract(const Duration(days: 3)))
                    //     .isNegative,
                  ),
                  value: _dates,
                  onValueChanged: (dates) => {
                    _dates = dates,
                  },
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF0064E0),
                  disabledBackgroundColor: Colors.white,
                  disabledForegroundColor: const Color(0xFF0064E0),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

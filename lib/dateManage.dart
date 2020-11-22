import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateManage extends StatefulWidget {
  DateManage({Key key}) : super(key: key);

  @override
  _DateManageState createState() => _DateManageState();
}

class _DateManageState extends State<DateManage> {
  var typeValue = "range";
  var fromvalue;
  var tovalue;
  var day = '1';
  var _dateTime = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final _dateFormController = TextEditingController();
  final _dateToController = TextEditingController();
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          fromvalue = _dateTime;
                          tovalue = _dateTime;
                          _dateFormController.text =
                              formatter.format(fromvalue);
                          _dateToController.text = formatter.format(tovalue);
                          typeValue = "tday";
                        });
                      },
                      child: Text('Today')),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          fromvalue = _dateTime.subtract(Duration(days: 1));
                          tovalue = _dateTime.subtract(Duration(days: 1));
                          _dateFormController.text =
                              formatter.format(fromvalue);
                          _dateToController.text = formatter.format(tovalue);
                          typeValue = "pday";
                        });
                      },
                      child: Text('Yesterday')),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          fromvalue = _dateTime.subtract(Duration(days: 6));
                          tovalue = _dateTime;
                          _dateFormController.text =
                              formatter.format(fromvalue);
                          _dateToController.text = formatter.format(tovalue);
                          typeValue = "cweek";
                        });
                      },
                      child: Text('Current Week')),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          fromvalue = _dateTime.subtract(Duration(days: 7));
                          tovalue = _dateTime.subtract(Duration(days: 13));
                          _dateFormController.text =
                              formatter.format(fromvalue);
                          _dateToController.text = formatter.format(tovalue);
                          typeValue = "pweek";
                        });
                      },
                      child: Text('Previous Week')),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        var month = DateTime.now().month;
                        var year = DateTime.now().year;
                        var initDay = '$year-$month-$day';
                        switch (month) {
                          case 1:
                          case 3:
                          case 5:
                          case 7:
                          case 10:
                          case 12:
                            return day = '31';
                            break;
                          case 2:
                            day = '28';
                            break;
                          default:
                            day = "30";
                            break;
                        }
                        var lastday = '$year-$month-$day';
                        fromvalue = initDay;
                        tovalue = lastday;
                        _dateFormController.text = fromvalue;
                        _dateToController.text = tovalue;
                        typeValue = "cmonth";
                      });
                    },
                    child: Text('Current Month')),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        var month = DateTime.now().month;
                        var year = DateTime.now().year;
                        var initDay = '$year-${month - 1}-$day';
                        switch (month) {
                          case 1:
                          case 3:
                          case 5:
                          case 7:
                          case 10:
                          case 12:
                            return day = '31';
                            break;
                          case 2:
                            day = '28';
                            break;
                          default:
                            day = "30";
                            break;
                        }
                        var lastday = '$year-${month - 1}-$day';

                        fromvalue = initDay;
                        tovalue = lastday;
                        _dateFormController.text = fromvalue;
                        _dateToController.text = tovalue;
                        typeValue = "pmonth";
                      });
                    },
                    child: Text('PreVos Month')),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        var day = '1';
                        var month = '1';
                        var year = DateTime.now().year;
                        var initDay = '$year-$month-$day';
                        var lastday = '$year-12-31';
                        fromvalue = initDay;
                        tovalue = lastday;
                        _dateFormController.text = fromvalue;
                        _dateToController.text = tovalue;
                        typeValue = "cyear";
                      });
                    },
                    child: Text('Current Year')),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        var day = '1';
                        var month = '1';
                        var year = DateTime.now().year;
                        var initDay = '${year - 1}-$month-$day';
                        var lastday = '${year - 1}-12-31';
                        fromvalue = initDay;
                        tovalue = lastday;
                        _dateFormController.text = fromvalue;
                        _dateToController.text = tovalue;
                        typeValue = "pyear";
                      });
                    },
                    child: Text('Previous Year')),
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              children: [
                Expanded(flex: 3, child: Text('Date Form')),
                Expanded(flex: 3, child: Text('Date To')),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: _dateFormController,
                    decoration: InputDecoration(
                      focusColor: Colors.green[800],
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                      prefixIcon: IconButton(
                          color: Colors.green[800],
                          onPressed: () {
                            showDatePicker(
                                    context: context,
                                    initialDate: _dateTime == null
                                        ? DateTime.now()
                                        : _dateTime,
                                    firstDate: DateTime(2019),
                                    lastDate: DateTime(2022))
                                .then((date) {
                              setState(() {
                                _dateFormController.text =
                                    formatter.format(date);
                                typeValue = "range";
                              });
                            });
                          },
                          icon: Icon(Icons.date_range)),
                    ),
                    readOnly: true,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: _dateToController == null
                        ? DateTime.now()
                        : _dateToController,
                    decoration: InputDecoration(
                      focusColor: Colors.green[800],
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                      prefixIcon: IconButton(
                          color: Colors.green[800],
                          onPressed: () {
                            showDatePicker(
                                    context: context,
                                    initialDate: _dateTime == null
                                        ? DateTime.now()
                                        : _dateTime,
                                    firstDate: DateTime(2019),
                                    lastDate: DateTime(2022))
                                .then((date) {
                              setState(() {
                                _dateToController.text =
                                    formatter.format(date);
                                typeValue = "range";
                              });
                            });
                          },
                          icon: Icon(Icons.date_range)),
                    ),
                    readOnly: true,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            RaisedButton(
                color: Colors.green,
                child: Text(
                  "Submit",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  setState(() {
                    orderStateMent(typeValue, _dateFormController.text,
                        _dateToController.text);
                  });
                }),
          ],
        ),
      ),
    );
  }

  void orderStateMent(String typeValue, String text, String text2) { 
    print(typeValue);
    print(text);
    print(text2);


  }
}


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateManage extends StatefulWidget {
  DateManage({Key key}) : super(key: key);

  @override
  _DateManageState createState() => _DateManageState();
}

class _DateManageState extends State<DateManage> {
  DateTime tempDate;
  var fromDate;
  var toDate;
  String _selectedDate;
  String _dateCount;
  String _range;
  String _rangeCount;

  @override
  void initState() {
    _selectedDate = '';
    _dateCount = '';
    _range = '';
    _rangeCount = '';
    super.initState();
  }
   DateTime _dateTime = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final _dateFormController = TextEditingController();
  final _dateToController = TextEditingController();
void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    /// The argument value will return the changed date as [DateTime] when the
    /// widget [SfDateRangeSelectionMode] set as single.
    ///
    /// The argument value will return the changed dates as [List<DateTime>]
    /// when the widget [SfDateRangeSelectionMode] set as multiple.
    ///
    /// The argument value will return the changed range as [PickerDateRange]
    /// when the widget [SfDateRangeSelectionMode] set as range.
    ///
    /// The argument value will return the changed ranges as
    /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
    /// multi range.
    setState(() {
      if (args.value is PickerDateRange) {
        _range =
            DateFormat('yyyy-MM-dd').format(args.value.startDate).toString() +
                ' to ' +
                DateFormat('yyyy-MM-dd')
                    .format(args.value.endDate ?? args.value.startDate)
                    .toString();
      } else if (args.value is DateTime) {
        _selectedDate = args.value;
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text('Date Form'),
                  TextField(
                    controller: _dateFormController == null
                        ? DateTime.now()
                        : _dateFormController,
                    decoration: InputDecoration(
                      focusColor: Colors.green[800],
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
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
                               var dates = DateTime.parse(date.toString());
                              fromDate = "${dates.day}-${dates.month}-${dates.year}";
                               tempDate = new DateTime.utc(fromDate);
                                
                                    print(tempDate);
                                  
                                   // print(fromDate);
                                    
                                  
                              });
                            });
                          },
                          icon: Icon(Icons.date_range)),
                    ),
                    readOnly: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Date To'),
                  TextField(
                    controller: _dateToController == null
                        ? DateTime.now()
                        : _dateToController,
                    decoration: InputDecoration(
                      focusColor: Colors.green[800],
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
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
                                _dateToController.text = formatter.format(date);
                                toDate=date;
                              });
                            });
                          },
                          icon: Icon(Icons.date_range)),
                    ),
                    readOnly: true,
                  ),
                ],
              ),
            ),

                   SfDateRangePicker(
                    monthViewSettings: DateRangePickerMonthViewSettings(),
                    onSelectionChanged: _onSelectionChanged,
                    selectionMode: DateRangePickerSelectionMode.range,
                    initialSelectedRange: PickerDateRange(   
                      tempDate,DateTime.now().subtract(Duration(days: 4))
                  ),
                ),
               
          ],
        ),
      ),
    );
  }
}

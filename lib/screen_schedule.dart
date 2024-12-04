import 'package:flutter/material.dart';

import 'data.dart';

class ScreenSchedule extends StatefulWidget {
  final UserGroup userGroup;

  ScreenSchedule({super.key, required this.userGroup});

  @override
  State<ScreenSchedule> createState() => _ScreenSchedule();
}

class _ScreenSchedule extends State<ScreenSchedule> {
  late DateTime fromDate;
  late DateTime toDate;
  late TimeOfDay fromTime;
  late TimeOfDay toTime;

  final List<String> weekdays = ["M", "T", "W", "T", "F", "S", "S"];

  final Map<int, String> dayMapping = {
    DateTime.monday: "M",
    DateTime.tuesday: "T",
    DateTime.wednesday: "W",
    DateTime.thursday: "T",
    DateTime.friday: "F",
    DateTime.saturday: "S",
    DateTime.sunday: "S",
  };

  late List<bool> selectedWeekdays = List.filled(DateTime.sunday + 1, false);
  
  @override
  void initState() {
    super.initState();
    fromDate = widget.userGroup.schedule.fromDate;
    toDate = widget.userGroup.schedule.toDate;
    fromTime = widget.userGroup.schedule.fromTime;
    toTime = widget.userGroup.schedule.toTime;
    
    for (int i = DateTime.monday; i < DateTime.sunday + 1; i++) {
      if (widget.userGroup.schedule.weekdays.contains(i)){
        selectedWeekdays[i] = true;
      }
    }
  }

  void _showWarning(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Range dates"),
          content: const Text("The From date if after the To date.\nPlease, select a new date range"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              child: Text("Accept"),
            ),
          ],
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context, bool isFrom) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: isFrom ? fromDate : toDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null) {
      setState(() {
        if (isFrom) {
          fromDate = pickedDate;
        } else {
          toDate = pickedDate;
        }
      });
    }
  }

  Future<void> _selectTime(BuildContext context, bool isFrom) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: isFrom ? fromTime : toTime,
    );
    if (pickedTime != null) {
      setState(() {
        if (isFrom) {
          fromTime = pickedTime;
        } else {
          toTime = pickedTime;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text("Schedule ${widget.userGroup.name}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("From", style: TextStyle(fontSize: 16)),
                Row(
                  children: [
                    Text(
                      "${fromDate.toLocal()}".split(' ')[0],
                      style: TextStyle(fontSize: 16),
                    ),
                    IconButton(
                      icon: Icon(Icons.calendar_today_outlined, size: 20),
                      onPressed: () => _selectDate(context, true),
                      color: Colors.blue,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("To", style: TextStyle(fontSize: 16)),
                Row(
                  children: [
                    Text(
                      "${toDate.toLocal()}".split(' ')[0],
                      style: TextStyle(fontSize: 16),
                    ),
                    IconButton(
                      icon: Icon(Icons.calendar_today_outlined, size: 20),
                      onPressed: () => _selectDate(context, false),
                      color: Colors.blue,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Text("Weekdays", style: TextStyle(fontSize: 16)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: dayMapping.entries.map((entry) {
                    int index = entry.key;
                    String day = entry.value;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedWeekdays[index] = !selectedWeekdays[index];
                        });
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: () {
                            if (selectedWeekdays[index]) {
                              return Colors.blue;
                            } else {
                              return Colors.grey.shade300;
                            }
                          }(),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          day,
                          style: TextStyle(
                            fontSize: 16,
                            color: () {
                              if (selectedWeekdays[index]) {
                                return Colors.white;
                              } else {
                                return Colors.black;
                              }
                            }(),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("From", style: TextStyle(fontSize: 16)),
                Row(
                  children: [
                    Text(
                      "${fromTime.format(context)}",
                      style: TextStyle(fontSize: 16),
                    ),
                    IconButton(
                      icon: Icon(Icons.access_time_outlined, size: 20),
                      onPressed: () => _selectTime(context, true),
                      color: Colors.blue,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("To", style: TextStyle(fontSize: 16)),
                Row(
                  children: [
                    Text(
                      "${toTime.format(context)}",
                      style: TextStyle(fontSize: 16),
                    ),
                    IconButton(
                      icon: Icon(Icons.access_time_outlined, size: 20),
                      onPressed: () => _selectTime(context, false),
                      color: Colors.blue,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  int fromTimeMin = fromTime.hour * 60 + fromTime.minute;
                  int toTimeMin = toTime.hour * 60 + toTime.minute;
                  // from date and time must be before than to date and time
                  if(fromDate.isAfter(toDate) || (fromDate.isAtSameMomentAs(toDate)) && (fromTimeMin > toTimeMin)){
                    _showWarning(context);
                  }else{
                    setState(() {
                      List<int> localWeek = [];
                      widget.userGroup.schedule.fromTime = fromTime;
                      widget.userGroup.schedule.toDate = toDate;
                      widget.userGroup.schedule.fromDate = fromDate;
                      widget.userGroup.schedule.toTime = toTime;
                      for (int i = DateTime.monday; i < DateTime.sunday+1; i++) {
                        if (selectedWeekdays[i]){
                          localWeek.add(i);
                        }
                      }
                      widget.userGroup.schedule.weekdays = List<int>.from(localWeek);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Saved')),
                    );
                  }
                },
                child: const Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:senior_project/core/presentation/screens/event_screen.dart';


class ScheduleScreen extends StatelessWidget {
  final DateTime date;

  ScheduleScreen({required this.date});

  @override
  Widget build(BuildContext context) {
    List<String> hours = List.generate(24, (index) {
      return '${index % 12 == 0 ? 12 : index % 12} ${index >= 12 ? 'PM' : 'AM'}';
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Time"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Select a time for ${date.toLocal()}'),
          Expanded(
            child: ListView.builder(
              itemCount: hours.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(hours[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventConfirmationScreen(
                          date: date,
                          time: hours[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

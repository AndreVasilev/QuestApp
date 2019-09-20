import 'package:flutter/material.dart';
import 'package:quest/src/locations.dart';

class TaskSection extends StatefulWidget {
  TaskSection(
      this.office,
      this.progress,
  );

  final Office office;
  final String progress;

  @override
  _TaskSectionState createState() => _TaskSectionState();
}

class _TaskSectionState extends State<TaskSection> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    widget.office.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  widget.office.address,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                Text(widget.progress),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class Task {
  String title;
  String description;
  String taskDate;
  String taskTime;
  IconData taskIcon;
  Color iconColor;
  String iconName;
  String state;

  Task({
    required this.title,
    required this.description,
    required this.taskDate,
    required this.taskTime,
    required this.taskIcon,
    required this.iconColor,
    required this.iconName,
    required this.state,
  });

  // Convert a Task into a Map. The keys must correspond to the column names in the database.
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'taskDate': taskDate,
      'taskTime': taskTime,
      'taskIcon': taskIcon.codePoint,
      'iconColor': iconColor.value,
      'iconName': iconName,
      'state': state,
    };
  }

  // Implement toString to make it easier to see information about each task when using the print statement.
  @override
  String toString() {
    return 'Task{ title: $title, description: $description, taskDate: $taskDate, taskTime: $taskTime, taskIcon: $taskIcon, iconColor: $iconColor, iconName: $iconName, state: $state}';
  }

  // Convert a Map into a Task.
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'],
      description: map['description'],
      taskDate: map['taskDate'],
      taskTime: map['taskTime'],
      taskIcon: IconData(map['taskIcon'], fontFamily: 'MaterialIcons'),
      iconColor: Color(map['iconColor']),
      iconName: map['iconName'],
      state: map['state'],
    );
  }
}

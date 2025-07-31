import 'package:equatable/equatable.dart';


class Task extends Equatable{
  final String title;
  final int icon;
  final String color;
  final List<dynamic>? todos;

  const Task(
      {required this.icon,
      required this.title,
      required this.color,
      this.todos});

  Task copyWith({
    String? title,
    String? color,
    int? icon,
    List<dynamic>? todos,
  }) =>
      Task(
          icon: icon ?? this.icon,
          title: title ?? this.title,
          color: color ?? this.color,
          todos: todos ?? this.todos);

  factory Task.fromJson(Map<String, dynamic> json) =>
      Task(icon: json['icon'],
          title: json['title'],
          color: json['color'],
          todos: json['todos']
      );
  Map<String,dynamic> toJson() => {
    'title': title,
    'icon': icon,
    'color':color,
    'todos': todos
  };

  @override
  // TODO: implement props
  List<Object?> get props => [title, icon, color];
}

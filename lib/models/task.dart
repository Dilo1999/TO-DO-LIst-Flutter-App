class Task {
  final int? id;
  final String title;
  final String description;
  final String date; // Added date field

  Task({
    this.id,
    required this.title,
    this.description = '',
    required this.date, // Required date field
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'] ?? '',
      date: map['date'],
    );
  }

  Task copyWith({
    int? id,
    String? title,
    String? description,
    String? date,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
    );
  }
}

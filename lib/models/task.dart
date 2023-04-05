class Task {
  final String name;
  final int reward;
  String description = "";
  final DateTime deadline;
  bool isCompleted = false;
  // final Child child;

  Task(this.name, this.reward, this.deadline,
      {String? description, bool? isCompleted}) {
    if (description != null) this.description = description;
    if (isCompleted != null) this.isCompleted = isCompleted;
  }
}

class Task {
  late final String id;
  late final String title;
  late final String? description;
  late final int reward;
  late bool isDone;

  Task(Map<String, dynamic> dbTask) {
    id = dbTask["id"];
    title = dbTask["title"];
    description = dbTask["description"];
    reward = dbTask["reward"].runtimeType == String
        ? int.parse(dbTask["reward"])
        : dbTask["reward"];
    isDone = dbTask["isDone"];
  }

  @override
  String toString()
  {
    return "Title: $title, Description: $description, Reward: $reward, isDone: $isDone\n";
  }
}

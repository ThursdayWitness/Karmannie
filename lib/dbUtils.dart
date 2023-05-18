import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/all.dart';

Future<Parent> getParent(String parentName) async {
  var db = FirebaseFirestore.instance;
  var collection = db.collection("Parent");
  var parentRef = await collection
      .where("name", isEqualTo: parentName)
      .get()
      .then((value) => value.docs[0]);
  var parentData = parentRef.data();
  parentData["id"] = parentRef.id;
  getChildren(parentRef);
  parentData["child"] = await getChildren(parentRef);
  return Parent(parentData);
}

Future<List<Child>> getChildren(
    QueryDocumentSnapshot<Map<String, dynamic>> parentRef) async {
  var db = FirebaseFirestore.instance;
  var collection = db.collection("Child");
  var children = parentRef.get("child");
  var result = List<Child>.empty(growable: true);
  for (var childRef in children) {
    var childData =
        await collection.doc(childRef.id).get().then((value) => value.data());
    if (childData != null) {
      var childName = childData["name"];
      var child = await getChild(childName);
      result.add(child);
    }
  }
  return result;
}

Future<Child> getChild(String childName) async {
  var db = FirebaseFirestore.instance;
  var collection = db.collection("Child");
  var childRef = await collection
      .where("name", isEqualTo: childName)
      .get()
      .then((value) => value.docs[0]);
  var childData = childRef.data();
  childData["id"] = childRef.id;
  childData["task"] = await getTasks(childRef);
  return Child(childData);
}

Future<Child> getChildByCode(String code) async {
  var db = FirebaseFirestore.instance;
  var collection = db.collection("Child");
  var childRef = await collection
      .where("code", isEqualTo: code)
      .get()
      .then((value) => value.docs[0]);
  var childData = childRef.data();
  childData["id"] = childRef.id;
  childData["task"] = await getTasks(childRef);
  return Child(childData);
}

Future<List<Task>> getTasks(
    QueryDocumentSnapshot<Map<String, dynamic>> childRef) async {
  var db = FirebaseFirestore.instance;
  var collection = db.collection("Task");
  var childTasks = childRef.get("task");
  var result = List<Task>.empty(growable: true);
  for (var taskRef in childTasks) {
    var taskData =
        await collection.doc(taskRef.id).get().then((value) => value.data());
    if (taskData != null) {
      taskData["id"] = taskRef.id;
      var task = Task(taskData);
      result.add(task);
    }
  }
  return result;
}

void addTask(Map<String, dynamic> task, String childName) {
  var db = FirebaseFirestore.instance;
  var collection = db.collection("Task");
  DocumentReference<Map<String, dynamic>> taskRef;
  collection.add(task).then((value) {
    taskRef = value;
    assignToChild(childName, taskRef);
  });
}

void addChild(String childName, String code, String parentName) async {
  var child = {
    "name": childName,
    "balance": 0,
    "code": code,
    "task": List<dynamic>.empty(),
  };
  var collection = FirebaseFirestore.instance.collection("Child");
  DocumentReference<Map<String, dynamic>> childRef;
  collection.add(child).then((value) {
    childRef = value;
    assignToParent(parentName, childRef);
  });
}

void assignToParent(
    String parentName, DocumentReference<Map<String, dynamic>> child) async {
  var db = FirebaseFirestore.instance;
  var collection = db.collection("Parent");
  var parentRef = await collection
      .where("name", isEqualTo: parentName)
      .get()
      .then((value) => value.docs[0]);
  var children = parentRef.get("child") as List<dynamic>;
  children.add(child);
  parentRef.reference.update({"child": children});
}

void assignToChild(
    String childName, DocumentReference<Map<String, dynamic>> task) async {
  var db = FirebaseFirestore.instance;
  var collection = db.collection("Child");
  var childRef = await collection
      .where("name", isEqualTo: childName)
      .get()
      .then((value) => value.docs[0]);
  var childTasks = childRef.get("task") as List<dynamic>;
  childTasks.add(task);
  childRef.reference.update({"task": childTasks});
}

void completeTask(Task task) {
  var db = FirebaseFirestore.instance;
  db.doc("Task/${task.id}").update({"isDone": true});
}

void reviewTask(Task task) {
  var db = FirebaseFirestore.instance;
  db.doc("Task/${task.id}").update({"isRewied": true});
}

void deleteTask(Task task) {
  var db = FirebaseFirestore.instance;
  db.doc("Task/${task.id}").delete();
}

void rewardChild(Child child, int amount) async {
  var db = FirebaseFirestore.instance;
  db.doc("Child/${child.id}").update({"balance": child.balance + amount});
  // var childRef =
  //     await collection.where("name", isEqualTo: child.name).get().then((value) {
  //       print("Balance:\t${value.docs[0]["balance"]}");
  //   return value.docs[0];
  // });
  // childRef.reference.update({"balance": child.balance + amount});
}

import 'dart:io';

List<Map<String, dynamic>> students = [];

void main() {
  while (true) {
    print("----- Student Management System -----");
    print("1. Add Student");
    print("2. View All Students");
    print("3. Search Student");
    print("4. Delete Student");
    print("5. Exit");
    stdout.write("Enter your choice: ");
    String choice = stdin.readLineSync()!;

    switch (choice) {
      case "1":
        addStudent();
        break;
      case "2":
        viewAllStudents();
        break;
      case "3":
        searchStudent();
        break;
      case "4":
        deleteStudent();
        break;
      case "5":
        print("Exiting... Goodbye!");
        return;
      default:
        print("Invalid choice! Try again.\n");
    }
  }
}

void addStudent() {
  stdout.write("Enter student name: ");
  String name = stdin.readLineSync()!;

  List<int> marks = [];
  for (int i = 1; i <= 3; i++) {
    stdout.write("Enter marks of subject $i: ");
    int mark = int.parse(stdin.readLineSync()!);
    marks.add(mark);
  }

  int total = 0;
  for (int m in marks) {
    total += m;
  }

  double percentage = total / marks.length;

  String grade;
  if (percentage >= 90) {
    grade = "A";
  } else if (percentage >= 80) {
    grade = "B";
  } else if (percentage >= 70) {
    grade = "C";
  } else if (percentage >= 60) {
    grade = "D";
  } else {
    grade = "Fail";
  }

  students.add({
    "name": name,
    "marks": marks,
    "percentage": percentage,
    "grade": grade,
  });

  print("Student added successfully!\n");
}

void viewAllStudents() {
  if (students.isEmpty) {
    print("No students added yet!\n");
    return;
  }

  print("----- All Students -----");
  for (var s in students) {
    print("Name: ${s["name"]}");
    print("Marks: ${s["marks"]}");
    print("Percentage: ${s["percentage"].toStringAsFixed(2)}%");
    print("Grade: ${s["grade"]}");
    print("-------------------------");
  }
}

void searchStudent() {
  stdout.write("Enter student name to search: ");
  String name = stdin.readLineSync()!;

  for (var s in students) {
    if (s["name"].toLowerCase() == name.toLowerCase()) {
      print("----- Student Found -----");
      print("Name: ${s["name"]}");
      print("Marks: ${s["marks"]}");
      print("Percentage: ${s["percentage"].toStringAsFixed(2)}%");
      print("Grade: ${s["grade"]}");
      print("-------------------------\n");
      return;
    }
  }

  print("Student not found!\n");
}

void deleteStudent() {
  stdout.write("Enter student name to delete: ");
  String name = stdin.readLineSync()!;

  for (int i = 0; i < students.length; i++) {
    if (students[i]["name"].toLowerCase() == name.toLowerCase()) {
      students.removeAt(i);
      print("Student deleted successfully!\n");
      return;
    }
  }

  print("Student not found!\n");
}

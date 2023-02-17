import 'dart:io';
import 'dart:math';
import 'models/login.dart';
import 'models/student.dart';
import 'models/teacher.dart';

void main(List<String> args) {
  /* ------------------------------- Muellimler ------------------------------- */
  Teacher teacherOne = Teacher();
  teacherOne.firstName = 'Aqil';
  teacherOne.lastName = 'Abbasov';
  teacherOne.age = 35;

  Teacher teacherTwo = Teacher();
  teacherTwo.firstName = 'Ulviyya';
  teacherTwo.lastName = 'Abdulla';
  teacherTwo.age = 32;

  List<Teacher> teachers = [teacherOne, teacherTwo];
  /* -------------------------------------------------------------------------- */

  /* -------------------------------- Telebeler ------------------------------- */
  Student studentOne = Student();
  studentOne.firstName = 'Ramin';
  studentOne.lastName = 'Safarli';
  studentOne.age = 21;
  studentOne.isStudent = true;

  Student studentTwo = Student();
  studentTwo.firstName = 'Samid';
  studentTwo.lastName = 'Samadzada';
  studentTwo.age = 23;
  studentTwo.isStudent = true;

  List<Student> students = [studentOne, studentTwo];
  /* -------------------------------------------------------------------------- */

  Login login = Login();
  bool loginOrNot;

  do {
    stdout.write("Username daxil edin: ");
    String? enteredUsername = stdin.readLineSync()!;

    stdout.write("Sifrenizi daxil edin: ");
    String? enteredPassword = stdin.readLineSync()!;

    loginOrNot = login.isLogin(enteredUsername, enteredPassword);

    if (!loginOrNot) {
      print('Istifadeci adiniz ve ya sifreniz yanlisdir!');
    }
  } while (!loginOrNot);

  first:
  while (true) {
    print(
        'Uzerinde emeliyyat aparmaq istediyiniz bolmeni secin. Proqramdan cixmaq ucun {3} duymesini basin :\n' +
            '1. Muellimler\n' +
            '2. Telebeler');
    String? operation = stdin.readLineSync()!;

    switch (operation) {
      case '1':
        print('########## Muellimler ##########');
        teacher:
        while (true) {
          stdout.write(
              'Muellimlerin siyahisini gormek ucun {1}, yenisini yaratmaq ucun {2}, geriye qayitmaq ucun {3} duymesini basin: ');
          String? step = stdin.readLineSync()!;
          if (step == '1') {
            showAllTeachers(teachers);
          } else if (step == '2') {
            createTeacher(teachers);
            print("*********************");
            showAllTeachers(teachers);
            continue teacher;
          } else if (step == '3') {
            continue first;
          } else {
            printError();
            continue teacher;
          }
        }
      case '2':
        print('########## Telebeler ##########');
        student:
        while (true) {
          stdout.write(
              'Telebelerin siyahisini gormek ucun {1}, yenisini yaratmaq ucun {2}, geriye qayitmaq ucun {3} duymesini basin: ');
          String? step = stdin.readLineSync()!;
          if (step == '1') {
            showAllStudents(students);
          } else if (step == '2') {
            createStudent(students);
            print("*********************");
            showAllStudents(students);
            continue student;
          } else if (step == '3') {
            continue first;
          } else {
            printError();
            continue student;
          }
        }
      case '3':
        print('Proqram bitdi!');
        return;
      default:
        printError();
        continue first;
    }
  }
}

void createTeacher(List<Teacher> teachers) {
  String? objectName;
  int random = Random().nextInt(10000);
  objectName = '$random-teacher';

  stdout.write("Ad daxil edin: ");
  String? studentName = stdin.readLineSync()!;

  stdout.write("Soyad daxil edin: ");
  String? studentSurname = stdin.readLineSync()!;

  stdout.write("Yas daxil edin: ");
  String? studentAge = stdin.readLineSync()!;

  Teacher $objectName = Teacher();
  $objectName.firstName = studentName;
  $objectName.lastName = studentSurname;
  $objectName.age = int.parse(studentAge);

  teachers.add($objectName);

  print('Muellim ugurla elave edildi!');
}

void showAllTeachers(List<Teacher> teachers) {
  for (var i = 0; i < teachers.length; i++) {
    print('${i + 1}. ${teachers[i].firstName} ${teachers[i].lastName}');
  }
}

void createStudent(List<Student> students) {
  String? objectName;
  int random = Random().nextInt(10000);
  objectName = '$random-student';

  stdout.write("Ad daxil edin: ");
  String? studentName = stdin.readLineSync()!;

  stdout.write("Soyad daxil edin: ");
  String? studentSurname = stdin.readLineSync()!;

  stdout.write("Yas daxil edin: ");
  String? studentAge = stdin.readLineSync()!;

  stdout.write("Telebedirse {y} deyilse {n} basin: ");
  String? isStudentOrNot = stdin.readLineSync()!;

  Student $objectName = Student();
  $objectName.firstName = studentName;
  $objectName.lastName = studentSurname;
  $objectName.age = int.parse(studentAge);
  $objectName.isStudent = (isStudentOrNot == 'y' ? true : false);

  students.add($objectName);

  print('Telebe ugurla elave edildi!');
}

void showAllStudents(List<Student> students) {
  for (var i = 0; i < students.length; i++) {
    print('${i + 1}. ${students[i].firstName} ${students[i].lastName}');
  }
}

void printError() {
  print('Invalid input, try again!');
}

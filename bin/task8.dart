import 'dart:io';

void main() {
  Student s1 = Student(
    name: 'kerolos',
    id: '2020',
    level: 4,
    marks: 100,
  );
  sentanceDraw('TASK 1');
  print('marks : ${s1.marks}');
  s1.bonus(10);
  print('marks after bonus : ${s1.marks}');
  s1.minus(20);
  print('marks after minus : ${s1.marks}');

  School school = School(
    name: 'Tabery el hegaz',
    address: 'el hegaz st masr el gedida',
    girlsGroub: [],
    boysGroub: [],
    phone: '0123456',
    // email: 'Shcool@gmail.com',
  );
  sentanceDraw('TASK 2');
  school.addStudent(
    'Kerolos',
    'm',
    17,
  );

  school.addStudent(
    'girl1',
    'f',
    17,
  );
  school.info();
  school.removeStudent('girl1');
  school.info();
}

//Task 1
class Student {
  String name;
  String id;
  int level;
  double marks;
  String? email;
  String? phone;
  Student({
    required this.name,
    required this.id,
    required this.level,
    required this.marks,
    this.email,
    this.phone,
  });

  double bonus(double increase) {
    marks += increase;
    return marks;
  }

  double minus(double decrease) {
    marks -= decrease;
    return marks;
  }
}

//Task 2
class School {
  String name;
  String address;
  String? email;
  String? phone;
  List girlsGroub;
  List boysGroub;

  School({
    required this.name,
    required this.address,
    this.email,
    this.phone,
    required this.girlsGroub,
    required this.boysGroub,
  });

  void addStudent(
    String userName,
    String gender,
    int age,
  ) {
    if (gender == 'm') {
      if (age > 6 && age < 18) {
        if (!boysGroub.contains(userName)) {
          boysGroub.add(userName);
          print('$userName is added successfully');
        } else {
          print('$userName is already exist');
        }
      } else {
        print('This $age is not suitable in this school');
      }
    } else if (gender == 'f') {
      if (age > 6 && age < 18) {
        if (!girlsGroub.contains(userName)) {
          girlsGroub.add(userName);
          print('$userName is added successfully');
        } else {
          print('$userName is already exist');
        }
      } else {
        print('This $age is not suitable in this school');
      }
    } else {
      print('$gender is not correct');
    }
  }

  void removeStudent(String userName) {
    // for (var element in boysGroub) {
    //   if (element == userName) {
    //     boysGroub.remove(userName);
    //     print('$userName , removed successfully');
    //   }
    // }
    if (boysGroub.contains(userName)) {
      boysGroub.remove(userName);
      print('$userName , removed successfully');
    } else if (girlsGroub.contains(userName)) {
      girlsGroub.remove(userName);
      print('$userName , removed successfully');
    } else {
      print('$userName does not exist !');
    }
    // boysGroub.contains(userName) ?  : 0;
    // for (var element in girlsGroub) {
    //   if (element == userName) {
    //     girlsGroub.remove(userName);
    //     print('$userName , removed successfully');
    //   } else {
    //     print('$userName does not exist !');
    //   }
    // }
    // girlsGroub.contains(userName)
    //     ? girlsGroub.remove(userName)
    //     : print('$userName does not exist !');
  }

  void info() {
    sentanceDraw('Information of Shcool');
    email == null && phone == null
        ? print(
            '$name School in address $address \nhas boys groub $boysGroub and girls groub $girlsGroub')
        : 0;
    email != null && phone != null
        ? print(
            '$name School in address $address \nhas boys groub $boysGroub and girls groub $girlsGroub\nemail : $email phone : $phone')
        : 0;
    email != null && phone == null
        ? print(
            '$name School in address $address \nhas boys groub $boysGroub and girls groub $girlsGroub \nemail : $email')
        : 0;

    email == null && phone != null
        ? print(
            '$name School in address $address \nhas boys groub $boysGroub and girls groub $girlsGroub \nphone : $phone')
        : 0;
  }
}

void sentanceDraw(String s) {
  for (int i = 0; i < (s.length + 4); i++) {
    stdout.write('-');
  }
  print('\n| $s |');
  for (int i = 0; i < (s.length + 4); i++) {
    stdout.write('-');
  }
  print('');
}

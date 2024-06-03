// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final nameController = TextEditingController();
//   final ageController = TextEditingController();
//   late SharedPreferences preferences;

//   String name = '';
//   String age = '';
//   List? colors;

//   @override
//   void initState() {
//     super.initState();
//     initPrefs();
//   }

//   void initPrefs() async {
//     preferences = await SharedPreferences.getInstance();
//   }

//   Future<void> saveString() async {
//     await preferences.setString("name", nameController.text);
//     setState(() {
//       name = nameController.text;
//     });
//   }

//   Future<void> saveColors() async {
//     await preferences.setStringList(
//       "colors",
//       <String>[ageController.text],
//     );
//   }

//   Future<List<String>?> getColors() async {
//     setState(() {
//       return preferences.getStringList("colors");
//     });
//   }

//   Future<void> getString() async {
//     setState(() {
//       name = preferences.getString("name") ?? '';
//     });
//     print(name);
//   }

//   Future<void> saveAge() async {
//     final ageText = ageController.text;
//     if (ageText.isNotEmpty && int.tryParse(ageText) != null) {
//       await preferences.setInt("age", int.parse(ageText));
//       setState(() {
//         age = ageText;
//       });
//     }
//   }

//   Future<void> getAge() async {
//     setState(() {
//       age = preferences.getInt("age")?.toString() ?? '';
//     });
//     print(age);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Home page"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: nameController,
//               decoration: const InputDecoration(
//                 labelText: 'Name',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             TextField(
//               controller: ageController,
//               decoration: const InputDecoration(
//                 labelText: 'Age',
//                 border: OutlineInputBorder(),
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             const SizedBox(height: 16.0),
//             Text('Name: $name'),
//             Text('Age: $age'),
//           ],
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           FloatingActionButton(
//             onPressed: saveString,
//             child: const Icon(Icons.add),
//           ),
//           const SizedBox(width: 50),
//           const SizedBox(width: 50),
//           FloatingActionButton(
//             onPressed: saveAge,
//             child: const Icon(Icons.view_agenda),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  late SharedPreferences preferences;

  String name = '';
  String age = '';
  List<String> colors = [];

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  void initPrefs() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<void> saveString() async {
    await preferences.setString("name", nameController.text);
    setState(() {
      name = nameController.text;
    });
  }

  Future<void> getString() async {
    setState(() {
      name = preferences.getString("name") ?? '';
    });
    print(name);
  }

  Future<void> saveAge() async {
    final ageText = ageController.text;
    if (ageText.isNotEmpty && int.tryParse(ageText) != null) {
      await preferences.setInt("age", int.parse(ageText));
      setState(() {
        age = ageText;
      });
    }
  }

  Future<void> getAge() async {
    setState(() {
      age = preferences.getInt("age")?.toString() ?? '';
    });
    print(age);
  }

  Future<void> saveColors() async {
    await preferences.setStringList("colors", [ageController.text]);
    setState(() {
      colors = [ageController.text];
    });
  }

  Future<void> getColors() async {
    setState(() {
      colors = preferences.getStringList("colors") ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            Text('Saved Name: $name'),
            Text('Saved Age: $age'),
            const SizedBox(height: 16.0),
            Builder(builder: (context) {
              return Text(colors[0].split(",").join("\n"));
            }),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: saveColors,
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 50),
          FloatingActionButton(
            onPressed: getColors,
            child: const Icon(Icons.e_mobiledata),
          ),
        ],
      ),
    );
  }
}

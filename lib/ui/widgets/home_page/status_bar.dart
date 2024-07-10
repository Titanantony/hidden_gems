import 'package:flutter/material.dart';

class statusBar extends StatelessWidget {
  const statusBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const StatusBar([
      {'username': '_a.nita.h', 'imagePath': 'assets/images/pic_1.jpeg'},
      {'username': '_issrissa', 'imagePath': 'assets/images/pic_2.jpeg'},
      {
        'username': '___c.h.e.c.h.e___',
        'imagePath': 'assets/images/pic_3.jpeg'
      },
      {'username': '_mal.emba', 'imagePath': 'assets/images/pic_5.jpeg'},
      {'username': '_mal.emba', 'imagePath': 'assets/images/pic_6.jpeg'},
      {'username': '_mal.emba', 'imagePath': 'assets/images/pic_7.jpeg'},
    ]);
  }
}

class StatusBar extends StatelessWidget {
  final List<Map<String, String>> statuses;

  const StatusBar(this.statuses);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: statuses.length,
        itemBuilder: (context, index) {
          final status = statuses[index];
          final username = status['username'] ?? 'Unknown';
          final imagePath = status['imagePath'] ??
              ''; // Provide a default empty string if null

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: StatusItem(
              username: username,
              imagePath: imagePath,
            ),
          );
        },
      ),
    );
  }
}

class StatusItem extends StatelessWidget {
  final String username;
  final String imagePath;

  const StatusItem._(this.username, this.imagePath);

  factory StatusItem({required String username, required String imagePath}) {
    return StatusItem._(username, imagePath);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Colors.red, Colors.purple, Colors.orange],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: ClipOval(
                  child: imagePath.isNotEmpty
                      ? Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                        )
                      : const Icon(Icons.person,
                          size: 50), // Placeholder if imagePath is empty
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(username, style: const TextStyle(color: Colors.black)),
      ],
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// // import 'package:firebase_auth/firebase_auth.dart';

// // class UserInfoWidget extends StatelessWidget {
// //   const UserInfoWidget({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return StreamBuilder<User?>(
// //       stream: FirebaseAuth.instance.authStateChanges(),
// //       builder: (context, snapshot) {
// //         if (snapshot.connectionState == ConnectionState.active) {
// //           User? user = snapshot.data;
// //           if (user != null) {
// //             return Text(
// //               'Welcome, ${user.displayName ?? user.email ?? 'User'}',
// //               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //             );
// //           } else {
// //             return const Text('Not logged in');
// //           }
// //         }
// //         return const CircularProgressIndicator();
// //       },
// //     );
// //   }
// // }

// class StatusBarPage extends StatelessWidget {
//   const StatusBarPage({super.key});

//   Future<List<Map<String, String>>> fetchStatuse() async {
//     QuerySnapshot snapshot =
//         await FirebaseFirestore.instance.collection('statuse').get();
//     List<Map<String, String>> statuse = [];

//     for (var doc in snapshot.docs) {
//       String username = doc['username'];
//       String imagePath = doc['imagePath'];
//       String imageUrl =
//           await FirebaseStorage.instance.ref(imagePath).getDownloadURL();

//       statuse.add({
//         'username': username,
//         'imageUrl': imageUrl,
//       });
//     }
//     return statuse;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Map<String, String>>>(
//       future: fetchStatuse(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return const Center(child: Text('No statuse found'));
//         } else {
//           return StatusBar(snapshot.data!);
//         }
//       },
//     );
//   }
// }

// class StatusBar extends StatelessWidget {
//   final List<Map<String, String>> statuse;

//   const StatusBar(this.statuse, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 110,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: statuse.length,
//         itemBuilder: (context, index) {
//           final status = statuse[index];
//           final username = status['username'] ?? 'Unknown';
//           final imageUrl = status['imageUrl'] ?? '';

//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: StatusItem(
//               username: username,
//               imageUrl: imageUrl,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class StatusItem extends StatelessWidget {
//   final String username;
//   final String imageUrl;

//   const StatusItem._(this.username, this.imageUrl);

//   factory StatusItem({required String username, required String imageUrl}) {
//     return StatusItem._(username, imageUrl);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           width: 70,
//           height: 70,
//           decoration: const BoxDecoration(
//             shape: BoxShape.circle,
//             gradient: LinearGradient(
//               colors: [Colors.red, Colors.purple, Colors.orange],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(3.0),
//             child: Container(
//               decoration: const BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.white,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(2.0),
//                 child: ClipOval(
//                   child: imageUrl.isNotEmpty
//                       ? Image.network(
//                           imageUrl,
//                           fit: BoxFit.cover,
//                         )
//                       : const Icon(Icons.person,
//                           size: 50), // Placeholder if imageUrl is empty
//                 ),
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(height: 8),
//         Text(username, style: const TextStyle(color: Colors.black)),
//       ],
//     );
//   }
// }

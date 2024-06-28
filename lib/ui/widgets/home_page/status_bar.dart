import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StatusBarPage extends StatelessWidget {
  const StatusBarPage({super.key});

  Future<List<Map<String, String>>> fetchStatuses() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return [];
    }

    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('statuse')
        .where('username',
            isEqualTo: user.uid) // Assuming username is user's UID
        .get();
    List<Map<String, String>> statuses = [];

    for (var doc in snapshot.docs) {
      String username = doc['username'];
      String imagePath = doc['imagePath'];
      String imageUrl =
          await FirebaseStorage.instance.ref(imagePath).getDownloadURL();

      statuses.add({
        'username': username,
        'imageUrl': imageUrl,
      });
    }
    return statuses;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, String>>>(
      future: fetchStatuses(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No statuses found'));
        } else {
          return StatusBar(snapshot.data!);
        }
      },
    );
  }
}

class StatusBar extends StatelessWidget {
  final List<Map<String, String>> statuses;

  const StatusBar(this.statuses, {super.key});

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
          final imageUrl = status['imageUrl'] ?? '';

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: StatusItem(
              username: username,
              imageUrl: imageUrl,
            ),
          );
        },
      ),
    );
  }
}

class StatusItem extends StatelessWidget {
  final String username;
  final String imageUrl;

  const StatusItem._(this.username, this.imageUrl);

  factory StatusItem({required String username, required String imageUrl}) {
    return StatusItem._(username, imageUrl);
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
                  child: imageUrl.isNotEmpty
                      ? Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                        )
                      : const Icon(Icons.person,
                          size: 50), // Placeholder if imageUrl is empty
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

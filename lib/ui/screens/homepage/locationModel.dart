import 'package:cloud_firestore/cloud_firestore.dart';

class Location {
  final String id;
  final String title;
  final String subtitle;
  final String distance;
  final List<String> imagePaths;
  bool isLiked;
  bool isSaved;
  final bool isOpen;
  final String description;
  final String type;
  int likesCount;
  int sharedCount;
  int savedCount;

  Location({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.distance,
    required this.imagePaths,
    required this.isLiked,
    required this.isSaved,
    required this.isOpen,
    required this.description,
    required this.type,
    required this.likesCount,
    required this.sharedCount,
    required this.savedCount,
  });

  factory Location.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Location(
      id: doc.id,
      title: data['title'] ?? '',
      subtitle: data['subtitle'] ?? '',
      distance: data['distance'] ?? '',
      imagePaths: List<String>.from(data['imagePath'] ?? []),
      isLiked: _parseBool(data['isLiked']),
      isSaved: _parseBool(data['isSaved']),
      isOpen: _parseBool(data['isOpen']),
      description: data['description'] ?? '',
      type: data['type'] ?? '',
      likesCount: data['likesCount'] ?? 0,
      sharedCount: data['sharedCount'] ?? 0,
      savedCount: data['savedCount'] ?? 0,
    );
  }

  static bool _parseBool(dynamic value) {
    if (value is bool) {
      return value;
    } else if (value is String) {
      return value.toLowerCase() == 'true';
    } else {
      return false;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'distance': distance,
      'imagePath': imagePaths,
      'isLiked': isLiked,
      'isSaved': isSaved,
      'isOpen': isOpen,
      'description': description,
      'type': type,
      'likesCount': likesCount,
      'sharedCount': sharedCount,
      'savedCount': savedCount,
    };
  }
}

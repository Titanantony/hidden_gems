import 'package:cloud_firestore/cloud_firestore.dart';

class ExploreLocation {
  final String id;
  final String location; // This corresponds to 'title' in the database
  final String
      imageUrl; // This will be the first image from 'imagePath' in the database
  final double rating; // This corresponds to 'average_rating' in the database
  final double pricing; // This corresponds to 'price' in the database

  ExploreLocation({
    required this.id,
    required this.location,
    required this.imageUrl,
    required this.rating,
    required this.pricing,
  });

  factory ExploreLocation.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>? ?? {};
    List<String> imagePaths = List<String>.from(data['imagePath'] ?? []);
    return ExploreLocation(
      id: doc.id,
      location: data['title'] ?? 'Unknown Location',
      imageUrl: imagePaths.isNotEmpty ? imagePaths.first : '',
      rating: (data['average_rating'] ?? 0).toDouble(),
      pricing: (data['price'] ?? 0).toDouble(),
    );
  }
}

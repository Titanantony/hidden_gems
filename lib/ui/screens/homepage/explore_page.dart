import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hidden_gems/ui/screens/homepage/exoloreLocation.dart';
import 'package:shimmer/shimmer.dart';

// Abstract Product
abstract class ExplorePageContent {
  Widget buildLocationSelector();
  Widget buildSearchBar();
  Future<Widget> buildPopularPlaces();
  Widget buildSort();
  Future<Widget> buildRecommendations();
}

// Abstract Creator
abstract class ExplorePageFactory {
  ExplorePageContent createContent();
}

// Concrete Product
class FirebaseExplorePageContent implements ExplorePageContent {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget buildLocationSelector() {
    return FutureBuilder<DocumentSnapshot>(
      future:
          _firestore.collection('app_settings').doc('current_location').get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return const Text('Error loading location');
        }
        final data = snapshot.data?.data() as Map<String, dynamic>?;
        final location = data?['name'] ?? 'Unknown Location';
        return Row(
          children: [
            const Icon(Icons.location_on, color: Colors.black),
            const SizedBox(width: 8),
            Text(location, style: const TextStyle(color: Colors.black)),
          ],
        );
      },
    );
  }

  @override
  Widget buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  @override
  Future<Widget> buildPopularPlaces() async {
    return FutureBuilder<QuerySnapshot>(
      future: _firestore
          .collection('recreation_spots')
          .orderBy('average_rating', descending: true)
          .limit(5)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildShimmerPopularPlaces(); // Show loading shimmer
        }

        if (snapshot.hasError) {
          return const Text(
              'Error loading popular places'); // Show error message
        }

        // Ensure that the snapshot has data and isn't empty
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Text(
              'No popular places found'); // Show fallback for empty data
        }

        // Map the Firestore documents to ExploreLocation instances
        final places = snapshot.data!.docs
            .map((doc) => ExploreLocation.fromFirestore(doc))
            .toList();

        // Build the UI for popular places
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular places',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: places.length,
                itemBuilder: (context, index) {
                  final place = places[index];
                  return _buildPopularPlaceCard(
                    place.location,
                    place.rating,
                    place.imageUrl,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPopularPlaceCard(String name, double rating, String imageUrl) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              width: 300,
              height: 200,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: 300,
                  height: 200,
                  color: Colors.white,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.black.withOpacity(0.6),
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  color: Colors.black.withOpacity(0.6),
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        rating.toStringAsFixed(1),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerPopularPlaces() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 20,
            color: Colors.white,
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  width: 300,
                  height: 200,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildSort() {
    return FutureBuilder<QuerySnapshot>(
      future: _firestore.collection('sort_options').get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return const Text('Error loading sort options');
        }
        final sortOptions =
            snapshot.data?.docs.map((doc) => doc['name'] as String).toList() ??
                [];
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: sortOptions.map((option) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: ElevatedButton(
                  onPressed: () {
                    print('$option selected');
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(option),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  @override
  Future<Widget> buildRecommendations() async {
    return FutureBuilder<QuerySnapshot>(
      future: _firestore.collection('recreation_spots').get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildShimmerRecommendations();
        }
        if (snapshot.hasError) {
          return const Text('Error loading recommendations');
        }
        final recommendations = snapshot.data?.docs
                .map((doc) => ExploreLocation.fromFirestore(doc))
                .toList() ??
            [];
        return Expanded(
          child: ListView.builder(
            itemCount: recommendations.length,
            itemBuilder: (context, index) {
              final recommendation = recommendations[index];
              return _buildRecommendationCard(
                recommendation.location,
                'Location details', // You might want to add a field for this in your database
                recommendation.rating.toString(),
                recommendation.pricing.toString(),
                recommendation.imageUrl,
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildRecommendationCard(String title, String location, String rating,
      String price, String imageUrl) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 60,
                    height: 60,
                    color: Colors.white,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 14),
                      const SizedBox(width: 4),
                      Text(location),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 14),
                      const SizedBox(width: 4),
                      Text(rating),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Avg cost"),
                Text("\$$price per Person"),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerRecommendations() {
    return Expanded(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              child: Container(
                height: 80,
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}

// Concrete Creator
class FirebaseExplorePageFactory implements ExplorePageFactory {
  @override
  ExplorePageContent createContent() {
    return FirebaseExplorePageContent();
  }
}

// ExplorePage Widget
class ExplorePage extends StatelessWidget {
  final ExplorePageFactory factory;

  ExplorePage({Key? key, ExplorePageFactory? factory})
      : factory = factory ?? FirebaseExplorePageFactory(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = factory.createContent();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: content.buildLocationSelector(),
        actions: [
          IconButton(
            icon: const Icon(Icons.currency_exchange),
            onPressed: () {
              // TODO: Implement currency exchange functionality
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            content.buildSearchBar(),
            const SizedBox(height: 10),
            FutureBuilder<Widget>(
              future: content.buildPopularPlaces(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                return snapshot.data ?? const SizedBox.shrink();
              },
            ),
            const SizedBox(height: 10),
            content.buildSort(),
            const SizedBox(height: 10),
            FutureBuilder<Widget>(
              future: content.buildRecommendations(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                return snapshot.data ?? const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hidden_gems/ui/screens/homepage/locationModel.dart';
import 'package:hidden_gems/ui/screens/homepage/locationProvider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late ScrollController _scrollController;
  late double _itemHeight;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LocationProvider>(context, listen: false).fetchLocations();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    int index = (_scrollController.offset / _itemHeight).round();
    if (index != _currentIndex) {
      setState(() => _currentIndex = index);
      _animateToIndex(index);
    }
  }

  void _animateToIndex(int index) {
    _scrollController.animateTo(
      index * _itemHeight,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    _itemHeight = MediaQuery.of(context).size.height * 0.65;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildStatusBar(),
            Expanded(child: _buildLocationList()),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'Favorites'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('For you',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text('See All', style: TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }

  Widget _buildStatusBar() {
    return Container(
      height: 100,
      color: Colors.grey[200],
      child: const Center(child: Text('Status Bar Placeholder')),
    );
  }

  Widget _buildLocationList() {
    return Consumer<LocationProvider>(
      builder: (context, locationProvider, child) {
        final locations = locationProvider.locations;
        return ListView.builder(
          controller: _scrollController,
          itemCount: locations.length,
          itemBuilder: (context, index) =>
              _buildLocationItem(locations[index], index),
        );
      },
    );
  }

  Widget _buildLocationItem(Location location, int index) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: _currentIndex == index ? 1.0 : 0.5,
      child: SizedBox(
        height: _itemHeight,
        child: _buildLocationCard(location),
      ),
    );
  }

  Widget _buildLocationCard(Location location) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 7,
            child: _buildImageCarousel(location.imagePaths),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          location.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          location.subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          location.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              location.isOpen
                                  ? Icons.access_time_filled
                                  : Icons.access_time,
                              color:
                                  location.isOpen ? Colors.green : Colors.red,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              location.isOpen ? "Open" : "Closed",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.location_on, size: 16),
                            Flexible(
                              child: Text(
                                location.distance,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildLikeButton(location),
                      _buildSaveButton(location),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCarousel(List<String> imagePaths) {
    return PageView.builder(
      itemCount: imagePaths.length,
      itemBuilder: (context, index) {
        return Image.network(
          imagePaths[index],
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              'assets/images/placeholder.jpg',
              fit: BoxFit.cover,
            );
          },
        );
      },
    );
  }

  Widget _buildLikeButton(Location location) {
    return Column(
      children: [
        IconButton(
          icon: Icon(
            location.isLiked ? Icons.favorite : Icons.favorite_border,
            color: location.isLiked ? Colors.red : null,
          ),
          onPressed: () {
            Provider.of<LocationProvider>(context, listen: false)
                .toggleLike(location.id);
          },
        ),
        if (location.likesCount > 0)
          Text(
            '${location.likesCount}',
            style: const TextStyle(fontSize: 12),
          ),
      ],
    );
  }

  Widget _buildSaveButton(Location location) {
    return IconButton(
      icon: Icon(
        location.isSaved ? Icons.bookmark : Icons.bookmark_border,
        color: location.isSaved ? Colors.blue : null,
      ),
      onPressed: () {
        Provider.of<LocationProvider>(context, listen: false)
            .toggleSave(location.id);
      },
    );
  }
}

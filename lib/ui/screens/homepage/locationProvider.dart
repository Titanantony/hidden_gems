import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hidden_gems/ui/screens/homepage/locationModel.dart';

class LocationProvider with ChangeNotifier {
  List<Location> _locations = [];
  List<Location> get locations => _locations;

  Future<void> fetchLocations() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('recreation_spots').get();
    _locations =
        snapshot.docs.map((doc) => Location.fromFirestore(doc)).toList();
    notifyListeners();
  }

  Future<void> toggleLike(String locationId) async {
    final index =
        _locations.indexWhere((location) => location.id == locationId);
    if (index != -1) {
      _locations[index].isLiked = !_locations[index].isLiked;
      _locations[index].likesCount += _locations[index].isLiked ? 1 : -1;
      notifyListeners();

      await FirebaseFirestore.instance
          .collection('recreation_spots')
          .doc(locationId)
          .update({
        'isLiked': _locations[index].isLiked,
        'likesCount': _locations[index].likesCount,
      });
    }
  }

  Future<void> toggleSave(String locationId) async {
    final index =
        _locations.indexWhere((location) => location.id == locationId);
    if (index != -1) {
      _locations[index].isSaved = !_locations[index].isSaved;
      _locations[index].savedCount += _locations[index].isSaved ? 1 : -1;
      notifyListeners();

      await FirebaseFirestore.instance
          .collection('recreation_spots')
          .doc(locationId)
          .update({
        'isSaved': _locations[index].isSaved,
        'savedCount': _locations[index].savedCount,
      });
    }
  }
}

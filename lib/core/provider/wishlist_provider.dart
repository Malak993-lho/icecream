import 'package:flutter/material.dart';

class WishlistProvider extends ChangeNotifier {
  final List<String> _wishlistItems = [];
  bool _hasNewItem = false; // ✅ Track new item notification

  List<String> get wishlistItems => _wishlistItems;
  bool get hasNewItem => _hasNewItem;

  void toggleWishlistItem(String imagePath) {
    if (_wishlistItems.contains(imagePath)) {
      _wishlistItems.remove(imagePath);
      _hasNewItem = _wishlistItems.isNotEmpty;
    } else {
      _wishlistItems.add(imagePath);
      _hasNewItem = true;
    }
    notifyListeners(); // ✅ Refresh UI
  }

  bool isInWishlist(String imagePath) {
    return _wishlistItems.contains(imagePath);
  }

  void removeFromWishlist(String imagePath) {
    if (_wishlistItems.contains(imagePath)) {
      _wishlistItems.remove(imagePath);
      _hasNewItem = _wishlistItems.isNotEmpty;
      notifyListeners(); // ✅ Notifies UI when an item is removed
    }
  }

  void clearNotification() {
    _hasNewItem = false; // ✅ Clears red dot
    notifyListeners(); // ✅ Notifies UI
  }
}

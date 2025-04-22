import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior_project/core/provider/wishlist_provider.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = context.watch<WishlistProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text("${wishlistProvider.wishlistItems.length} Wishlist"),
      ),
      body: wishlistProvider.wishlistItems.isEmpty
          ? const Center(child: Text("Your wishlist is empty."))
          : ListView.builder(
              itemCount: wishlistProvider.wishlistItems.length,
              itemBuilder: (context, index) {
                final imagePath = wishlistProvider.wishlistItems[index];
                final title = getImageTitle(imagePath); // ✅ Get correct title

                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // ✅ Image on the left
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          imagePath,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 15),

                      // ✅ Titles Section (Only shows the correct title)
                      Expanded(
                        child: Text(
                          title, // ✅ Correct title for each image
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      // ❌ Remove Button
                      IconButton(
                        icon: const Icon(Icons.remove_circle,
                            color: Colors.black, size: 28),
                        onPressed: () {
                          wishlistProvider.removeFromWishlist(imagePath);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }

  // 🔹 Function to return correct title based on image path
  String getImageTitle(String imagePath) {
    switch (imagePath) {
      case 'assets/kitchen1.jpg':
        return "Modern Kitchen Design";
      case 'assets/kitchen2.jpg':
        return "Classic Wooden Kitchen";
      case 'assets/dayri.jpg':
        return "Metal Magic Creation";
      default:
        return ""; // ❌ Empty string if image not recognized (no "Favorite Item")
    }
  }
}

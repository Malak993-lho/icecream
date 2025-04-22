import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import to access the WishlistProvider
import 'package:senior_project/core/presentation/screens/project_info_page.dart'; // Import the ProjectInfoPage
import 'package:senior_project/core/presentation/screens/profile_page.dart'; // Import the ProfilePage
import 'package:senior_project/core/provider/wishlist_provider.dart'; // Import WishlistProvider

class MetalMagicPage extends StatelessWidget {
  const MetalMagicPage({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = context.watch<WishlistProvider>(); // Access WishlistProvider

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // Background color of the app bar
        title: const Text('Metal Magic', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/home'); // Navigate to Home Screen
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Make the image clickable
          GestureDetector(
            onTap: () {
              // Navigate to MetalMagicPage when the image is tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MetalMagicPage()),
              );
            },
            child: Container(
              width: double.infinity,
              height: 600,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/dayri.jpg'), // Background image
                  fit: BoxFit.cover, // This ensures the image covers the space
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Profile Picture Section with the "Go to Project Info" button on the same line
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                // "Go to Project Info" Button on the left side
                ElevatedButton(
                  onPressed: () {
                    // Navigate to Project Info Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProjectInfoPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(), // Circular button shape
                    backgroundColor: Color(0xFF5C5C5C), // Color matching the button in the image
                    padding: const EdgeInsets.all(20), // Padding to make it circular
                  ),
                  child: const Text(
                    '^', // Use the actual "^" character here
                    style: TextStyle(
                      fontSize: 30, // Font size for the "^"
                      color: Colors.white, // Color of the text (same as button's text color)
                    ),
                  ),
                ),
                const SizedBox(width: 10),

                // Profile picture with bold border around it
                GestureDetector(
                  onTap: () {
                    // Navigate to Profile Page when the profile picture is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProfilePage()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black, // Border color
                        width: 1, // Border width (for boldness)
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 30, // Size of the circle
                      backgroundColor: Colors.white, // Background color of the circle
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'W', // The letter "W" in the center
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.red, // Color of the letter
                            ),
                          ),
                          SizedBox(height: 5), // Space between "W" and "For Metal"
                          Text(
                            'For Metal', // Text below "W"
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.normal,
                              color: Colors.black, // Color of the text
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Spacer to push the "Save" button to the far right
                const Spacer(),

                // "Save" Button aligned to the far right of the row (button contains heart + save)
                GestureDetector(
                  onTap: () {
                    // Toggle between adding/removing from wishlist when the button is clicked
                    wishlistProvider.toggleWishlistItem('assets/dayri.jpg');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Color(0xFF5C5C5C), // Background color of the button
                      borderRadius: BorderRadius.circular(8), // Slight roundness of the button
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          wishlistProvider.isInWishlist('assets/dayri.jpg')
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.white,
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Text color
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Back arrow or similar button (like in the image)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, '/home'); // Navigate to Home Screen
              },
            ),
          ),
        ],
      ),
    );
  }
}

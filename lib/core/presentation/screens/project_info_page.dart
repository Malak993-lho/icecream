import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart'; // Import this for TapGestureRecognizer
import 'replies_page.dart'; // Import the RepliesPage
import 'no_replies_page.dart'; // Import the NoRepliesPage

class ProjectInfoPage extends StatefulWidget {
  const ProjectInfoPage({super.key});

  @override
  _ProjectInfoPageState createState() => _ProjectInfoPageState();
}

class _ProjectInfoPageState extends State<ProjectInfoPage> {
  bool _isExpanded = false; // Flag to control the expanded text
  final TextEditingController _commentController = TextEditingController();

  final String shortDescription = 'This exquisite metal design was carefully crafted by a skilled metalworker, creating a luxurious and unique atmosphere for...';
  final String fullDescription = 'This exquisite metal design was carefully crafted by a skilled metalworker, creating a luxurious and unique atmosphere for the gold shop. The intricate details showcase expert craftsmanship, blending elegant metal designs with the shop’s golden decor to elevate the overall aesthetic. Perfect for creating an upscale, modern environment that highlights the beauty of both gold and metal artistry.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Info'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // First Section: Project Description
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Section with the same profile picture as in Metal Magic
                  Row(
                    children: [
                      // Profile picture with the bold border around it
                      GestureDetector(
                        onTap: () {
                          // Navigate to Profile Page when the profile picture is tapped
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black, // Border color
                              width: 2, // Border width (for boldness)
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
                      const SizedBox(width: 10),
                      // Name and MetalWorker on the same horizontal line
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Wassim Ibrahim',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'MetalWorker',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Title (Metalwork Design for Golden Shop: in bold)
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Metalwork Design for Golden Shop: ',
                          style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: _isExpanded ? fullDescription : shortDescription,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        TextSpan(
                          text: _isExpanded ? ' Read Less' : ' Read More',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            // Toggle the expanded text when "Read More" or "Read Less" is clicked
                            setState(() {
                              _isExpanded = !_isExpanded;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20), // Add space after the title

                  // "Other Photos in This Project" Section
                  const Text(
                    'Other Photos in This project',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  // Image Gallery
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Image.asset('assets/dayri.jpg', width: 150, height: 100, fit: BoxFit.cover),
                        SizedBox(width: 20),
                        Image.asset('assets/dayricroped.jpg', width: 150, height: 100, fit: BoxFit.cover),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // "View All 4 Photos" Button
                  TextButton(
                    onPressed: () {
                      // Action to view all photos
                    },
                    child: const Text(
                      'View All 4 Photos',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // "Related Projects" Section
                  const Text(
                    'Related Projects',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  // Related Projects Images
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Image.asset('assets/drabzin 1.jpg', width: 150, height: 100, fit: BoxFit.cover),
                        SizedBox(width: 10),
                        Image.asset('assets/beb w 2zez.jpg', width: 150, height: 100, fit: BoxFit.cover),
                        SizedBox(width: 10),
                        Image.asset('assets/drabzin 2.jpg', width: 150, height: 100, fit: BoxFit.cover),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Second Section: Comments and Add Comment
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '2 Comments about this photo',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),

                  // Comment 1 (Has replies) with GestureDetector on the whole comment or the profile icon
                  GestureDetector(
                    onTap: () {
                      // Navigate to RepliesPage when the comment or the profile icon is tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RepliesPage()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.blue,
                            child: const Text(
                              'A',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Can you create a similar design with a more minimalist touch while keeping the luxurious feel?',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            '2 Replies',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          IconButton(
                            icon: const Icon(Icons.reply, color: Colors.grey), // Reply icon
                            onPressed: () {
                              // Navigate to RepliesPage when reply icon is clicked
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const RepliesPage()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Comment 2 (No replies) with GestureDetector on the whole comment or the profile icon
                  GestureDetector(
                    onTap: () {
                      // Navigate to NoRepliesPage when the comment or the profile icon is tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NoRepliesPage()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.blue,
                            child: const Text(
                              'B',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'This metalwork design not only serves as a functional element but also as an eye-catching feature, elevating the overall aesthetic of the store.',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'No Replies',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          IconButton(
                            icon: const Icon(Icons.reply, color: Colors.grey), // Reply icon
                            onPressed: () {
                              // Navigate to NoRepliesPage when reply icon is clicked
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const NoRepliesPage()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Add Comment Section
                  const Text(
                    'Add Comment',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: 'Write your comment...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

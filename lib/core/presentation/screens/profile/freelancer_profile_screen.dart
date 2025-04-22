import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:senior_project/core/widgets/account_type.dart';
import 'package:senior_project/core/widgets/deleteaccount_fre.dart';
import 'package:senior_project/core/widgets/header_freelancer.dart';
import 'package:senior_project/core/widgets/listitem_fre.dart';
import 'package:senior_project/core/provider/user_role_provider.dart'; // To update role
import 'package:senior_project/core/widgets/custom_drawer.dart';
import 'package:senior_project/core/presentation/screens/profile/profile_screen.dart';
import 'package:senior_project/core/presentation/screens/postproject_screen.dart';
import 'package:senior_project/core/widgets/bottom_nav_bar.dart'; // Import BottomNavBar
import 'package:senior_project/core/presentation/screens/message_screen.dart';
import 'package:senior_project/core/presentation/screens/home_screen.dart';

class FreelancerProfileScreen extends StatefulWidget {
  const FreelancerProfileScreen({super.key});

  @override
  _FreelancerProfileScreenState createState() => _FreelancerProfileScreenState();
}

class _FreelancerProfileScreenState extends State<FreelancerProfileScreen> {
  bool isDarkMode = false;
  String accountType = 'Freelancer'; // Default profile
  bool isFreelancerPaid = false; // Track payment status for freelancer
  int currentIndex = 0; // Track the current index for Bottom Navigation

  @override
  Widget build(BuildContext context) {
    final userRoleProvider = Provider.of<UserRoleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Freelancer Profile"),
        backgroundColor: isDarkMode ? Colors.black : Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeaderfre(accountType: accountType), // Profile header for Freelancer
            const Divider(),
            AccountTypeDropdown(
              accountType: accountType,
              onChanged: (String? newValue) {
                setState(() {
                  accountType = newValue!;
                });
                userRoleProvider.setRole(newValue!);
                if (newValue == 'Client') {
                  setState(() {
                    currentIndex = 0; // Reset to home when switching to Client
                  });
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ProfileScreen(),
                    ),
                  );
                }
              },
            ),
            const Divider(),
            MenuListItemsfre(
              onPostTaskTapped: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PostProjectScreen()),
                );
              },
              onScheduleTapped: () {
                // Implement schedule navigation if necessary
              },
              onThemeToggle: () {
                setState(() {
                  isDarkMode = !isDarkMode;
                });
              },
              onSignOut: () {
                // Implement sign-out functionality
              },
            ),
            const Divider(),
            DeleteAccountButtonfre(),
          ],
        ),
      ),
      // Bottom Navigation Bar Added
      bottomNavigationBar: BottomNavBar(
        currentIndex: 3, // Set currentIndex dynamically
        onTap: (index) {
          setState(() {
            currentIndex = index; // Update currentIndex on tap
          });
          if (index == 2) {
            // Navigate to the MessagesScreen when the chat icon is tapped
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MessagesScreen(),
              ),
            );
          } else if (index == 0) {
            // Handle the home button logic when clicked
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const HomeScreen()),
            );
          }
        },
      ),
    );
  }
}

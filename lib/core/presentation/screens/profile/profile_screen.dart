import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:senior_project/core/presentation/screens/payment_screen.dart';
import 'package:senior_project/core/widgets/account_type.dart';
import 'package:senior_project/core/widgets/bottom_nav_bar.dart';
import 'package:senior_project/core/widgets/delete_account.dart';
import 'package:senior_project/core/widgets/menu_itemlist.dart';
import 'package:senior_project/core/widgets/profile_header.dart';
import 'package:senior_project/core/provider/user_role_provider.dart'; // UserRoleProvider
import 'package:senior_project/core/widgets/custom_drawer.dart';
import 'package:senior_project/core/presentation/screens/profile/freelancer_profile_screen.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isFreelancerPaid = false;
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    final userRoleProvider = Provider.of<UserRoleProvider>(context);
    final String accountType = userRoleProvider.role;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Client Profile"),
        backgroundColor: isDarkMode ? Colors.black : Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeader(accountType: accountType, onEdit: () {}), // Profile header for Client

            const Divider(),

            // Account Type Dropdown
            AccountTypeDropdown(
              accountType: accountType,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  userRoleProvider.setRole(newValue);

                  if (newValue == 'Freelancer') {
                    if (!isFreelancerPaid) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentScreen(
                            onPaymentSuccess: () {
                              setState(() {
                                isFreelancerPaid = true;
                              });

                              // ✅ After payment success, go to freelancer screen
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (_) => const FreelancerProfileScreen()),
                                (route) => false,
                              );
                            },
                          ),
                        ),
                      );
                    } else {
                      // ✅ Already paid, just go to freelancer screen
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const FreelancerProfileScreen()),
                        (route) => false,
                      );
                    }
                  }
                }
              },
            ),

            const Divider(),

            MenuListItems(
              onScheduleTapped: () {
                // Handle My Schedule tap
              },
              onThemeToggle: () {
                setState(() {
                  isDarkMode = !isDarkMode;
                });
              },
              onPostTaskTapped: () {
                // Handle Post Task tap
              },
              onSignOut: () {
                // Handle sign out
              },
            ),

            const Divider(),

            DeleteAccountButton(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 3,
        onTap: (index) {
          if (index != 3) Navigator.pop(context);
        },
      ),
    );
  }
}

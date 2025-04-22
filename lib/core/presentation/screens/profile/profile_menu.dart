import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior_project/core/app_styles.dart';
import 'package:senior_project/core/presentation/screens/my_posts_screen.dart';
import 'package:senior_project/core/presentation/screens/post_task_screen.dart';
import 'package:senior_project/core/presentation/screens/postproject_screen.dart';
import 'package:senior_project/core/provider/user_role_provider.dart'; // <-- Import role provider

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final isClient = Provider.of<UserRoleProvider>(context).isClient;

    return Column(
      children: [
        // My Posts
        MenuItem(
          icon: Icons.post_add,
          text: 'My Posts',
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyPostsScreen()),
            );
          },
        ),
        const Divider(),

        // Following
        MenuItem(
          icon: Icons.people,
          text: 'Following',
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('0', style: TextStyle(color: Colors.grey)),
              SizedBox(width: 4),
              Icon(Icons.chevron_right, size: 20),
            ],
          ),
        ),
        const Divider(),

        // Followers
        MenuItem(
          icon: Icons.people_outline,
          text: 'Followers',
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('0', style: TextStyle(color: Colors.grey)),
              SizedBox(width: 4),
              Icon(Icons.chevron_right, size: 20),
            ],
          ),
        ),
        const Divider(),

        // ✅ Post a Task / Post a Project
        MenuItem(
          icon: Icons.add_task,
          text: isClient ? 'Post a Task' : 'Post a Project',
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    isClient ? const PostTaskScreen() : const PostProjectScreen(),
              ),
            );
          },
        ),
        const Divider(),

        // My Schedule
        MenuItem(
          icon: Icons.calendar_today,
          text: 'My Schedule',
          trailing: const Icon(Icons.chevron_right),
        ),
        const Divider(),

        // Theme
        MenuItem(
          icon: Icons.color_lens,
          text: 'Theme',
          trailing: const Icon(Icons.chevron_right),
        ),
        const Divider(),

        // Sign Out
        MenuItem(
          icon: Icons.logout,
          text: 'Sign Out',
          textColor: AppStyles.primary,
          trailing: const Icon(Icons.chevron_right),
        ),
        const Divider(),

        // Delete Account
        MenuItem(
          icon: Icons.delete,
          text: 'Delete Account',
          textColor: Colors.red,
          trailing: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Widget? trailing;
  final Color? textColor;
  final VoidCallback? onTap;

  const MenuItem({
    super.key,
    required this.icon,
    required this.text,
    this.trailing,
    this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: textColor ?? Colors.black87),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: textColor ?? Colors.black87,
        ),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}

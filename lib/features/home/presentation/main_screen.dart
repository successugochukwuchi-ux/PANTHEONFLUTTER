import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:pantheon/core/constants.dart';

class MainScreen extends StatelessWidget {
  final Widget child;
  const MainScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName, style: TextStyle(color: Color(0xFF0052D4), fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(LucideIcons.bell),
            onPressed: () {},
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=pantheon'),
            ),
          ),
        ],
      ),
      drawer: const SidebarDrawer(),
      body: child,
    );
  }
}

class SidebarDrawer extends StatelessWidget {
  const SidebarDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('John Doe'),
            accountEmail: Text('john.doe@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=pantheon'),
            ),
            decoration: BoxDecoration(color: Color(0xFF0052D4)),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildMenuItem(context, LucideIcons.layoutDashboard, 'Dashboard', '/dashboard'),
                _buildMenuItem(context, LucideIcons.video, 'Video Library', '/video-library'),
                _buildMenuItem(context, LucideIcons.bookOpen, 'CBT Practice', '/cbt-practice'),
                _buildMenuItem(context, LucideIcons.history, 'Past Questions', '/past-questions'),
                _buildMenuItem(context, LucideIcons.fileText, 'Lecture Notes', '/lecture-notes'),
                _buildMenuItem(context, LucideIcons.messageSquare, 'Chats', '/chats'),
                _buildMenuItem(context, LucideIcons.calculator, 'Punch Notes', '/punch-notes'),
                _buildMenuItem(context, LucideIcons.newspaper, 'News Board', '/news-board'),
                _buildMenuItem(context, LucideIcons.users, 'Friends', '/friends'),
                const Divider(),
                _buildMenuItem(context, LucideIcons.settings, 'Settings', '/settings'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title, String route) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        context.go(route);
        context.pop();
      },
    );
  }
}

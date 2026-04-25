import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons_flutter.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=pantheon'),
                ),
                SizedBox(height: 16),
                Text('John Doe', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text('john.doe@example.com', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Text('Profile Settings', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 18)),
          const SizedBox(height: 12),
          _buildSettingsTile(LucideIcons.user, 'Edit Profile', 'Change your name, email, etc.'),
          _buildSettingsTile(LucideIcons.lock, 'Security', 'Change password, two-factor auth'),
          const SizedBox(height: 32),
          Text('App Settings', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 18)),
          const SizedBox(height: 12),
          _buildSettingsTile(LucideIcons.palette, 'Theme', 'Switch between light and dark mode', trailing: Switch(value: false, onChanged: (v){})),
          _buildSettingsTile(LucideIcons.bell, 'Notifications', 'Manage your alert preferences'),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade50, foregroundColor: Colors.red),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTile(IconData icon, String title, String subtitle, {Widget? trailing}) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF0052D4)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
      trailing: trailing ?? const Icon(LucideIcons.chevronRight, size: 18),
      onTap: () {},
    );
  }
}

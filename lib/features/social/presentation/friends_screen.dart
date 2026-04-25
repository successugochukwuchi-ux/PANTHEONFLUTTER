import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const TabBar(
          tabs: [
            Tab(text: 'My Friends'),
            Tab(text: 'Pending'),
          ],
          labelColor: Color(0xFF0052D4),
          indicatorColor: Color(0xFF0052D4),
        ),
        body: TabBarView(
          children: [
            _buildFriendsList(false),
            _buildFriendsList(true),
          ],
        ),
      ),
    );
  }

  Widget _buildFriendsList(bool isPending) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: isPending ? 3 : 15,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=friend$index'),
          ),
          title: Text('Student User $index'),
          subtitle: const Text('Computer Science • 100L'),
          trailing: isPending
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(icon: Icon(LucideIcons.checkCircle, color: Colors.green), onPressed: () {}),
                  IconButton(icon: Icon(LucideIcons.xCircle, color: Colors.red), onPressed: () {}),
                ],
              )
            : IconButton(icon: Icon(LucideIcons.messageCircle, color: Color(0xFF0052D4)), onPressed: () {}),
        );
      },
    );
  }
}

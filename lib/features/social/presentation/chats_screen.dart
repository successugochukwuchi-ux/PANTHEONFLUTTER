import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const TabBar(
          tabs: [
            Tab(text: 'DMs'),
            Tab(text: 'Study Groups'),
          ],
          labelColor: Color(0xFF0052D4),
          indicatorColor: Color(0xFF0052D4),
        ),
        body: TabBarView(
          children: [
            _buildChatList(false),
            _buildChatList(true),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xFF0052D4),
          child: Icon(LucideIcons.messagePlus, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildChatList(bool isGroup) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: 10,
      separatorBuilder: (context, index) => const Divider(height: 32),
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=${isGroup ? "group$index" : "user$index"}'),
          ),
          title: Text(isGroup ? 'Engineering Study Group $index' : 'Friend Name $index', style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: const Text('Latest message preview goes here...', maxLines: 1, overflow: TextOverflow.ellipsis),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text('12:45 PM', style: TextStyle(color: Colors.grey, fontSize: 12)),
              const SizedBox(height: 4),
              if (index < 3)
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(color: Color(0xFF0052D4), shape: BoxShape.circle),
                  child: const Text('2', style: TextStyle(color: Colors.white, fontSize: 10)),
                ),
            ],
          ),
          onTap: () {},
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons_flutter.dart';

class VideoLibraryScreen extends StatefulWidget {
  const VideoLibraryScreen({super.key});

  @override
  State<VideoLibraryScreen> createState() => _VideoLibraryScreenState();
}

class _VideoLibraryScreenState extends State<VideoLibraryScreen> {
  String selectedCourse = 'MTH 101';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Video Library', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedCourse,
              decoration: const InputDecoration(labelText: 'Select Course'),
              items: ['MTH 101', 'PHY 101', 'CHM 101', 'GST 101'].map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
              onChanged: (val) => setState(() => selectedCourse = val!),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Column(
                      children: [
                        Container(
                          height: 180,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                            image: DecorationImage(
                              image: NetworkImage('https://picsum.photos/seed/${index+10}/400/200'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: const Center(
                            child: Icon(LucideIcons.playCircle, size: 64, color: Colors.white),
                          ),
                        ),
                        ListTile(
                          title: Text('Lesson ${index + 1}: Introduction to $selectedCourse'),
                          subtitle: const Text('Duration: 15:30 • 2 days ago'),
                          trailing: const Icon(LucideIcons.downloadCloud),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

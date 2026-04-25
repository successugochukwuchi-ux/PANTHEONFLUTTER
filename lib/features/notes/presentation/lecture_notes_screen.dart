import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class LectureNotesScreen extends StatelessWidget {
  const LectureNotesScreen({super.key});

  final List<Map<String, dynamic>> courses = const [
    {'code': 'MTH 101', 'name': 'Elementary Mathematics', 'color': Colors.blue},
    {'code': 'PHY 101', 'name': 'General Physics', 'color': Colors.orange},
    {'code': 'CHM 101', 'name': 'General Chemistry', 'color': Colors.green},
    {'code': 'GST 101', 'name': 'Use of English', 'color': Colors.purple},
    {'code': 'BIO 101', 'name': 'General Biology', 'color': Colors.red},
    {'code': 'ENG 101', 'name': 'Workshop Practice', 'color': Colors.teal},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Lecture Notes', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () => _showNotesList(context, course['code']),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              color: (course['color'] as Color).withOpacity(0.1),
                              child: Center(
                                child: Icon(LucideIcons.bookOpen, size: 48, color: course['color']),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(course['code'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                const SizedBox(height: 4),
                                Text(course['name'], style: const TextStyle(fontSize: 12, color: Colors.grey), maxLines: 2, overflow: TextOverflow.ellipsis),
                              ],
                            ),
                          ),
                        ],
                      ),
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

  void _showNotesList(BuildContext context, String courseCode) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$courseCode Notes', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: 8,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) => ListTile(
                  leading: Icon(LucideIcons.fileText),
                  title: Text('Module ${index + 1}: Topic Name'),
                  subtitle: const Text('Added on Jan 12, 2024'),
                  trailing: Icon(LucideIcons.chevronRight),
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

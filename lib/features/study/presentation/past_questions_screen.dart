import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class PastQuestionsScreen extends StatefulWidget {
  const PastQuestionsScreen({super.key});

  @override
  State<PastQuestionsScreen> createState() => _PastQuestionsScreenState();
}

class _PastQuestionsScreenState extends State<PastQuestionsScreen> {
  String selectedCourse = 'MTH 101';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Past Questions', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedCourse,
              decoration: const InputDecoration(labelText: 'Select Course'),
              items: ['MTH 101', 'PHY 101', 'CHM 101'].map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
              onChanged: (val) => setState(() => selectedCourse = val!),
            ),
            const SizedBox(height: 24),
            Text('Available Years', style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  final year = 2023 - index;
                  return ListTile(
                    leading: Icon(LucideIcons.fileText, color: Colors.blue),
                    title: Text('$year Exam Paper'),
                    subtitle: Text('$selectedCourse - FUTO'),
                    trailing: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(minimumSize: const Size(80, 36)),
                      child: const Text('Start'),
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

import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons_flutter.dart';

class CBTPracticeScreen extends StatefulWidget {
  const CBTPracticeScreen({super.key});

  @override
  State<CBTPracticeScreen> createState() => _CBTPracticeScreenState();
}

class _CBTPracticeScreenState extends State<CBTPracticeScreen> {
  String selectedCourse = 'MTH 101: Elementary Mathematics';
  List<String> selectedYears = ['2023'];
  double questionCount = 40;
  bool isTimed = true;
  int selectedDuration = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CBT Practice',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 32),
            ),
            const SizedBox(height: 8),
            Text(
              'Configure your session to begin your academic preparation.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 32),

            // Configuration Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionHeader(LucideIcons.book, 'Course Selection'),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      value: selectedCourse,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade50,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      items: [
                        'MTH 101: Elementary Mathematics',
                        'PHY 101: General Physics',
                        'CHM 101: General Chemistry',
                      ].map((e) => DropdownMenuItem(value: e, child: Text(e, overflow: TextOverflow.ellipsis))).toList(),
                      onChanged: (val) => setState(() => selectedCourse = val!),
                    ),
                    const SizedBox(height: 24),

                    _buildSectionHeader(LucideIcons.calendar, 'Year Selection'),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      children: ['2023', '2022', '2021', '2020'].map((year) {
                        final isSelected = selectedYears.contains(year);
                        return FilterChip(
                          label: Text(year),
                          selected: isSelected,
                          onSelected: (val) {
                            setState(() {
                              if (val) {
                                selectedYears.add(year);
                              } else {
                                selectedYears.remove(year);
                              }
                            });
                          },
                          selectedColor: const Color(0xFF0052D4).withOpacity(0.1),
                          checkmarkColor: const Color(0xFF0052D4),
                          labelStyle: TextStyle(color: isSelected ? const Color(0xFF0052D4) : Colors.black),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 24),

                    _buildSectionHeader(LucideIcons.listOrdered, 'Questions'),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => setState(() => questionCount = (questionCount - 5).clamp(5, 100)),
                          icon: const Icon(LucideIcons.minusCircle),
                        ),
                        Expanded(
                          child: Slider(
                            value: questionCount,
                            min: 5,
                            max: 100,
                            divisions: 19,
                            label: questionCount.round().toString(),
                            onChanged: (val) => setState(() => questionCount = val),
                          ),
                        ),
                        IconButton(
                          onPressed: () => setState(() => questionCount = (questionCount + 5).clamp(5, 100)),
                          icon: const Icon(LucideIcons.plusCircle),
                        ),
                        Text('${questionCount.round()}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 24),

                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Timed Session', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                  Text('Set a countdown for your session', style: TextStyle(color: Colors.grey, fontSize: 12)),
                                ],
                              ),
                              Switch(
                                value: isTimed,
                                onChanged: (val) => setState(() => isTimed = val),
                                activeColor: const Color(0xFF0052D4),
                              ),
                            ],
                          ),
                          if (isTimed) ...[
                            const Divider(height: 32),
                            _buildSectionHeader(LucideIcons.timer, 'Duration (Minutes)'),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [15, 30, 45, 60].map((mins) {
                                final isSelected = selectedDuration == mins;
                                return ChoiceChip(
                                  label: Text('$mins'),
                                  selected: isSelected,
                                  onSelected: (val) => setState(() => selectedDuration = mins),
                                  selectedColor: const Color(0xFF0052D4).withOpacity(0.1),
                                );
                              }).toList(),
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),

                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(LucideIcons.play),
                      label: const Text('Start CBT Session'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0052D4),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Performance Card
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFF003DA1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(LucideIcons.trendingUp, color: Colors.white),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text('PERFORMANCE', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text('Last Session Score', style: TextStyle(color: Colors.white70)),
                  const Text('84%', style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: 0.84,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                    borderRadius: BorderRadius.circular(10),
                    minHeight: 8,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, size: 18, color: const Color(0xFF0052D4)),
        const SizedBox(width: 8),
        Text(title, style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.grey)),
      ],
    );
  }
}

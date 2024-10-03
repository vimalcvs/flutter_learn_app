import 'package:flutter/material.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  // Example list of bookmarked courses
  final List<Map<String, String>> _bookmarkedCourses = [
    {
      'title': 'Introduction to Flutter',
      'image': 'assets/logo.png', // Replace with actual URLs or assets
      'lessons': '12 Lessons',
      'rating': '4.5 Rating',
      'enrolled': '2000 Enrolled',
    },
    {
      'title': 'Advanced ReactJS',
      'image': 'assets/logo.png',
      'lessons': '15 Lessons',
      'rating': '4.7 Rating',
      'enrolled': '1500 Enrolled',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarked Courses'),
        backgroundColor: Colors.blueAccent,
      ),
      body: _bookmarkedCourses.isEmpty
          ? const Center(
              child: Text(
                'No bookmarked courses',
                style: TextStyle(fontSize: 18.0, color: Colors.black54),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _bookmarkedCourses.length,
              itemBuilder: (context, index) {
                final course = _bookmarkedCourses[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  elevation: 3.0,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          course['image']!,
                          height: 100.0,
                          width: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              course['title']!,
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

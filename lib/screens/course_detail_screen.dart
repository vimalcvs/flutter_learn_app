import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CoursedetailScreen extends StatefulWidget {
  final String courseTitle;
  final String courseImage;
  final String courseDescription;
  final List<Map<String, String>> lectures;

  const CoursedetailScreen({
    super.key,
    required this.courseTitle,
    required this.courseImage,
    required this.courseDescription,
    required this.lectures,
  });

  @override
  State<CoursedetailScreen> createState() => _CoursedetailScreenState();
}

class _CoursedetailScreenState extends State<CoursedetailScreen> {
  final TextEditingController _commentController = TextEditingController();
  final List<String> _comments = []; // Stores comments
  double _rating = 0; // Stores the rating

  void _addComment() {
    if (_commentController.text.isNotEmpty) {
      setState(() {
        _comments.add(_commentController.text);
        _commentController.clear();
      });
    }
  }

  void _updateRating(double newRating) {
    setState(() {
      _rating = newRating;
    });
  }

  void _showCommentsBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height *
            0.5, // Set height to half of the screen
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Comments',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              Expanded(
                child: ListView.builder(
                  itemCount: _comments.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_comments[index]),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      decoration: InputDecoration(
                        hintText: 'Add a comment...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  ElevatedButton(
                    onPressed: () {
                      _addComment();
                      Navigator.pop(context); // Close the bottom sheet
                    },
                    child: const Text('Add'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.courseTitle),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.comment),
            onPressed: _showCommentsBottomSheet,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course Header
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    widget.courseImage,
                    height: 120.0,
                    width: 120.0,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.courseTitle,
                        style: const TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        widget.courseDescription,
                        style: const TextStyle(
                            fontSize: 16.0, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20.0),

            // Lectures List
            const Text(
              'Lectures',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: widget.lectures.length,
                itemBuilder: (context, index) {
                  final lecture = widget.lectures[index];
                  return ListTile(
                    leading: const Icon(Icons.play_circle_outline,
                        color: Colors.blueAccent),
                    title: Text(lecture['title']!),
                    subtitle: Text('Instructor: ${lecture['instructor']!}'),
                    trailing: Text('Duration: ${lecture['duration']!}'),
                  );
                },
              ),
            ),
            // Rating Section
            const Text(
              'Rate this course:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 30.0,
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: _updateRating,
            ),
          ],
        ),
      ),
    );
  }
}

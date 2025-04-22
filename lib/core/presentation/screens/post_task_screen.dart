import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:senior_project/core/widgets/task.dart';
import 'package:senior_project/core/provider/task_provider.dart'; // Import TaskProvider
import 'dart:io' show File;
import 'package:flutter/foundation.dart' show kIsWeb;

class PostTaskScreen extends StatefulWidget {
  const PostTaskScreen({super.key});

  @override
  _PostTaskScreenState createState() => _PostTaskScreenState();
}

class _PostTaskScreenState extends State<PostTaskScreen> {
  String? selectedArea;
  String description = '';
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  double purchaseRange = 20.0;
  XFile? _image; // Variable to store the selected image

  // Function to pick an image from the camera
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = pickedFile;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create your Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Area", style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: selectedArea,
              onChanged: (String? newValue) {
                setState(() {
                  selectedArea = newValue;
                });
              },
              items: <String>['Choose your city', 'Area 1', 'Area 2', 'Area 3']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text("Description", style: TextStyle(fontSize: 18)),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (text) {
                      setState(() {
                        description = text;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "E.g., Fix a broken door, assemble furniture...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: _pickImage, // Open camera to pick an image
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (_image != null) // Display the picked image if not null
              kIsWeb
                  ? Image.network(_image!.path, width: 100, height: 100)
                  : Image.file(
                      File(_image!.path),
                      width: 100,
                      height: 100,
                    ),
            const SizedBox(height: 20),
            const Text("Start date", style: TextStyle(fontSize: 18)),
            Row(
              children: [
                Text("${startDate.day}/${startDate.month}/${startDate.year}"),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: startDate,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null && picked != startDate) {
                      setState(() {
                        startDate = picked;
                      });
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text("End date", style: TextStyle(fontSize: 18)),
            Row(
              children: [
                Text("${endDate.day}/${endDate.month}/${endDate.year}"),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: endDate,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null && picked != endDate) {
                      setState(() {
                        endDate = picked;
                      });
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Create a task with the given details
                final task = Task(
                  title: selectedArea ?? 'Unknown area',
                  description: description,
                  imagePath: _image?.path ?? '', // Use empty path if no image is selected
                  startDate: startDate,
                  endDate: endDate,
                  purchaseRange: purchaseRange,
                );

                // Add task to TaskProvider
                final taskProvider = context.read<TaskProvider>();
                taskProvider.addTask(task);

                // Show confirmation notification
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Task successfully posted!'),
                    backgroundColor: Colors.green,
                  ),
                );

                // Go back to the profile screen or previous screen after posting the task
                Navigator.pop(context); // Navigate back
              },
              child: const Text("Post"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auto Tawaf Counter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AlignmentScreen(),
    );
  }
}

class AlignmentScreen extends StatefulWidget {
  const AlignmentScreen({super.key});
  @override
  State<AlignmentScreen> createState() => _AlignmentScreenState();
}

class _AlignmentScreenState extends State<AlignmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showAlignmentDialog(context),
          child: const Text("Check Alignment"),
        ),
      ),
    );
  }

  void _showAlignmentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Are you aligned with Hajar al-Aswad?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Not Yet"),
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                        "Please align with Hajar al-Aswad and press 'Yes' to begin automatic counting."),
                  ),
                );
              },
            ),
            TextButton(
              child: const Text("Yes, Start Tawaf"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TawafScreen()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class TawafScreen extends StatelessWidget {
  const TawafScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tawaf Screen"),
      ),
      body: const Center(
        child: Text("Tawaf Screen"),
      ),
    );
  }
}

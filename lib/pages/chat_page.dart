import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String name;

  // avatarUrl sudah dihapus dari constructor
  const ChatPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    String initial = name.isNotEmpty ? name[0].toUpperCase() : '?';

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: const Color(0xFF637B85),
              child: Text(
                initial,
                style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                name,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.videocam_outlined), onPressed: () {}),
          IconButton(icon: const Icon(Icons.call_outlined), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Container(
        color: const Color(0xFF0B141A),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF202C33),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Halo, besok jadi kumpul jam berapa?',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF005C4B),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Jam 10 pagi ya.',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFF202C33),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.emoji_emotions_outlined, color: Color(0xFF8696A0)),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Ketik pesan',
                                hintStyle: TextStyle(color: Color(0xFF8696A0)),
                                border: InputBorder.none,
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Icon(Icons.attach_file, color: Color(0xFF8696A0)),
                          SizedBox(width: 12),
                          Icon(Icons.camera_alt_rounded, color: Color(0xFF8696A0)),
                          SizedBox(width: 8),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const CircleAvatar(
                    radius: 24,
                    backgroundColor: Color(0xFF25D366),
                    child: Icon(Icons.mic, color: Color(0xFF0B141A)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
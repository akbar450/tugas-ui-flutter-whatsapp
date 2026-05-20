import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String name;
  final String avatarUrl;

  // Menerima data nama dan foto dari halaman sebelumnya
  const ChatPage({super.key, required this.name, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0, // Mengurangi jarak default agar foto profil lebih mepet ke tombol back
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(avatarUrl),
              backgroundColor: const Color(0xFF202C33),
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
        color: const Color(0xFF0B141A), // Background gelap standar WA
        child: Column(
          children: [
            // Area Chat Bubbles
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Chat Bubble Kiri (Penerima)
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
                  
                  // Chat Bubble Kanan (Pengirim)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF005C4B), // Hijau khas bubble chat WA Dark Mode
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
            
            // Kolom Input Pesan di Bawah
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  // TextField dan Ikon
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
                  
                  // Tombol Mic / Send
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
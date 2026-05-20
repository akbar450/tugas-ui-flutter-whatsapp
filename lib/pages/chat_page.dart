import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String name;

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
                  // 1. Bubble Chat Kiri (Penerima)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10, right: 60), // Margin kanan agar tidak full layar
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: const BoxDecoration(
                        color: Color(0xFF202C33),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0), // Sudut lancip kiri atas
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Halo, besok jadi kumpul jam berapa?',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          const SizedBox(height: 4),
                          // Waktu pesan
                          const Text(
                            '12:30',
                            style: TextStyle(color: Color(0xFF8696A0), fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  // 2. Bubble Chat Kanan (Pengirim)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10, left: 60), // Margin kiri agar tidak full layar
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: const BoxDecoration(
                        color: Color(0xFF005C4B),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(0), // Sudut lancip kanan atas
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Jam 10 pagi ya.',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          const SizedBox(height: 4),
                          // Waktu pesan dan Centang Biru
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                '12:31',
                                style: TextStyle(color: Color(0xFF8696A0), fontSize: 11),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.done_all, // Icon centang 2
                                color: Color(0xFF53BDEB), // Warna biru centang WhatsApp
                                size: 16,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Kolom Input Pesan
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
import 'package:flutter/material.dart';
import '../widgets/chat_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data chat dikembalikan ke versi dummy pertama
    // Total unread: 2 + 4 + 15 + 5 = 26 (sesuai dengan badge di navigasi bawah)
    final List<Map<String, dynamic>> chatList = [
      {
        'name': 'Budi Santoso',
        'message': 'Halo, besok jadi kumpul jam berapa?',
        'time': '12:30',
        'unread': 2,
        'avatar': 'https://i.pravatar.cc/150?u=budi',
      },
      {
        'name': 'Sari',
        'message': 'Oke siap! Nanti kabari lagi ya.',
        'time': '11:00',
        'unread': 4,
        'avatar': 'https://i.pravatar.cc/150?u=sari',
      },
      {
        'name': 'Grup Kuliah',
        'message': 'Dosen: Jangan lupa tugas UI/UX dikumpul minggu depan.',
        'time': '09:15',
        'unread': 15,
        'avatar': 'https://i.pravatar.cc/150?u=grup',
      },
      {
        'name': 'Fahrul',
        'message': 'Bro, script backend udah jalan belum?',
        'time': 'Kemarin',
        'unread': 5,
        'avatar': 'https://i.pravatar.cc/150?u=fahrul',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'WhatsApp',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Bilah Pencarian Meta AI
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              decoration: BoxDecoration(
                color: const Color(0xFF202C33), 
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Color(0xFF8696A0), size: 20),
                  SizedBox(width: 12),
                  Text(
                    'Tanya Meta AI atau cari',
                    style: TextStyle(color: Color(0xFF8696A0), fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          
          // Daftar Chat
          Expanded(
            child: ListView.builder(
              itemCount: chatList.length,
              itemBuilder: (context, index) {
                final chat = chatList[index];
                return ChatTile(
                  name: chat['name'],
                  message: chat['message'],
                  time: chat['time'],
                  unreadCount: chat['unread'],
                  avatarUrl: chat['avatar'],
                );
              },
            ),
          ),
        ],
      ),
      
      // Tombol FAB Hijau 
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF25D366),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), 
        ),
        child: const Icon(Icons.add_box, color: Color(0xFF0B141A)),
      ),
      
      // Bottom Navigation Bar
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFF0B141A),
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color(0xFF8696A0),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          currentIndex: 0, 
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Badge(
                  label: const Text('26'), // Angka tetap 26
                  backgroundColor: const Color(0xFF25D366),
                  textColor: const Color(0xFF0B141A),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E362D), 
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(Icons.chat, color: Colors.white),
                  ),
                ),
              ),
              label: 'Chat',
            ),
            const BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4.0),
                child: Icon(Icons.data_usage), 
              ),
              label: 'Pembaruan',
            ),
            const BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4.0),
                child: Icon(Icons.groups_outlined),
              ),
              label: 'Komunitas',
            ),
            const BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4.0),
                child: Icon(Icons.call_outlined),
              ),
              label: 'Panggilan',
            ),
          ],
        ),
      ),
    );
  }
}
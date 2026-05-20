import 'package:flutter/material.dart';
import '../widgets/chat_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data chat dummy dengan total pesan belum dibaca = 4
    final List<Map<String, dynamic>> chatList = [
      {
        'name': 'Budi Santoso',
        'message': 'Halo, besok jadi kumpul jam berapa?',
        'time': '12:30',
        'unread': 1,
      },
      {
        'name': 'Sari',
        'message': 'Oke siap! Nanti kabari lagi ya.',
        'time': '11:00',
        'unread': 1,
      },
      {
        'name': 'Grup Kuliah',
        'message': 'Dosen: Jangan lupa tugas UI/UX dikumpul minggu depan.',
        'time': '09:15',
        'unread': 0,
      },
      {
        'name': 'Fahrul',
        'message': 'Bro, script backend udah jalan belum?',
        'time': 'Kemarin',
        'unread': 0,
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
          // 1. Bilah Pencarian Meta AI
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
          
          // 2. Filter Chips (Semua, Belum dibaca, dll)
          Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip('Semua', isSelected: true),
                  _buildFilterChip('Belum dibaca 4', isSelected: false),
                  _buildFilterChip('Favorit', isSelected: false),
                  _buildFilterChip('Grup 1', isSelected: false),
                  
                  // Tombol + (Plus)
                  Container(
                    margin: const EdgeInsets.only(right: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFF313D45)),
                    ),
                    child: const Icon(Icons.add, color: Color(0xFF8696A0), size: 18),
                  ),
                ],
              ),
            ),
          ),
          
          // 3. Daftar Chat
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
                  label: const Text('4'), // Label disesuaikan menjadi 4
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

  // Widget helper untuk membuat chip filter
  Widget _buildFilterChip(String label, {required bool isSelected}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF1E362D) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: isSelected ? null : Border.all(color: const Color(0xFF313D45)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? const Color(0xFF25D366) : const Color(0xFF8696A0),
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
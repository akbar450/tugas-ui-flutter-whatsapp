import 'package:flutter/material.dart';
import '../pages/chat_page.dart';

class ChatTile extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final int unreadCount;

  // avatarUrl sudah dihapus dari sini
  const ChatTile({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.unreadCount,
  });

  @override
  Widget build(BuildContext context) {
    // Mengambil huruf pertama dari nama, jadikan huruf besar (Kapital)
    String initial = name.isNotEmpty ? name[0].toUpperCase() : '?';

    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: const Color(0xFF637B85), // Warna background abu-abu kebiruan khas inisial WA
        child: Text(
          initial,
          style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      subtitle: Text(
        message,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: Color(0xFF8696A0)),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            time,
            style: TextStyle(
              fontSize: 12,
              color: unreadCount > 0 ? const Color(0xFF25D366) : const Color(0xFF8696A0),
            ),
          ),
          const SizedBox(height: 4),
          if (unreadCount > 0)
            CircleAvatar(
              radius: 10,
              backgroundColor: const Color(0xFF25D366),
              child: Text(
                unreadCount.toString(),
                style: const TextStyle(fontSize: 10, color: Color(0xFF0B141A)),
              ),
            ),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(
              name: name, // Hanya mengirimkan nama
            ),
          ),
        );
      },
    );
  }
}
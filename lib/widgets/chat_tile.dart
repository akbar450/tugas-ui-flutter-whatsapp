import 'package:flutter/material.dart';
import '../pages/chat_page.dart'; // Import halaman chat yang baru dibuat

class ChatTile extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final int unreadCount;
  final String avatarUrl;

  const ChatTile({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.unreadCount,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        backgroundImage: NetworkImage(avatarUrl),
        backgroundColor: const Color(0xFF202C33),
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
      // MENGAKTIFKAN NAVIGASI KLIK
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(
              name: name,
              avatarUrl: avatarUrl,
            ),
          ),
        );
      },
    );
  }
}
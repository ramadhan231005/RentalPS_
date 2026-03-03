import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final List<_Message> _messages = [
    _Message(text: 'Halo! Ada yang bisa dibantu?', isSentByMe: false),
    _Message(text: 'Saya mau pesan jam main untuk besok.', isSentByMe: true),
    _Message(text: 'Baik, mau di rental yang mana?', isSentByMe: false),
  ];

  final TextEditingController _controller = TextEditingController();

  void _send() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _messages.add(_Message(text: text, isSentByMe: true));
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesan'),
        backgroundColor: const Color(0xFFE8822A),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final m = _messages[index];
                return Align(
                  alignment: m.isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                    decoration: BoxDecoration(
                      color: m.isSentByMe ? const Color(0xFFE8822A) : const Color(0xFFF1F3F4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      m.text,
                      style: TextStyle(color: m.isSentByMe ? Colors.white : Colors.black87),
                    ),
                  ),
                );
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Tulis pesan...',
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                      ),
                      onSubmitted: (_) => _send(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _send,
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE8822A)),
                    child: const Icon(Icons.send),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Message {
  final String text;
  final bool isSentByMe;
  _Message({required this.text, required this.isSentByMe});
}

import 'package:flutter/material.dart';
import 'package:test_task/src/screens/chat_screen/chat.screen.dart';

class ChatDetailScreen extends StatelessWidget {
  final ChatItem chatItem;

  const ChatDetailScreen({super.key, required this.chatItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130.0),
        child: AppBar(
          backgroundColor: const Color(0xFFD9D9D9),
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage(chatItem.imageUrl),
                    radius: 20,
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 39,
                color: const Color(0xFF7446AC),
                child: Row(
                  children: [
                    Image.asset('assets/images/fly.png'),
                    const SizedBox(width: 10),
                    const Text(
                      '2 общих соблазна',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Начни общение',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        const Expanded(
                          child: SizedBox(
                            height: 35,
                            child: TextField(
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                hintText: 'Сообщение...',
                                hintStyle: TextStyle(color: Colors.grey),
                                suffixIcon: Image(
                                  image: AssetImage('assets/images/man.png'),
                                  fit: BoxFit.scaleDown,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 15.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          icon: const Icon(Icons.mic, color: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

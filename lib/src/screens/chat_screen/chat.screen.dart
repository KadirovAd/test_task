import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task/src/screens/chat_detail_screen/chat_detail_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatItem> chatItems = [
    ChatItem('23 ч 43 мин', 'Отлично выглядишь', 'assets/images/1.png',
        ['Отлично выглядишь!', 'Спасибо!']),
    ChatItem('20 ч 40 мин', 'Встретимся? Я рядом', 'assets/images/2.png',
        ['Встретимся?', 'Где ты?']),
    ChatItem('18 ч 40 мин', 'Встретимся?', 'assets/images/3.png',
        ['Привет', 'Привет']),
    ChatItem('09 ч 40 мин', 'Давно тебя хочу', 'assets/images/4.png',
        ['Давно тебя хочу', 'Как насчет сейчас?']),
    ChatItem('03 ч 04 мин', 'Я в ванной.. Скинь фото..', 'assets/images/5.png',
        ['Я в ванной.. Скинь фото..', 'Сейчас']),
    ChatItem('01 ч 09 мин', 'Привет', 'assets/images/6.png',
        ['Привет', 'Привет, как дела?']),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 130,
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'ЧАТЫ',
                    style: TextStyle(
                      color: Color(0xFFF6F3F3),
                      fontSize: 24,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'OFF',
                    style: TextStyle(
                      color: Color(0xFFF6F3F3),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      _showIncognitoModeOptions(context);
                    },
                    child: SvgPicture.asset('assets/icons/foto.svg'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    maxRadius: 30,
                    backgroundColor: Color(0xFF1F093A),
                    child: Icon(Icons.favorite, color: Color(0xFF7446AC)),
                  ),
                  SizedBox(width: 16),
                  Text(
                    '44 человека тебя лайкнули',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  CircleAvatar(
                    maxRadius: 3,
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: chatItems.length,
                  itemBuilder: (context, index) {
                    final item = chatItems[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ChatDetailScreen(chatItem: item),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              maxRadius: 32,
                              backgroundImage: AssetImage(item.imageUrl),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.message,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 227, 227, 227),
                                  ),
                                ),
                                Text(
                                  item.time,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 227, 227, 227),
                                  ),
                                ),
                              ],
                            ),
                            if (item.message == 'Встретимся? Я рядом') ...[
                              const Spacer(),
                              const CircleAvatar(
                                maxRadius: 3,
                                backgroundColor: Colors.white,
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black87,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_on),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
      ),
    );
  }

  void _showIncognitoModeOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          height: 450,
          decoration: const BoxDecoration(
            color: Color(0xFF0D1333),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SvgPicture.asset('assets/icons/fotobig.svg', height: 80),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'РЕЖИМ ИНКОГНИТО НА 24 ЧАСА',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Стань невидимкой в ленте и чатах, скрой объявление и наслаждайся <Space> незамеченным',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIncognitoOption('1', '99 ₽', false),
                  _buildIncognitoOption('3', '199 ₽', true),
                  _buildIncognitoOption('7', '399 ₽', false, discount: true),
                ],
              ),
              const Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Купить'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildIncognitoOption(String duration, String price, bool isHit,
      {bool discount = false}) {
    return Container(
      width: 103,
      padding: const EdgeInsets.all(16),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0xFF211F1F),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFF383737)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        children: [
         
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                duration,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(
                width: 5,
              ),
              SvgPicture.asset(
                'assets/icons/glasses.svg',
              )
            ],
          ),
          const SizedBox(height: 5),
          Text(
            price,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class ChatItem {
  final String message;
  final String time;
  final String imageUrl;
  final List<String> chatHistory;

  ChatItem(this.time, this.message, this.imageUrl, this.chatHistory);
}

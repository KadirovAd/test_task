import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
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
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      toolbarHeight: 20.h,
      backgroundColor: const Color(0xFFD9D9D9),
    );
  }

  Widget _buildBody() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(2.w),
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 2.h),
            _buildLikesInfo(),
            SizedBox(height: 2.h),
            _buildChatList(),
          ],
        ),
      ),
    );
  }

  Row _buildHeader() {
    return Row(
      children: [
        Text(
          'ЧАТЫ',
          style: TextStyle(
            color: const Color(0xFFF6F3F3),
            fontSize: 20.sp,
          ),
        ),
        const Spacer(),
        Text(
          'OFF',
          style: TextStyle(
            color: const Color(0xFFF6F3F3),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(width: 3.w),
        GestureDetector(
          onTap: () => _showIncognitoModeOptions(context),
          child: SvgPicture.asset('assets/icons/foto.svg', width: 10.w),
        ),
      ],
    );
  }

  Row _buildLikesInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          maxRadius: 3.5.h,
          backgroundColor: const Color(0xFF1F093A),
          child:
              Icon(Icons.favorite, color: const Color(0xFF7446AC), size: 4.h),
        ),
        SizedBox(width: 4.w),
        Text(
          '44 человека тебя лайкнули',
          style: TextStyle(
            fontSize: 15.sp,
            color: Colors.white,
          ),
        ),
        const Spacer(),
        CircleAvatar(
          maxRadius: 0.3.h,
          backgroundColor: Colors.white,
        ),
      ],
    );
  }

  Expanded _buildChatList() {
    return Expanded(
      child: ListView.builder(
        itemCount: chatItems.length,
        itemBuilder: (context, index) {
          final item = chatItems[index];
          return _buildChatItem(item);
        },
      ),
    );
  }

  Widget _buildChatItem(ChatItem item) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatDetailScreen(chatItem: item),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        child: Row(
          children: [
            CircleAvatar(
              maxRadius: 3.5.h,
              backgroundImage: AssetImage(item.imageUrl),
            ),
            SizedBox(width: 4.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.message,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color.fromARGB(255, 227, 227, 227),
                  ),
                ),
                Text(
                  item.time,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color.fromARGB(255, 227, 227, 227),
                  ),
                ),
              ],
            ),
            if (item.message == 'Встретимся? Я рядом') const Spacer(),
            if (item.message == 'Встретимся? Я рядом')
              CircleAvatar(
                maxRadius: 0.3.h,
                backgroundColor: Colors.white,
              ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
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
          icon: Icon(CupertinoIcons.chat_bubble_text_fill),
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
    );
  }

  void _showIncognitoModeOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => _buildIncognitoModeOptions(),
    );
  }

  Widget _buildIncognitoModeOptions() {
    return Container(
      padding: EdgeInsets.all(4.w),
      height: 60.h,
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
            child: SvgPicture.asset('assets/icons/fotobig.svg', height: 10.h),
          ),
          SizedBox(height: 2.h),
          Center(
            child: Text(
              'РЕЖИМ ИНКОГНИТО НА 24 ЧАСА',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            'Стань невидимкой в ленте и чатах, скрой объявление и наслаждайся незамеченным',
            style: TextStyle(color: Colors.white70, fontSize: 14.sp),
          ),
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildIncognitoOption('1', '99 ₽', false, ''),
              _buildIncognitoOption(
                  '3', '199 ₽', true, 'assets/icons/skip.svg'),
              _buildIncognitoOption(
                  '7', '399 ₽', false, 'assets/icons/xits.svg',
                  discount: true),
            ],
          ),
          SizedBox(height: 4.h),
          Container(
            height: 8.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFAA044A),
            ),
            child: Center(
              child: Text(
                'Купить',
                style: TextStyle(
                  color: const Color(0xFFF6F3F3),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const Spacer(),
          Center(
            child: Text(
              'УСЛОВИЯ И ПОЛОЖЕНИЯ',
              style: TextStyle(
                color: const Color(0xFFF6F3F3),
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildIncognitoOption(
      String duration, String price, bool isHit, String svgIcon,
      {bool discount = false}) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: 30.w,
          padding: EdgeInsets.all(3.w),
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
              SizedBox(height: 1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    duration,
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                  SizedBox(width: 1.w),
                  if (svgIcon.isNotEmpty)
                    SvgPicture.asset(
                      'assets/icons/glasses.svg',
                      width: 5.w,
                    ),
                ],
              ),
              SizedBox(height: 1.h),
              Text(
                price,
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
            ],
          ),
        ),
        if (svgIcon.isNotEmpty)
          Align(
            heightFactor: 0.2,
            child: SvgPicture.asset(
              svgIcon,
              width: 20.w,
            ),
          ),
      ],
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

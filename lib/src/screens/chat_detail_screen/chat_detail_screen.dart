import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:test_task/src/screens/chat_screen/chat.screen.dart';

class ChatDetailScreen extends StatelessWidget {
  final ChatItem chatItem;

  const ChatDetailScreen({super.key, required this.chatItem});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Scaffold(
          appBar: _buildAppBar(context),
          body: _buildBody(),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(22.h),
      child: AppBar(
        backgroundColor: const Color(0xFFD9D9D9),
        automaticallyImplyLeading: false,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildAppBarTopRow(context),
            SizedBox(height: 3.h),
            _buildAppBarBottomRow(),
            SizedBox(height: 1.h),
          ],
        ),
      ),
    );
  }

  Row _buildAppBarTopRow(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 18.sp,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        CircleAvatar(
          backgroundImage: AssetImage(chatItem.imageUrl),
          radius: 5.w,
        ),
        const Spacer(),
        IconButton(
          icon: Icon(Icons.more_vert, size: 18.sp),
          color: Colors.white,
          onPressed: () {},
        ),
      ],
    );
  }

  Container _buildAppBarBottomRow() {
    return Container(
      width: double.infinity,
      height: 5.h,
      color: const Color(0xFF7446AC),
      child: Row(
        children: [
          Image.asset('assets/images/fly.png', height: 4.h),
          SizedBox(width: 2.w),
          Text(
            '2 общих соблазна',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: Icon(Icons.close, color: Colors.white, size: 18.sp),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Column(
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
                _buildMessageInputField(),
                SizedBox(height: 2.h),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Padding _buildMessageInputField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Row(
        children: [
          SizedBox(width: 2.w),
          Expanded(
            child: SizedBox(
              height: 5.h,
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 18.sp,
                  ),
                  hintText: 'Сообщение...',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
                  suffixIcon: Image.asset('assets/images/man.png',
                      fit: BoxFit.scaleDown),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 2.w),
                ),
              ),
            ),
          ),
          SizedBox(width: 2.w),
          IconButton(
            icon: Icon(Icons.mic, color: Colors.white, size: 18.sp),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

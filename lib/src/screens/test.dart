import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.orange,
              Color.fromARGB(255, 255, 219, 73),
            ],
          ),
        ),
        child: Column(
          children: [
            HomeViewAppBar(width: width, height: height),
            SizedBox(
              height: height * 0.02,
            ),
            HomeViewBody(height: height, width: width),
          ],
        ),
      ),
    );
  }
}

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.03,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02,
                  vertical: height * 0.005,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Main portfolio',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              const Text(
                'Top 10 coins',
                style: TextStyle(fontSize: 15),
              ),
              const Text(
                'Exprimental',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.07),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '\$ 7,924.20',
                style: TextStyle(fontSize: 35),
              ),
              Container(
                padding: EdgeInsets.all(width * 0.02),
                height: height * 0.05,
                width: width * 0.1,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: Image.asset('assets/icons/5.1.png'),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.07),
          child: const Row(
            children: [
              Text(
                '+162% all time ',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.7,
      width: width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          topLeft: Radius.circular(50),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: height * 0.03),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.07),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Assets',
                  style: TextStyle(fontSize: 20),
                ),
                Icon(Icons.add),
              ],
            ),
          )
        ],
      ),
    );
  }
}

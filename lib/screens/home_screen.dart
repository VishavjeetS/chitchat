import 'package:chitchat/screens/video_call.dart';
import 'package:flutter/material.dart';
import 'chats.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currrentIndex = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(top: 17.0),
          child: Icon(
            Icons.message_outlined,
            color: _currrentIndex == 0 ? Colors.blue : Colors.grey,
          ),
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.video_call_outlined,
          color: _currrentIndex == 1 ? Colors.blue : Colors.grey,
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Container(
          height: 50,
          width: 50,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.call_outlined,
          color: _currrentIndex == 3 ? Colors.blue : Colors.grey,
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.person_outline,
          color: _currrentIndex == 4 ? Colors.blue : Colors.grey,
        ),
        label: '',
      ),
    ];

    final List<Widget> navigation = [
      const Chats(),
      const VideoCall(),
      const Text("Add"),
      const Text("Call"),
      const Text("Profile"),
    ];
    return Scaffold(
        body: PageView(
          controller: _pageController,
          children: navigation,
          onPageChanged: (index) {
            setState(() {
              _currrentIndex = index;
            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: items,
          currentIndex: _currrentIndex,
          onTap: (index) {
            setState(() {
              _pageController.jumpToPage(index);
            });
          },
        )

        // SizedBox(
        //   width: MediaQuery.of(context).size.width,
        //   height: MediaQuery.of(context).size.height / 10,
        //   child: Padding(
        //     padding: const EdgeInsets.all(12.0),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: [
        //         IconButton(
        //           focusColor: Colors.blue,
        //           color: Colors.grey,
        //           icon: const Icon(Icons.message_outlined),
        //           onPressed: () {},
        //         ),
        //         IconButton(
        //           focusColor: Colors.blue,
        //           color: Colors.grey,
        //           icon: const Icon(Icons.video_call_outlined),
        //           onPressed: () {},
        //         ),
        //         Container(
        //           height: 50,
        //           width: 50,
        //           decoration: const BoxDecoration(
        //               shape: BoxShape.circle, color: Colors.blue),
        //           child: IconButton(
        //             color: Colors.white,
        //             icon: const Icon(Icons.add),
        //             onPressed: () {},
        //           ),
        //         ),
        //         IconButton(
        //           focusColor: Colors.blue,
        //           color: Colors.grey,
        //           icon: const Icon(Icons.call_outlined),
        //           onPressed: () {},
        //         ),
        //         IconButton(
        //           focusColor: Colors.blue,
        //           color: Colors.grey,
        //           icon: const Icon(Icons.person_outline),
        //           onPressed: () {},
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        );
  }
}

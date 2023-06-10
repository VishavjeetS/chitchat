import 'dart:math';

import 'package:chitchat/screens/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/extends/colors/color.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

import '../utils/dummy_models.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.02),
        elevation: 0,
        title: const Text(
          'Chitchat',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: IconButton(
              color: Colors.grey,
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: IconButton(
              color: Colors.grey,
              icon: const Icon(Icons.draw),
              onPressed: () {},
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.black.withOpacity(0.02),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.blue.shade700, width: 1.7),
                        ),
                        child: Center(
                          child: Container(
                            height: 44,
                            width: 44,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue.withOpacity(0.2)),
                            child: const Icon(
                              Icons.add,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          "Add Story",
                          style: TextStyle(fontSize: 10),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: DummyModels.chatList.length,
                        itemBuilder: (context, index) {
                          final chat = DummyModels.chatList[index];
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, left: 8, right: 8, bottom: 2),
                                child: Stack(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          AssetImage(chat.avatarUrl),
                                      backgroundColor:
                                          //randomColor(),
                                          Colors.grey.withOpacity(0.4),
                                      radius: 25,
                                    ),
                                    SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: RotatedBox(
                                        quarterTurns: 135,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Colors.blue.shade900,
                                          value: Random()
                                              .nextDouble(), // Change this value to update the progress
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                chat.name,
                                style: const TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ],
                          );
                        }),
                  ),
                ),
              ],
            ),
            Flexible(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: DummyModels.chatList.length,
                    itemBuilder: (context, index) {
                      final chat = DummyModels.chatList[index];
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MessageScreen(
                                        chat: chat,
                                      )));
                        },
                        leading: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: //randomColor(),
                                  Colors.grey.withOpacity(0.4)),
                          child: Image(
                            image: AssetImage(chat.avatarUrl),
                            height: 50,
                            width: 50,
                          ),
                        ),
                        // ProfilePicture(
                        //   name: chat.name,
                        //   radius: 25,
                        //   fontsize: 15,
                        // ),
                        title: Text(
                          chat.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(chat.message.length > 27
                            ? "${chat.message.substring(0, 27)}..."
                            : chat.message),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                chat.time,
                                style: const TextStyle(
                                    fontSize: 10, color: Colors.grey),
                              ),
                            ),
                            chat.messageId == 0
                                ? SizedBox(
                                    height: 12,
                                    width: 12,
                                    child: Image.asset("assets/double_tick.png",
                                        width: 12,
                                        height: 12,
                                        color: Colors.green),
                                  )
                                : Container(
                                    height: 15,
                                    width: 15,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromARGB(255, 182, 20, 9)),
                                    child: const Center(
                                        child: Text(
                                      "2",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    )),
                                  ),
                          ],
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:chitchat/utils/chat_model.dart';
import 'package:chitchat/utils/dummy_models.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  final ChatModel chat;
  const MessageScreen({super.key, required this.chat});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    final chat = widget.chat;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0.01,
        leadingWidth: 50,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey.withOpacity(0.3)),
              child: Image(
                image: AssetImage(chat.avatarUrl),
                height: 50,
                width: 50,
              ),
            ),
            // ProfilePicture(
            //   name: chat.name,
            //   radius: 20,
            //   fontsize: 15,
            // ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chat.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "online",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            color: Colors.grey,
            icon: const Icon(Icons.videocam_outlined),
            onPressed: () {},
          ),
          IconButton(
            color: Colors.grey,
            icon: const Icon(Icons.call_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: Colors.black.withOpacity(0.02),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width / 4,
                    color: Colors.black.withOpacity(0.4),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: Text(
                      "Today, July 12",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width / 4,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: DummyModels.messages.length,
                itemBuilder: (context, index) {
                  final message = DummyModels.messages[index];
                  return Column(
                    crossAxisAlignment: message.messageId == 0
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      message.messageId == 0
                          ? Row(
                              mainAxisAlignment: message.messageId == 0
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/menu.png",
                                  width: 18,
                                  height: 18,
                                  color: Colors.black.withOpacity(0.6),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      right: 10, top: 10, bottom: 10),
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: message.messageId == 0
                                        ? Colors.blue
                                        : Colors.grey.withOpacity(0.2),
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                  ),
                                  child: Text(
                                    message.message,
                                    style: TextStyle(
                                      color: message.messageId == 0
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, top: 10, bottom: 10),
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 12, top: 12, bottom: 12),
                                  decoration: BoxDecoration(
                                      color: message.messageId == 0
                                          ? Colors.blue
                                          : Colors.grey.withOpacity(0.2),
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      )),
                                  child: message.message.contains("https")
                                      ? Column(
                                          children: [
                                            Image.network(
                                              "https://quolum.com/blog/wp-content/uploads/2023/01/coverimage.png",
                                              height: 120,
                                              width: 200,
                                            ),
                                            Text(
                                              message.message,
                                              style: TextStyle(
                                                color: message.messageId == 0
                                                    ? Colors.white
                                                    : Colors.blue,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        )
                                      : Text(
                                          message.message,
                                          style: TextStyle(
                                            color: message.messageId == 0
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 12,
                                          ),
                                        ),
                                ),
                                Image.asset(
                                  "assets/menu.png",
                                  width: 18,
                                  height: 18,
                                  color: Colors.black.withOpacity(0.6),
                                ),
                              ],
                            ),
                      Padding(
                        padding: message.messageId == 0
                            ? const EdgeInsets.only(right: 15.0)
                            : const EdgeInsets.only(left: 15.0),
                        child: Text(
                          message.time,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                },
              ),
            ),
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height / 10,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.mic,
                          ),
                          suffixIcon: SizedBox(
                              width: 70,
                              child: Row(
                                children: const [
                                  Icon(Icons.attach_file_outlined),
                                  SizedBox(width: 10),
                                  Icon(Icons.emoji_emotions),
                                ],
                              )),
                          border: InputBorder.none,
                          hintText: "Type a message",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:chitchat/utils/chat_model.dart';
import 'package:chitchat/utils/message_model.dart';
import 'package:flutter/material.dart';

class DummyModels {
  static List<MaterialColor> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.brown,
    Colors.indigo,
    Colors.lime,
    Colors.cyan,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.deepOrange,
    Colors.blueGrey,
  ];

  static List<ChatModel> chatList = [
    ChatModel(
        messageId: 1,
        id: "1",
        name: "Abdul Mughni",
        message: "Hello Faza!",
        time: "12:23 PM",
        avatarUrl: "assets/bit1.png"),
    ChatModel(
        messageId: 0,
        id: "2",
        name: "Nola Sofyan",
        message: "Great work!",
        time: "15:20 PM",
        avatarUrl: "assets/bit2.png"),
    ChatModel(
        messageId: 0,
        id: "3",
        name: "Adhitya P",
        message: "You're welcome!",
        time: "15:20 PM",
        avatarUrl: "assets/bit3.png"),
    ChatModel(
        messageId: 1,
        id: "4",
        name: "Irham Zuhry",
        message: "https://www.figma.com/file/a12d...",
        time: "15:20 PM",
        avatarUrl: "assets/bit4.png"),
    ChatModel(
        messageId: 0,
        id: "5",
        name: "Vitho Arvy",
        message: "Please Check Notion!",
        time: "15:20 PM",
        avatarUrl: "assets/bit5.png"),
  ];

  static List<MesssageModel> messages = [
    MesssageModel(
        messageId: 1,
        message: "Hello Faza! \n Can you check figma for next week's shot?",
        time: "12:23 PM"),
    MesssageModel(
        messageId: 0,
        message: "Sure! can you send the figma link?",
        time: "12:24 PM"),
    MesssageModel(
        messageId: 1,
        message: "I'm very happy to hear feedback from you.",
        time: "12:24 PM"),
    MesssageModel(
        messageId: 1,
        message: "https://www.figma.com/file/dananz...",
        time: "12:25 PM"),
    MesssageModel(
        messageId: 0, message: "Awesome Work, Dude!", time: "12:27 PM"),
    MesssageModel(messageId: 1, message: "Thank You bro!", time: "12:28 PM"),
  ];
}

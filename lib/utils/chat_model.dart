class ChatModel {
  final String id;
  final String name;
  final String message;
  final String time;
  final String avatarUrl;
  final int messageId;

  ChatModel(
      {required this.messageId,
      required this.id,
      required this.name,
      required this.message,
      required this.time,
      required this.avatarUrl});
}

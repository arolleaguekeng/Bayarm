import 'package:bayarm/models/chat_model.dart';
import 'package:bayarm/models/user_model.dart';

class ConversationModel{
  final UserModel userModel;
  final List<ChatModel> chatModels;

  ConversationModel({required this.userModel, required this.chatModels});
}
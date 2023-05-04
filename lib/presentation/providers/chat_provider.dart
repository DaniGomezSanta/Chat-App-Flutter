import 'package:flutter/widgets.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollControler = ScrollController(); 

  List<Message> messageList = [
    Message(text: 'Hola amor', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me)
  ];

  Future<void> sendMessage( String text ) async{

    if( text.isEmpty) return; 
    
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    notifyListeners();
    moveScrollToBotton(); 
  }

  Future<void> moveScrollToBotton() async{
    await Future.delayed(const Duration( milliseconds: 100)); 

    
    chatScrollControler.animateTo(
      chatScrollControler.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut);
  }
}
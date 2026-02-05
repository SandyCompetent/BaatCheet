import 'package:baatcheet/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_smart_reply/google_mlkit_smart_reply.dart'
    as ml_kit;

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({super.key});

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  final ChatService _chatService = ChatService();
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ml_kit.SmartReply _smartReply = ml_kit.SmartReply();
  List<String> _suggestions = [];

  @override
  void initState() {
    super.initState();
    _addConversationListener();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _scrollController.dispose();
    _smartReply.close();
    super.dispose();
  }

  void _addConversationListener() {
    _chatService.getMessages().listen((snapshot) {
      // Clear previous suggestions
      setState(() {
        _suggestions.clear();
      });

      final conversation = <ml_kit.TextMessage>[];
      for (var doc in snapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        final text = data['text'] ?? '';
        final isRemote = data['isRemote'] ?? false;
        final timestamp =
            (data['timestamp'] as Timestamp?)?.millisecondsSinceEpoch ??
                DateTime.now().millisecondsSinceEpoch;

        if (isRemote) {
          conversation.add(ml_kit.TextMessage(
            text: text,
            timestamp: timestamp,
            userId: 'remote',
            isLocalUser: false,
          ));
        } else {
          conversation.add(ml_kit.TextMessage(
            text: text,
            timestamp: timestamp,
            userId: 'local',
            isLocalUser: true,
          ));
        }
      }

      if (conversation.isNotEmpty) {
        _generateReplies(conversation);
      }
    });
  }

  void _generateReplies(List<ml_kit.TextMessage> conversation) async {
    final result = await _smartReply.suggestReplies(conversation);
    if (result.status == ml_kit.SmartReplySuggestionResultStatus.success) {
      setState(() {
        _suggestions = result.suggestions;
      });
    }
  }

  void _handleSendMessage({String? message}) {
    final text = message ?? _textEditingController.text;
    if (text.isNotEmpty) {
      _chatService.sendMessage(text);
      _textEditingController.clear();
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          curve: Curves.ease,
          duration: const Duration(milliseconds: 500),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.redAccent,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _chatService.getMessages(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final messages = snapshot.data!.docs;

                // Schedule scroll to bottom after layout
                WidgetsBinding.instance
                    .addPostFrameCallback((_) => _scrollToBottom());

                return ListView.builder(
                  controller: _scrollController,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final data = messages[index].data() as Map<String, dynamic>;
                    final isRemote = data['isRemote'] ?? false;
                    final text = data['text'] ?? '';
                    final timestamp =
                        (data['timestamp'] as Timestamp?)?.toDate() ??
                            DateTime.now();

                    return _buildMessage(isRemote, text, timestamp);
                  },
                );
              },
            ),
          ),
          if (_suggestions.isNotEmpty) _buildSuggestions(),
          const Divider(height: 2.0),
          _buildTextInput(),
        ],
      ),
    );
  }

  Widget _buildMessage(bool isRemote, String messageText, DateTime timestamp) {
    return Align(
      alignment: isRemote ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isRemote ? Colors.grey[300] : Colors.blue[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(isRemote ? 'Remote User' : 'You'),
            const SizedBox(height: 5),
            Text(messageText),
            const SizedBox(height: 5),
            Text(
              '${timestamp.hour}:${timestamp.minute}',
              style: const TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuggestions() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        children: _suggestions.map((suggestion) {
          return ActionChip(
            label: Text(suggestion),
            onPressed: () {
              _handleSendMessage(message: suggestion);
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTextInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textEditingController,
              decoration: const InputDecoration.collapsed(
                hintText: "Type a message",
              ),
              onSubmitted: (value) => _handleSendMessage(),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () => _handleSendMessage(),
          ),
        ],
      ),
    );
  }
}

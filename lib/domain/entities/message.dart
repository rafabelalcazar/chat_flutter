enum FromWhom {me, friend}

class Message {
  final String text;
  final String? imageUrl;
  final FromWhom fromWhom;

  Message({
    required this.text,
     required this.fromWhom,
     this.imageUrl
    });
}
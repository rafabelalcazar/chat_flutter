import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 64),
          child: Container(
            decoration: BoxDecoration(color: colors.secondary, borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(message.text, style: const TextStyle(color: Colors.white))),
          ),
        ),
        const SizedBox(height: 10,),
        _ImageBubble(),
        const SizedBox(height: 10,),

        // Todo: Image
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  // const _ImageBubble extends({super.key});


  @override
  Widget build(BuildContext context) {

  
    final size = MediaQuery.of(context).size;
    // https://yesno.wtf/api
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network(
        'https://yesno.wtf/assets/no/15-7446b1035f784986609f456e15d30a5b.gif',
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('cargando...'),

          );
        },
        )
        );
  }
}
import 'package:flutter/material.dart';

class MessageField extends StatelessWidget {
  const MessageField({super.key});

  @override
  Widget build(BuildContext context) {

    // final colors = Theme.of(context).colorScheme;
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      // borderSide: const BorderSide(color: Colors.transparent),
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(20)
    );

    final inputDecoration = InputDecoration(
        hintText: 'Message',
        filled: true,
        enabledBorder:outlineInputBorder,
        focusedBorder: outlineInputBorder,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send),
          onPressed: () {
            final textValue = textController.value.text;
            print('onPressed: $textValue');
            textController.clear();
            // focusNode.requestFocus();

            
          },
          )
      );

    return TextFormField(
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('Values: $value');
        textController.clear();
        focusNode.requestFocus() ;

      },
      onChanged: (value) {
        print('OnChanged: $value');
      },
    );
  }
}
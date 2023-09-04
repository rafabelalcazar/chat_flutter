import 'package:flutter/material.dart';

class MessageField extends StatelessWidget {

  final ValueChanged<String> onValue;

  const MessageField({
    super.key, 
    required this.onValue
  });

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
            onValue(textValue);
            // print('onPressed: $textValue');
            textController.clear();
            // focusNode.requestFocus();

            
          },
          )
      );

    return TextFormField(
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        // print('Values: $value');
        textController.clear();
        focusNode.requestFocus();
        onValue(value);

      },
      // onChanged: (value) {
      //   print('OnChanged: $value');
      // },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessagebubble extends StatelessWidget {
  final Message message;
  const HerMessagebubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: color.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        _ImageBubble(
          message.imageUrl!,
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble(this.imageUrl);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.5,
        height: 200,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Container(
            width: size.width * 0.5,
            height: 200,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('Mi amor esta mandando una imagen...'),
          );
        },
      ),
    );
  }
}

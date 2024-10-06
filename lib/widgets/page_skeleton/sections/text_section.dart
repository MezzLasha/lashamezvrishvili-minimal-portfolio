import 'package:flutter/material.dart';

import '../page_section.dart';

class TextSection extends PageSection {
  final TextSpan text;

  const TextSection({required this.text});

  @override
  Widget build(BuildContext context) => RichText(
        text: TextSpan(
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          children: [text],
        ),
      );
}

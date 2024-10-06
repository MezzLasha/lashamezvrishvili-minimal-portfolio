import 'package:flutter/material.dart';

import '/widgets/page_skeleton/page_section.dart';

class TitleSection extends PageSection {
  final String title;

  const TitleSection(this.title);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 80,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(),
          ),
        ],
      );
}

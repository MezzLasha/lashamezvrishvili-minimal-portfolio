import 'page_section.dart';

class PageModel {
  final String title;
  final String path;
  final String backgroundImage;
  final String actionLink;
  final String actionLinkHint;
  final List<PageSection> sections;

  const PageModel({
    required this.title,
    required this.path,
    required this.backgroundImage,
    required this.actionLink,
    required this.actionLinkHint,
    required this.sections,
  });
}

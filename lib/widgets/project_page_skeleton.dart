import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:smooth_corner/smooth_corner.dart';

import '../widgets/project_widgets.dart';

const vacanciesScreenshots = {
  'assets/images/vacancies_images/1.png',
  'assets/images/vacancies_images/2.png',
  'assets/images/vacancies_images/3.png',
  'assets/images/vacancies_images/4.png',
  'assets/images/vacancies_images/5.png',
  'assets/images/vacancies_images/6.png',
  'assets/images/vacancies_images/7.png',
};

class ProjectPageSkeleton extends StatefulWidget {
  const ProjectPageSkeleton({
    super.key,
    required this.bgImageUrl,
    required this.headerUrl,
    required this.name,
    required this.url,
    required this.body,
  });

  final String bgImageUrl;
  final String headerUrl;
  final String name;
  final String url;
  final Widget body;

  @override
  State<ProjectPageSkeleton> createState() => _ProjectPageSkeletonState();
}

class _ProjectPageSkeletonState extends State<ProjectPageSkeleton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animation = CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCubicEmphasized,
        reverseCurve: Curves.easeInOutCubicEmphasized);
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mdof = MediaQuery.of(context);
    return Scaffold(
        body: SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            height: 250,
            padding: mdof.size.aspectRatio > 0.5625
                ? const EdgeInsets.fromLTRB(16, 16, 16, 0)
                : EdgeInsets.zero,
            child: Hero(
              tag: widget.url,
              createRectTween: (begin, end) {
                return MaterialRectCenterArcTween(begin: begin, end: end);
              },
              flightShuttleBuilder: (flightContext, animation, flightDirection,
                  fromHeroContext, toHeroContext) {
                return AnimatedBuilder(
                  animation: CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeInOutCubicEmphasized),
                  builder: (context, child) {
                    return SmoothClipRRect(
                        smoothness: 0.6,
                        borderRadius: mdof.size.aspectRatio > 0.5625
                            ? BorderRadius.circular(6 + 90 * animation.value)
                            : BorderRadius.only(
                                topLeft:
                                    Radius.circular(6 + 42 * animation.value),
                                topRight:
                                    Radius.circular(6 + 42 * animation.value),
                                bottomLeft:
                                    Radius.circular((6 - 6 * animation.value)),
                                bottomRight:
                                    Radius.circular((6 - 6 * animation.value)),
                              ),
                        child: mdof.size.aspectRatio > 0.5625
                            ? Material(
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    // toHeroContext.widget,

                                    Ink.image(
                                      image: AssetImage(widget.bgImageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                    Opacity(
                                      opacity: animation.value,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 48.0),
                                            child: IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                color: Colors.black,
                                                icon: const Icon(
                                                    Icons.arrow_back)),
                                          ),
                                          const Spacer(),
                                          Flexible(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 48.0),
                                              child: IconButton(
                                                  onPressed: () {
                                                    //copy link to clipboard
                                                  },
                                                  color: Colors.black,
                                                  icon: const Icon(
                                                      Icons.open_in_new)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Center(
                                      child: DefaultTextStyle(
                                          style: const TextStyle(
                                              fontFamily: 'Neue',
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 50),
                                          child: Text(
                                            " ${widget.name}",
                                            softWrap: false,
                                            overflow: TextOverflow.fade,
                                          )),
                                    ),
                                  ],
                                ),
                              )
                            : Material(
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    child ?? toHeroContext.widget,
                                    Opacity(
                                      opacity: animation.value,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 16.0),
                                              child: IconButton(
                                                  onPressed: () {},
                                                  color: Colors.black,
                                                  icon: const Icon(
                                                      Icons.arrow_back)),
                                            ),
                                          ),
                                          const Spacer(),
                                        ],
                                      ),
                                    ),
                                    Center(
                                      child: DefaultTextStyle(
                                          style: const TextStyle(
                                              fontFamily: 'Neue',
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 50),
                                          child: Text(
                                            " ${widget.name}",
                                            softWrap: false,
                                            overflow: TextOverflow.fade,
                                          )),
                                    ),
                                  ],
                                ),
                              ));
                  },
                  child: fromHeroContext.widget,
                );
              },
              child: SmoothClipRRect(
                smoothness: 0.6,
                borderRadius: mdof.size.aspectRatio > 0.5625
                    ? BorderRadius.circular(96)
                    : const BorderRadius.only(
                        topLeft: Radius.circular(48),
                        topRight: Radius.circular(48),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                child: Material(
                  child: Ink.image(
                    image: AssetImage(widget.bgImageUrl),
                    fit: BoxFit.cover,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Center(
                          child: DefaultTextStyle(
                              style: const TextStyle(
                                  fontFamily: 'Neue',
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50),
                              child: Text(
                                " ${widget.name}",
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.fade,
                              )),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: mdof.size.aspectRatio > 0.5625
                                      ? 48.0
                                      : 16.0),
                              child: IconButton(
                                  onPressed: () async {
                                    _controller.reverse();
                                    await Future.delayed(
                                        const Duration(milliseconds: 200));
                                    Navigator.pop(context);
                                  },
                                  color: Colors.black,
                                  icon: const Icon(
                                    Icons.arrow_back,
                                  )),
                            ),
                            mdof.size.aspectRatio > 0.5625
                                ? Padding(
                                    padding: EdgeInsets.only(
                                        right: mdof.size.aspectRatio > 0.5625
                                            ? 48.0
                                            : 16.0),
                                    child: IconButton(
                                        onPressed: () async {
                                          await launch(widget.headerUrl);
                                        },
                                        color: Colors.black,
                                        icon: const Icon(Icons.open_in_new)),
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              constraints: const BoxConstraints(maxWidth: 800),
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, 1000 * (1 - _animation.value)),
                    child: child,
                  );
                },
                child: Card(
                  color: const Color(0xff0a0a0a),
                  margin: mdof.size.aspectRatio > 0.5625
                      ? const EdgeInsets.all(16)
                      : EdgeInsets.zero,
                  shape: SmoothRectangleBorder(
                    smoothness: 0.6,
                    borderRadius: mdof.size.aspectRatio > 0.5625
                        ? BorderRadius.circular(96)
                        : const BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                            bottomLeft: Radius.circular(48),
                            bottomRight: Radius.circular(48),
                          ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        widget.body,
                        BackButtonProjectAnimating(controller: _controller),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Column _buildDescription() {
    return Column(
      children: [
        const HeaderWidget(
          title: 'DESCRIPTION.',
        ),
        const SizedBox(
          height: 16,
        ),
        RichText(
          text: TextSpan(
            style: const TextStyle(
                fontFamily: 'Neue', color: Colors.white, fontSize: 16),
            children: [
              const TextSpan(
                  text:
                      'The Vacancies app is a mobile application that can be downloaded from the Google Play Store for Android users. It\'s designed to help you find and apply to your dream job with ease. \n\n'),
              const TextSpan(
                  text:
                      'The app supports automatic resume attachments, allowing you to apply to multiple job openings without having to search through multiple websites. The app uses web scraping technology to gather all the latest job advertisements from other websites and present them to you in one convenient location. \n\n'),
              const TextSpan(
                  text:
                      'It\'s built with Flutter and uses BLoC (Business Logic Component) and Stateful state management to provide a smooth and seamless experience. The app is integrated with Firebase Crash Analytics and Performance Monitoring. It\'s designed with the '),
              TextSpan(
                  text: 'Material You',
                  style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).colorScheme.onSurfaceVariant)),
              const TextSpan(
                  text:
                      ' design language, ensuring a modern and intuitive interface for our users. \n\n'),
              const TextSpan(
                  text:
                      'Whether you\'re a seasoned professional or just starting out, the Vacancies app is the perfect tool to help you land your dream job. Give it a try today!'),
            ],
          ),
        )
      ],
    );
  }
}
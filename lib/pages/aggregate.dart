import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:lashamezvrishvili/widgets/project_page_skeleton.dart';
import 'package:smooth_corner/smooth_corner.dart';

const aggregateScreenshots = {
  'assets/images/aggregate_images/1.png',
  'assets/images/aggregate_images/2.png',
  'assets/images/aggregate_images/3.png',
  'assets/images/aggregate_images/4.png',
  'assets/images/aggregate_images/5.png',
  'assets/images/aggregate_images/6.png',
  'assets/images/aggregate_images/7.png',
};

class AggregatePage extends StatefulWidget {
  const AggregatePage({super.key});

  @override
  State<AggregatePage> createState() => _AggregatePageState();
}

class _AggregatePageState extends State<AggregatePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

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
    return ProjectPageSkeleton(
        bgImageUrl: 'assets/images/aggregate.png',
        headerUrl: 'test',
        name: 'Aggregate',
        url: '/aggregate',
        body: Column(
          children: [
            SizedBox(
              height: mdof.size.aspectRatio > 0.5625 ? 48 : 0,
            ),
            _buildScreenshotsList(),
            const SizedBox(
              height: 48,
            ),
            _buildDescription(),
            const SizedBox(
              height: 48,
            ),
            const HeaderWidget(
              title: 'Check it out on\nGoogle Play Store.',
              style: TextStyle(
                  fontFamily: 'Neue',
                  color: Color(0xffd5fcc1),
                  fontSize: 30,
                  fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 16,
            ),
            AspectRatio(
                aspectRatio: 1.734,
                child: InkWell(
                  onTap: () async {
                    await launch(
                        'https://play.google.com/store/apps/details?id=com.mezzlasha.vacancy');
                  },
                  customBorder: SmoothRectangleBorder(
                    smoothness: 0.6,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: SmoothRectangleBorder(
                              smoothness: 0.6,
                              borderRadius: BorderRadius.circular(12),
                            ).borderRadius,
                            image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/aggregate_images/link_google_play_preview.png'),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: SmoothRectangleBorder(
                            smoothness: 0.6,
                            borderRadius: BorderRadius.circular(12),
                          ).borderRadius,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.2),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(
                                Icons.link,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'play.google.com',
                                style: TextStyle(
                                    fontFamily: 'Neue',
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            const SizedBox(
              height: 24,
            ),
          ],
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

  Widget _buildScreenshotsList() {
    return Column(
      children: [
        const HeaderWidget(
          title: 'SCREENSHOTS.',
        ),
        SizedBox(
          height: 250,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: List.generate(aggregateScreenshots.length, (index) {
                  // print(index);
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Hero(
                      tag: 'screenshot$index',
                      createRectTween: (begin, end) {
                        return MaterialRectCenterArcTween(
                            begin: begin, end: end);
                      },
                      child: Material(
                        shape: SmoothRectangleBorder(
                            smoothness: 0.6,
                            borderRadius: BorderRadius.circular(8)),
                        child: InkWell(
                          onTap: () {
                            // print(index);
                            context.pushTransparentRoute(
                              PageView(
                                physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                // padEnds: true,
                                controller: PageController(
                                    initialPage: index, viewportFraction: 1),
                                children: List.generate(
                                  aggregateScreenshots.length,
                                  (index2) => ExpandedImageWidget(index2),
                                ),
                              ),
                            );
                          },
                          borderRadius: BorderRadius.circular(8),
                          child: Ink(
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: AssetImage(
                                        aggregateScreenshots.elementAt(index)),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      ),
                    ),
                  );
                })),
          ),
        ),
      ],
    );
  }
}

class ExpandedImageWidget extends StatelessWidget {
  const ExpandedImageWidget(
    this.index, {
    super.key,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return DismissiblePage(
      onDismissed: () {
        Navigator.pop(context);
      },
      startingOpacity: 0.5,
      isFullScreen: false,
      backgroundColor: Colors.black,
      child: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1.2,
          width: 400,
          child: Hero(
            tag: 'screenshot$index',
            createRectTween: (begin, end) {
              return MaterialRectCenterArcTween(begin: begin, end: end);
            },
            child: Material(
              color: Colors.transparent,
              shape: SmoothRectangleBorder(
                  smoothness: 0.6, borderRadius: BorderRadius.circular(8)),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Ink(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image:
                              AssetImage(aggregateScreenshots.elementAt(index)),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.title,
    this.style,
  });

  final String title;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(title,
              style: style ??
                  const TextStyle(
                      fontFamily: 'Neue',
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 80)),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(),
        ),
      ],
    );
  }
}

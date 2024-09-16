import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:lashamezvrishvili/widgets/project_page_skeleton.dart';
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

class VacanciesPage extends StatelessWidget {
  const VacanciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mdof = MediaQuery.of(context);
    return ProjectPageSkeleton(
        bgImageUrl: 'assets/images/vacancies_images/bg_image.png',
        headerUrl: 'https://play.google.com/store/apps/details?id=com.mezzlasha.vacancy',
        name: 'Vacancies',
        url: '/vacancies',
        body: Column(
          children: [
            SizedBox(
              height: mdof.size.aspectRatio > 0.5625 ? 48 : 0,
            ),
            const ScreenshotsListWidget(
              screenshots: vacanciesScreenshots,
            ),
            const SizedBox(
              height: 48,
            ),
            Column(
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
            ),
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
                                    'assets/images/vacancies_images/link_google_play_preview.png'),
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
                      const Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
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
}

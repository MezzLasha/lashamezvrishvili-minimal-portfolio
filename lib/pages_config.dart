import 'package:flutter/material.dart';

import 'widgets/page_skeleton/page_model.dart';
import 'widgets/page_skeleton/sections/banner_section.dart';
import 'widgets/page_skeleton/sections/image_list_section.dart';
import 'widgets/page_skeleton/sections/text_section.dart';
import 'widgets/page_skeleton/sections/title_section.dart';

const pagesConfig = [
  PageModel(
    title: 'Vacancies',
    path: '/vacancies',
    backgroundImage: 'assets/images/vacancies_images/bg_image.png',
    actionLink: 'https://play.google.com/store/apps/details?id=com.mezzlasha.vacancy',
    actionLinkHint: 'Open in Google Play Store',
    sections: [
      ImageListSection(
        images: [
          'assets/images/vacancies_images/1.png',
          'assets/images/vacancies_images/2.png',
          'assets/images/vacancies_images/3.png',
          'assets/images/vacancies_images/4.png',
          'assets/images/vacancies_images/5.png',
          'assets/images/vacancies_images/6.png',
          'assets/images/vacancies_images/7.png',
        ],
      ),
      TitleSection('DESCRIPTION.'),
      TextSection(
        text: TextSpan(
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          children: [
            TextSpan(
              text:
                  'The Vacancies app is a mobile application that can be downloaded from the Google Play Store for Android users. It\'s designed to help you find and apply to your dream job with ease. \n\n'
                  'The app supports automatic resume attachments, allowing you to apply to multiple job openings without having to search through multiple websites. The app uses web scraping technology to gather all the latest job advertisements from other websites and present them to you in one convenient location. \n\n'
                  'It\'s built with Flutter and uses BLoC (Business Logic Component) and Stateful state management to provide a smooth and seamless experience. The app is integrated with Firebase Crash Analytics and Performance Monitoring. It\'s designed with the ',
            ),
            TextSpan(
              text: 'Material You',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
                color: Color(0xFFBDBDBD),
              ),
            ),
            TextSpan(
              text:
                  ' design language, ensuring a modern and intuitive interface for our users. \n\n'
                  'Whether you\'re a seasoned professional or just starting out, the Vacancies app is the perfect tool to help you land your dream job. Give it a try today!',
            ),
          ],
        ),
      ),
      BannerSection(
        title: 'Check it out on\nGoogle Play Store.',
        actionText: 'play.google.com',
        actionUrl: 'https://play.google.com/store/apps/details?id=com.mezzlasha.vacancy',
        image: 'assets/images/vacancies_images/link_google_play_preview.png',
      ),
    ],
  ),
  PageModel(
    title: 'Gripwise',
    path: '/gripwise',
    backgroundImage: 'assets/images/gripwise_images/bg_image.png',
    actionLink: 'Delauney.mx',
    actionLinkHint: 'Visit Delauney.mx',
    sections: [
      ImageListSection(
        images: [
          'assets/images/gripwise_images/1.png',
          'assets/images/gripwise_images/2.png',
          'assets/images/gripwise_images/3.png',
          'assets/images/gripwise_images/4.png',
          'assets/images/gripwise_images/5.png',
          'assets/images/gripwise_images/6.png',
          'assets/images/gripwise_images/7.png',
        ],
      ),
      TitleSection('DESCRIPTION.'),
      TextSection(
        text: TextSpan(
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          children: [
            TextSpan(
                text:
                    'This app was developed for Netherlands company "Gripwise". Project\'s scope is creating an easy to use equipment, work and timeframe management tools all in one, fitted to work with their workflows and procedures.\n\n'),
            TextSpan(
                text:
                    'App was developed using Flutter for front-end and Firebase as back-end. \n\n'),
            TextSpan(
                text:
                    'Product is field tested on usage for high quality production films and movies. \n'),
          ],
        ),
      ),
    ],
  ),
  PageModel(
    title: 'Delauney.mx',
    path: '/delauneymx',
    backgroundImage: 'assets/images/delauneymx_images/bg_image.png',
    actionLink: 'Delauney.mx',
    actionLinkHint: 'Visit Delauney.mx',
    sections: [
      ImageListSection(
        images: [
          'assets/images/delauneymx_images/1.png',
          'assets/images/delauneymx_images/2.png',
          'assets/images/delauneymx_images/3.png',
          'assets/images/delauneymx_images/4.png',
          'assets/images/delauneymx_images/5.png',
          'assets/images/delauneymx_images/6.png',
          'assets/images/delauneymx_images/7.png',
        ],
      ),
      TitleSection('DESCRIPTION.'),
      TextSection(
        text: TextSpan(
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          children: [
            TextSpan(
                text:
                    'This app was developed for Delauney.mx. A Shampoo and health-care company located in mexico. \n\n'),
            TextSpan(
                text:
                    'App was developed using Flutter, Firebase and php(server/mysql). \n\n'),
            TextSpan(
                text:
                    'TimeFrame: 1.5 months. \nDelivered Products: Mobile App for iOS and Android, Administrator panel, Backend made in php / mySQL on a dedicated VPS. \n'),
          ],
        ),
      ),
      BannerSection(
        title: 'Check it out on\nGoogle Play Store.',
        actionText: 'play.google.com',
        actionUrl: 'https://play.google.com/store/apps/details?id=com.delauney.mx',
        image: 'assets/images/delauneymx_images/link_google_play_preview.png',
      ),
      BannerSection(
        title: 'Check it out on\nApp Store.',
        actionText: 'apps.apple.com',
        actionUrl: 'https://apps.apple.com/us/app/delauney/id6446408684',
        image: 'assets/images/delauneymx_images/link_appstore_preview.png',
      ),
    ],
  ),
  PageModel(
    title: 'Aggregate',
    path: '/aggregate',
    backgroundImage: 'assets/images/aggregate_images/bg_image.png',
    actionLink: 'test',
    actionLinkHint: 'Visit test link',
    sections: [
      ImageListSection(
        images: [
          'assets/images/aggregate_images/1.jpg',
          'assets/images/aggregate_images/2.jpg',
          'assets/images/aggregate_images/3.jpg',
          'assets/images/aggregate_images/4.jpg',
          'assets/images/aggregate_images/5.jpg',
          'assets/images/aggregate_images/6.jpg',
          'assets/images/aggregate_images/7.jpg',
          'assets/images/aggregate_images/8.jpg',
          'assets/images/aggregate_images/9.jpg',
        ],
      ),
      TitleSection('DESCRIPTION.'),
      TextSection(
        text: TextSpan(
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          children: [
            TextSpan(
                text:
                    'Aggregate is a mobile application for Android and iOS users. It\'s designed to help you trade your solana assets efficiently. \n\n'),
            TextSpan(
                text:
                    'With Aggregate, you can easily explore new NFTs, track your favorite Collectibles, sell and buy NFTs and keep track of your wallet and your trading performance. \n\n'),
            TextSpan(
                text:
                    'Built with Flutter, Aggregate is a cross-platform application that can be used on both Android and iOS devices. It integrates Phantom Solana mobile wallet with deep-linking. \n\n'),
            TextSpan(
                text:
                    'App Uses firebase for crashalytics and performance monitoring, and CoralCube, MagicEden and Hyperspace Rest APIs for seamless user experience between different platforms. \n\n'),
          ],
        ),
      ),
    ],
  )
];

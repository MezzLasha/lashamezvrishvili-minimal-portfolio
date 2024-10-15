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
    actionLink: 'https://gripwise.vercel.app/',
    actionLinkHint: 'Visit Gripwise',
    sections: [
      ImageListSection(
        width: 400,
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
    title: 'Echo',
    path: '/echo',
    backgroundImage: 'assets/images/echo_images/bg_image.png',
    actionLink:
        'https://balance.ge/%E1%83%9B%E1%83%94%E1%83%9C%E1%83%94%E1%83%AF%E1%83%94%E1%83%A0%E1%83%98%E1%83%A1-%E1%83%90%E1%83%9E%E1%83%9A%E1%83%98%E1%83%99%E1%83%90%E1%83%AA%E1%83%98%E1%83%90',
    actionLinkHint: 'Visit Echo',
    sections: [
      ImageListSection(
        width: 145,
        images: [
          'assets/images/echo_images/1.webp',
          'assets/images/echo_images/2.webp',
          'assets/images/echo_images/3.webp',
          'assets/images/echo_images/4.webp',
          'assets/images/echo_images/5.webp',
          'assets/images/echo_images/6.webp',
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
                  'Echo is a business intelligence (BI) application designed for small and medium-sized enterprises (SMEs). It enables business owners and managers to access real-time financial and operational reports from their mobile devices. \n\n'
                  'The app provides powerful data analysis tools, including interactive charts, dashboards, and trend forecasting based on historical data using various statistical models (linear, exponential, logarithmic, etc.). \n\n'
                  'Echo supports easy information sharing between departments, fostering transparency and collaboration within organizations. It also integrates with the Balance program for seamless access to critical business data, allowing users to monitor cash flows, sales, top products, and key financial metrics such as debtors and creditors. \n\n'
                  'Built with Flutter, Echo ensures smooth performance, with a focus on usability and real-time insights.',
            ),
          ],
        ),
      ),
      BannerSection(
        title: 'Check it out on\nGoogle Play Store.',
        actionText: 'play.google.com',
        actionUrl:
            'https://play.google.com/store/apps/details?id=ge.balance.echo&pcampaignid=web_share',
        image: 'assets/images/echo_images/link_google_play_preview.png',
      ),
      BannerSection(
        title: 'Check it out on\nApp Store.',
        actionText: 'apps.apple.com',
        actionUrl: 'https://apps.apple.com/us/app/balance-echo/id6478484955',
        image: 'assets/images/echo_images/link_app_store_preview.png',
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
        width: 155,
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
  ),
];

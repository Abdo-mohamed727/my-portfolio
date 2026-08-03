import '../models/project_model.dart';

/// ============================================================
/// EDIT THIS FILE to update your personal info and projects.
/// This is the only file you need to touch to customize content.
/// ============================================================

class PortfolioData {
  static const String name = 'Abdulrahman Mohammed';
  static const String title = 'Flutter Developer';
  static const String tagline =
      'I build clean, scalable mobile apps with Flutter — '
      'from Clean Architecture and BLoC state management to '
      'Firebase-powered backends.';

  static const String about =
      'Computer Science student at Benha University and Flutter developer '
      'with hands-on experience in Clean Architecture, BLoC/Cubit, Dio/Retrofit '
      'networking, and Firebase (Auth, Firestore, FCM). Completed an NTI internship '
      'and built multiple end-to-end apps including an e-commerce platform. '
      'Currently expanding into AI engineering alongside mobile development.';

  static const String email = 'your.email@example.com'; // TODO: update
  static const String github =
      'https://github.com/your-username'; // TODO: update
  static const String linkedin =
      'https://linkedin.com/in/your-profile'; // TODO: update
  static const String cvUrl = ''; // TODO: link to your CV (e.g. hosted PDF)

  static const List<String> skills = [
    'Flutter & Dart',
    'Clean Architecture',
    'BLoC / Cubit',
    'Dio & Retrofit',
    'Firebase (Auth, Firestore, FCM)',
    'GetIt / Injectable (DI)',
    'RESTful APIs',
    'Git & GitHub',
    'Python (learning)',
    'Data Structures & Algorithms',
  ];

  static const List<ProjectModel> projects = [
    ProjectModel(
      title: 'BlinkBuy',
      description:
          'A supermarket / e-commerce Flutter app built with Clean Architecture. '
          'Features include favourites with optimistic UI updates, profile image '
          'uploads, push notifications, and a fully reactive BLoC-driven UI.',
      techStack: [
        'Flutter',
        'BLoC',
        'Dio',
        'Firebase FCM',
        'Clean Architecture'
      ],
      highlights: [
        'Optimistic UI updates for instant favourite toggling with smooth animations',
        'Fixed FCM foreground/background notification delivery end-to-end',
        'Refactored state logic using BlocSelector for granular rebuilds',
      ],
      githubUrl: '', // TODO: add your repo link
      screenshots: [
        'assets/projects/blinkbuy/Screenshot_1785795073.png',
        'assets/projects/blinkbuy/Screenshot_1785795076.png',
        'assets/projects/blinkbuy/Screenshot_1785795081.png',
        'assets/projects/blinkbuy/Screenshot_1785795085.png',
        'assets/projects/blinkbuy/Screenshot_1785795090.png',
        'assets/projects/blinkbuy/Screenshot_1785795218.png',
        'assets/projects/blinkbuy/Screenshot_1785410291.png',
        'assets/projects/blinkbuy/Screenshot_1785292660.png',
        'assets/projects/blinkbuy/Screenshot_1785795225.png',
        'assets/projects/blinkbuy/Screenshot_1785795235.png',
        'assets/projects/blinkbuy/Screenshot_1785795245.png',
        'assets/projects/blinkbuy/Screenshot_1785795760.png',
        'assets/projects/blinkbuy/Screenshot_1785795763.png',
        'assets/projects/blinkbuy/Screenshot_1785795775.png',
      ],
    ),
    ProjectModel(
      title: 'Tasky',
      description:
          'A Firebase-backed task management app focused on clean data modeling '
          'and a smooth task creation flow.',
      techStack: ['Flutter', 'Firebase', 'Cloud Firestore'],
      highlights: [
        'Designed Firestore auto-ID data structure and copyWith update pattern',
        'Built a custom AddTaskBottomSheet widget',
      ],
      githubUrl: '', // TODO: add your repo link
      screenshots: [
        // TODO: add screenshots, e.g. 'assets/projects/tasky/1.png'
      ],
    ),
    ProjectModel(
      title: 'Nexa_Store',
      description:
          'An earlier Store app project used to deepen understanding of '
          'Clean Architecture domain layers and a multi-file theming system.',
      techStack: ['Flutter', 'Clean Architecture', 'ThemeExtension'],
      highlights: [
        'Built a Favourites feature with spec-driven development',
        'Designed a multi-file theme architecture with light/dark support',
      ],
      githubUrl: '',
      screenshots: [
        'assets/projects/my_store/admin/Screenshot_1785798080.png',
        'assets/projects/my_store/admin/Screenshot_1785798085.png',
        'assets/projects/my_store/admin/Screenshot_1785798095.png',
        'assets/projects/my_store/admin/Screenshot_1785798101.png',
        'assets/projects/my_store/admin/Screenshot_1785798112.png',
        'assets/projects/my_store/admin/Screenshot_1785798116.png',
        'assets/projects/my_store/admin/Screenshot_1785798123.png',
        'assets/projects/my_store/admin/Screenshot_1785798127.png',
        'assets/projects/my_store/admin/Screenshot_1785798139.png',
        'assets/projects/my_store/coustmer/Screenshot_1785797814.png',
        'assets/projects/my_store/coustmer/Screenshot_1785797821.png',
        'assets/projects/my_store/coustmer/Screenshot_1785797915.png',
        'assets/projects/my_store/coustmer/Screenshot_1785797927.png',
        'assets/projects/my_store/coustmer/Screenshot_1785797948.png',
        'assets/projects/my_store/coustmer/Screenshot_1785797958.png',
        'assets/projects/my_store/coustmer/Screenshot_1785797977.png',
        'assets/projects/my_store/coustmer/Screenshot_1785797988.png',
        // TODO: add screenshots, e.g. 'assets/projects/nexa_store/1.png'
      ],
    ),
  ];
}

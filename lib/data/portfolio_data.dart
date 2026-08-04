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

  static const String email = 'abdelrahamn.moh.116@gmail.com'; // TODO: update
  static const String github =
      'https://github.com/Abdo-mohamed727'; // TODO: update
  static const String linkedin =
      'https://www.linkedin.com/in/abdelrahman-mohamed-242571345/?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3B1rC4RAxRTwSCJWWBaSN%2FQw%3D%3D'; // TODO: update
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
        'Built an e-commerce app with product browsing, detailed product views, cart management, and search delivered as part of a 4-developer team.',
        'Collaborated using Git/GitHub feature-branch workflows and pull request reviews, contributing to code reviews and architecture discussions across Clean Architecture layers.',
        'Debugged and resolved integration issues arising from parallel feature development, including state-management mismatches and API contract conflicts.',
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
      techStack: ['Flutter', 'Graph QL', 'Clean Architecture'],
      highlights: [
        ' Developing a store app with product browsing, detailed product views, cart management, and role-based access for two distinct user roles (Admin and Customer)',
        ' Integrated GraphQL for efficient, flexible data fetching in place of traditional REST calls, reducing over-fetching of product data',
        ' Implemented using Bloc state management with push notification integration for real-time order and inventory updates',
        ' Applied clean code principles and reusable widget architecture to support long-term scalability and maintainability',
      ],
      githubUrl: '',
      screenshots: [
        'assets/projects/my_store/admin/Screenshot_1785875760.png',
        'assets/projects/my_store/admin/Screenshot_1785875763.png',
        'assets/projects/my_store/admin/Screenshot_1785875768.png',
        'assets/projects/my_store/admin/Screenshot_1785875773.png',
        'assets/projects/my_store/admin/Screenshot_1785875780.png',
        'assets/projects/my_store/admin/Screenshot_1785875823.png',
        'assets/projects/my_store/admin/Screenshot_1785875827.png',
        'assets/projects/my_store/coustomer/Screenshot_1785875621.png',
        'assets/projects/my_store/coustomer/Screenshot_1785875634.png',
        'assets/projects/my_store/coustomer/Screenshot_1785875639.png',
        'assets/projects/my_store/coustomer/Screenshot_1785875643.png',
        'assets/projects/my_store/coustomer/Screenshot_1785875650.png',
        'assets/projects/my_store/coustomer/Screenshot_1785875660.png',
        'assets/projects/my_store/coustomer/Screenshot_1785875667.png',
        // TODO: add screenshots, e.g. 'assets/projects/nexa_store/1.png'
      ],
    ),
  ];
}

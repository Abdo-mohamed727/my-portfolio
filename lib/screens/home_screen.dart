import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/nav_bar.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/contact_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            NavBar(
              onAboutTap: () => _scrollTo(_aboutKey),
              onProjectsTap: () => _scrollTo(_projectsKey),
              onContactTap: () => _scrollTo(_contactKey),
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    HeroSection(
                      onProjectsTap: () => _scrollTo(_projectsKey),
                      onContactTap: () => _scrollTo(_contactKey),
                    ),
                    KeyedSubtree(key: _aboutKey, child: const AboutSection()),
                    KeyedSubtree(
                        key: _projectsKey, child: const ProjectsSection()),
                    KeyedSubtree(
                        key: _contactKey, child: const ContactSection()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

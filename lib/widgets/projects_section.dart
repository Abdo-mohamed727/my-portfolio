import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';
import 'project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = Responsive.isDesktop(context)
        ? 2
        : Responsive.isTablet(context)
            ? 2
            : 1;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.horizontalPadding(context),
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 32, height: 2, color: AppColors.primary),
              const SizedBox(width: 12),
              const Text(
                'PROJECTS',
                style: TextStyle(
                  color: AppColors.primaryLight,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text('Things I\'ve built',
              style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 32),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: PortfolioData.projects.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              mainAxisExtent: 380,
            ),
            itemBuilder: (context, index) =>
                ProjectCard(project: PortfolioData.projects[index]),
          ),
        ],
      ),
    );
  }
}

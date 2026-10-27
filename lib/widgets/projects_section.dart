import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';
import 'project_card.dart';
import 'reveal_on_scroll.dart';

class ProjectsSection extends StatelessWidget {
  final ScrollController scrollController;

  const ProjectsSection({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return RevealOnScroll(
      scrollController: scrollController,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.horizontalPadding(context),
          vertical: Responsive.sectionVerticalPadding(context),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
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
                LayoutBuilder(
                  builder: (context, constraints) {
                    final columns = constraints.maxWidth >= 760 ? 2 : 1;
                    final cardWidth = columns == 1
                        ? constraints.maxWidth
                        : (constraints.maxWidth - 24) / 2;

                    return Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      children: [
                        for (var index = 0;
                            index < PortfolioData.projects.length;
                            index++)
                          SizedBox(
                            width: cardWidth,
                            child: RevealOnScroll(
                              scrollController: scrollController,
                              delay: Duration(milliseconds: index * 100),
                              child: ProjectCard(
                                project: PortfolioData.projects[index],
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.horizontalPadding(context),
        vertical: 80,
      ),
      color: AppColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionLabel(label: 'ABOUT ME'),
          const SizedBox(height: 16),
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: isMobile
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: isMobile ? 0 : 1,
                child: Text(
                  PortfolioData.about,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 17,
                      ),
                ),
              ),
              SizedBox(width: isMobile ? 0 : 60, height: isMobile ? 32 : 0),
              Expanded(
                flex: isMobile ? 0 : 1,
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: PortfolioData.skills
                      .map((skill) => _SkillChip(label: skill))
                      .toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 32, height: 2, color: AppColors.primary),
        const SizedBox(width: 12),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.primaryLight,
            fontSize: 13,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
          ),
        ),
      ],
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;
  const _SkillChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        label,
        style: const TextStyle(color: AppColors.textPrimary, fontSize: 13.5),
      ),
    );
  }
}

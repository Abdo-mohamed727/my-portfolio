import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../models/project_model.dart';
import '../screens/project_presentation_screen.dart';

class ProjectCard extends StatelessWidget {
  final ProjectModel project;

  const ProjectCard({super.key, required this.project});

  Future<void> _launch(String url) async {
    if (url.isEmpty) return;
    final uri = Uri.tryParse(url);
    if (uri != null) await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  void _openPresentation(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ProjectPresentationScreen(project: project),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _openPresentation(context),
      borderRadius: BorderRadius.circular(14),
      child: Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(project.title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Text(project.description, style: Theme.of(context).textTheme.bodyMedium),
          if (project.highlights.isNotEmpty) ...[
            const SizedBox(height: 16),
            ...project.highlights.map(
              (h) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: Icon(Icons.circle, size: 5, color: AppColors.accent),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(h, style: Theme.of(context).textTheme.bodyMedium),
                    ),
                  ],
                ),
              ),
            ),
          ],
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: project.techStack
                .map((t) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        t,
                        style: const TextStyle(
                          color: AppColors.primaryLight,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ))
                .toList(),
          ),
          if ((project.githubUrl ?? '').isNotEmpty ||
              (project.liveUrl ?? '').isNotEmpty) ...[
            const SizedBox(height: 18),
            Row(
              children: [
                if ((project.githubUrl ?? '').isNotEmpty)
                  TextButton.icon(
                    onPressed: () => _launch(project.githubUrl!),
                    icon: const Icon(Icons.code, size: 18),
                    label: const Text('Code'),
                    style: TextButton.styleFrom(
                        foregroundColor: AppColors.textPrimary),
                  ),
                if ((project.liveUrl ?? '').isNotEmpty)
                  TextButton.icon(
                    onPressed: () => _launch(project.liveUrl!),
                    icon: const Icon(Icons.open_in_new, size: 18),
                    label: const Text('Live'),
                    style: TextButton.styleFrom(
                        foregroundColor: AppColors.textPrimary),
                  ),
              ],
            ),
          ],
        ],
      ),
      ),
    );
  }
}

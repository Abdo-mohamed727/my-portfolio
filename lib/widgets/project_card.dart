import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../models/project_model.dart';
import '../screens/project_presentation_screen.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovering = false;

  Future<void> _launch(String url) async {
    if (url.isEmpty) return;
    final uri = Uri.tryParse(url);
    if (uri != null) await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  void _openPresentation(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder<void>(
        transitionDuration: const Duration(milliseconds: 400),
        reverseTransitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (context, animation, secondaryAnimation) =>
            ProjectPresentationScreen(project: widget.project),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curved = CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCubic,
          );
          return FadeTransition(
            opacity: curved,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.035),
                end: Offset.zero,
              ).animate(curved),
              child: child,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isHovered = Responsive.supportsHover && _hovering;
    return MouseRegion(
      onEnter: Responsive.supportsHover
          ? (_) => setState(() => _hovering = true)
          : null,
      onExit: Responsive.supportsHover
          ? (_) => setState(() => _hovering = false)
          : null,
      child: AnimatedScale(
        scale: isHovered ? 1.02 : 1,
        duration: const Duration(milliseconds: 240),
        curve: Curves.easeOutCubic,
        child: InkWell(
          onTap: () => _openPresentation(context),
          borderRadius: BorderRadius.circular(14),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 240),
            curve: Curves.easeOutCubic,
            padding: EdgeInsets.all(Responsive.isMobile(context) ? 20 : 28),
            decoration: BoxDecoration(
              color: AppColors.surfaceLight,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: isHovered ? AppColors.primary : AppColors.border,
              ),
              boxShadow: isHovered
                  ? [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.16),
                        blurRadius: 22,
                        spreadRadius: 1,
                        offset: const Offset(0, 8),
                      ),
                    ]
                  : const [],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: 'project-title-${widget.project.title}',
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      widget.project.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(widget.project.description,
                    style: Theme.of(context).textTheme.bodyMedium),
                if (widget.project.highlights.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  ...widget.project.highlights.map(
                    (highlight) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Icon(Icons.circle,
                                size: 5, color: AppColors.accent),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              highlight,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                LayoutBuilder(
                  builder: (context, constraints) => Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.project.techStack
                        .map(
                          (technology) => ConstrainedBox(
                            constraints:
                                BoxConstraints(maxWidth: constraints.maxWidth),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                color: AppColors.background,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                technology,
                                softWrap: true,
                                style: const TextStyle(
                                  color: AppColors.primaryLight,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                if ((widget.project.githubUrl ?? '').isNotEmpty ||
                    (widget.project.liveUrl ?? '').isNotEmpty) ...[
                  const SizedBox(height: 18),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      if ((widget.project.githubUrl ?? '').isNotEmpty)
                        TextButton.icon(
                          onPressed: () => _launch(widget.project.githubUrl!),
                          icon: const Icon(Icons.code, size: 18),
                          label: const Text('Code'),
                          style: TextButton.styleFrom(
                              foregroundColor: AppColors.textPrimary),
                        ),
                      if ((widget.project.liveUrl ?? '').isNotEmpty)
                        TextButton.icon(
                          onPressed: () => _launch(widget.project.liveUrl!),
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
        ),
      ),
    );
  }
}

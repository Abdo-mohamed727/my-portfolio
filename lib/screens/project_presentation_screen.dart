import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../models/project_model.dart';

class ProjectPresentationScreen extends StatefulWidget {
  final ProjectModel project;

  const ProjectPresentationScreen({super.key, required this.project});

  @override
  State<ProjectPresentationScreen> createState() =>
      _ProjectPresentationScreenState();
}

class _ProjectPresentationScreenState extends State<ProjectPresentationScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.62);
  int _currentPage = 0;

  Future<void> _launch(String url) async {
    if (url.isEmpty) return;
    final uri = Uri.tryParse(url);
    if (uri != null) await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final project = widget.project;
    final isMobile = Responsive.isMobile(context);
    final hasShots = project.screenshots.isNotEmpty;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.horizontalPadding(context),
              vertical: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back button
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  borderRadius: BorderRadius.circular(8),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.arrow_back,
                            color: AppColors.textSecondary, size: 18),
                        SizedBox(width: 8),
                        Text('Back to projects',
                            style: TextStyle(color: AppColors.textSecondary)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Text(project.title,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: isMobile ? 32 : 44,
                        )),
                const SizedBox(height: 12),
                SizedBox(
                  width: isMobile ? double.infinity : 700,
                  child: Text(project.description,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontSize: 16)),
                ),
                const SizedBox(height: 28),

                // --- Demo presentation (image carousel) ---
                if (hasShots) ...[
                  _buildCarousel(project),
                  const SizedBox(height: 16),
                  _buildDots(project.screenshots.length),
                  const SizedBox(height: 36),
                ] else
                  _buildPlaceholder(),

                const SizedBox(height: 12),

                // Highlights
                if (project.highlights.isNotEmpty) ...[
                  Text('Highlights',
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 14),
                  ...project.highlights.map(
                    (h) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
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
                            child: Text(h,
                                style: Theme.of(context).textTheme.bodyLarge),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                ],

                // Tech stack
                Text('Tech stack',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 14),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: project.techStack
                      .map((t) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 10),
                            decoration: BoxDecoration(
                              color: AppColors.surfaceLight,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.border),
                            ),
                            child: Text(t,
                                style: const TextStyle(
                                    color: AppColors.textPrimary,
                                    fontSize: 13.5)),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 36),

                // Links
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    if ((project.githubUrl ?? '').isNotEmpty)
                      ElevatedButton.icon(
                        onPressed: () => _launch(project.githubUrl!),
                        icon: const Icon(Icons.code, size: 18),
                        label: const Text('View Code'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    if ((project.liveUrl ?? '').isNotEmpty)
                      OutlinedButton.icon(
                        onPressed: () => _launch(project.liveUrl!),
                        icon: const Icon(Icons.open_in_new, size: 18),
                        label: const Text('Live Demo'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.textPrimary,
                          side: const BorderSide(color: AppColors.border),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String path) {
    final isNetwork = path.startsWith('http://') || path.startsWith('https://');
    final errorWidget = const Center(
      child: Icon(Icons.image_not_supported,
          color: AppColors.textSecondary, size: 40),
    );

    if (isNetwork) {
      return Image.network(
        path,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
              strokeWidth: 2,
            ),
          );
        },
        errorBuilder: (context, error, stack) => errorWidget,
      );
    }

    return Image.asset(
      path,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stack) => errorWidget,
    );
  }

  Widget _buildCarousel(ProjectModel project) {
    final isMobile = Responsive.isMobile(context);

    return SizedBox(
      height: isMobile ? 320 : 480,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: project.screenshots.length,
            onPageChanged: (i) => setState(() => _currentPage = i),
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  double page = _currentPage.toDouble();
                  if (_pageController.hasClients &&
                      _pageController.position.haveDimensions) {
                    page = _pageController.page ?? _currentPage.toDouble();
                  }
                  final distance = (page - index).abs().clamp(0.0, 1.0);
                  // Centered screenshot: full size & fully opaque.
                  // Neighbours: slightly smaller & faded.
                  final scale = 1 - (distance * 0.22);
                  final opacity = 1 - (distance * 0.55);

                  return Center(
                    child: Opacity(
                      opacity: opacity,
                      child: Transform.scale(
                        scale: scale,
                        child: child,
                      ),
                    ),
                  );
                },
                child: GestureDetector(
                  onTap: () {
                    if (index != _currentPage) {
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.surfaceLight,
                          border: Border.all(color: AppColors.border),
                        ),
                        child: _buildImage(project.screenshots[index]),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          if (project.screenshots.length > 1) ...[
            Positioned(
              left: isMobile ? 4 : 16,
              child: _NavArrow(
                icon: Icons.chevron_left,
                onTap: () => _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                ),
              ),
            ),
            Positioned(
              right: isMobile ? 4 : 16,
              child: _NavArrow(
                icon: Icons.chevron_right,
                onTap: () => _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDots(int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (i) => AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: i == _currentPage ? 22 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: i == _currentPage ? AppColors.primary : AppColors.border,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.photo_library_outlined,
                color: AppColors.textSecondary, size: 36),
            SizedBox(height: 10),
            Text(
              'Add screenshots in portfolio_data.dart\nto show a demo here',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavArrow extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _NavArrow({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.35),
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Icon(icon, color: Colors.white, size: 26),
        ),
      ),
    );
  }
}

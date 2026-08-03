class ProjectModel {
  final String title;
  final String description;
  final List<String> techStack;
  final String? githubUrl;
  final String? liveUrl;
  final List<String> highlights;

  /// Paths to screenshots/demo images for this project, e.g.
  /// 'assets/projects/blinkbuy/1.png'. Shown as a swipeable
  /// presentation on the project detail screen.
  final List<String> screenshots;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.techStack,
    this.githubUrl,
    this.liveUrl,
    this.highlights = const [],
    this.screenshots = const [],
  });
}

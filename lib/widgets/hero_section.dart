import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';
import 'hover_scale.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  const HeroSection({
    super.key,
    required this.onProjectsTap,
    required this.onContactTap,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<Animation<double>> _entrances;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _entrances = List.generate(5, (index) {
      final start = index * 0.1;
      final end = (start + 0.6).clamp(0.0, 1.0);
      return CurvedAnimation(
        parent: _controller,
        curve: Interval(start, end, curve: Curves.easeOutCubic),
      );
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _entrance(int index, Widget child) {
    final animation = _entrances[index];
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.12),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.horizontalPadding(context),
        vertical: isMobile ? 64 : 120,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _entrance(
                0,
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceLight,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.circle, size: 8, color: AppColors.accent),
                      SizedBox(width: 8),
                      Text(
                        'Available for opportunities',
                        style: TextStyle(
                            color: AppColors.textSecondary, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 28),
              _entrance(
                1,
                Text(
                  'Hi, I\'m ${PortfolioData.name}.',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: isMobile ? 36 : 56,
                      ),
                ),
              ),
              _entrance(
                2,
                Text(
                  PortfolioData.title,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: isMobile ? 36 : 56,
                        color: AppColors.primaryLight,
                      ),
                ),
              ),
              const SizedBox(height: 20),
              _entrance(
                3,
                SizedBox(
                  width: isMobile ? double.infinity : 560,
                  child: Text(
                    PortfolioData.tagline,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              const SizedBox(height: 36),
              _entrance(
                4,
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    HoverScale(
                      child: ElevatedButton(
                        onPressed: widget.onProjectsTap,
                        style: ButtonStyle(
                          animationDuration: const Duration(milliseconds: 220),
                          backgroundColor:
                              WidgetStateProperty.resolveWith((states) {
                            return states.contains(WidgetState.hovered)
                                ? AppColors.primaryLight
                                : AppColors.primary;
                          }),
                          foregroundColor:
                              const WidgetStatePropertyAll(Colors.white),
                          padding: const WidgetStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                          ),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        child: const Text('View Projects'),
                      ),
                    ),
                    HoverScale(
                      child: OutlinedButton(
                        onPressed: widget.onContactTap,
                        style: ButtonStyle(
                          animationDuration: const Duration(milliseconds: 220),
                          foregroundColor: const WidgetStatePropertyAll(
                              AppColors.textPrimary),
                          side: WidgetStateProperty.resolveWith((states) {
                            return BorderSide(
                              color: states.contains(WidgetState.hovered)
                                  ? AppColors.primary
                                  : AppColors.border,
                            );
                          }),
                          padding: const WidgetStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                          ),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        child: const Text('Get in Touch'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

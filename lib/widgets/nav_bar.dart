import 'dart:ui';

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';

class NavBar extends StatefulWidget {
  final VoidCallback onAboutTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;
  final ScrollController scrollController;

  const NavBar({
    super.key,
    required this.onAboutTap,
    required this.onProjectsTap,
    required this.onContactTap,
    required this.scrollController,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool _scrolled = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_updateScrollState);
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateScrollState());
  }

  @override
  void didUpdateWidget(covariant NavBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.scrollController != widget.scrollController) {
      oldWidget.scrollController.removeListener(_updateScrollState);
      widget.scrollController.addListener(_updateScrollState);
      _updateScrollState();
    }
  }

  void _updateScrollState() {
    if (!mounted || !widget.scrollController.hasClients) return;
    final scrolled = widget.scrollController.offset > 8;
    if (scrolled != _scrolled) setState(() => _scrolled = scrolled);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_updateScrollState);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return ClipRect(
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: _scrolled ? 8 : 0),
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        builder: (context, blur, child) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: child,
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.horizontalPadding(context),
            vertical: 20,
          ),
          decoration: BoxDecoration(
            color: AppColors.background.withValues(
              alpha: _scrolled ? 0.88 : 0,
            ),
            border: const Border(
              bottom: BorderSide(color: AppColors.border),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/my_photo.jpeg',
                      width: isMobile ? 36 : 42,
                      height: isMobile ? 36 : 42,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          CircleAvatar(
                        radius: isMobile ? 18 : 21,
                        backgroundColor: AppColors.primary,
                        child: const Icon(Icons.person, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    PortfolioData.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              if (!isMobile)
                Row(
                  children: [
                    _NavItem(label: 'About', onTap: widget.onAboutTap),
                    const SizedBox(width: 32),
                    _NavItem(label: 'Projects', onTap: widget.onProjectsTap),
                    const SizedBox(width: 32),
                    _NavItem(label: 'Contact', onTap: widget.onContactTap),
                  ],
                )
              else
                PopupMenuButton<VoidCallback>(
                  icon: const Icon(Icons.menu, color: AppColors.textPrimary),
                  color: AppColors.surfaceLight,
                  onSelected: (action) => action(),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: widget.onAboutTap,
                      child: const Text('About'),
                    ),
                    PopupMenuItem(
                      value: widget.onProjectsTap,
                      child: const Text('Projects'),
                    ),
                    PopupMenuItem(
                      value: widget.onContactTap,
                      child: const Text('Contact'),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _NavItem({required this.label, required this.onTap});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: Responsive.supportsHover
          ? (_) => setState(() => _hovering = true)
          : null,
      onExit: Responsive.supportsHover
          ? (_) => setState(() => _hovering = false)
          : null,
      child: InkWell(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: TextStyle(
                  color: _hovering
                      ? AppColors.textPrimary
                      : AppColors.textSecondary,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOutCubic,
                width: _hovering ? 32 : 0,
                height: 2,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';
import 'hover_scale.dart';
import 'reveal_on_scroll.dart';

class ContactSection extends StatelessWidget {
  final ScrollController scrollController;

  const ContactSection({super.key, required this.scrollController});

  Future<void> _launch(String url) async {
    if (url.isEmpty) return;
    final uri = Uri.tryParse(url);
    if (uri != null) await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return RevealOnScroll(
      scrollController: scrollController,
      child: Container(
        width: double.infinity,
        color: AppColors.surface,
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.horizontalPadding(context),
          vertical: Responsive.sectionVerticalPadding(context),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(
              children: [
                Text(
                  'Let\'s work together',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontSize: isMobile ? 26 : 34,
                      ),
                ),
                const SizedBox(height: 14),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 480),
                  child: Text(
                    'I\'m open to junior Flutter developer roles and freelance projects. '
                    'Feel free to reach out — happy to talk about Flutter, Clean Architecture, '
                    'or anything mobile dev.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(height: 36),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: [
                    HoverScale(
                      child: ElevatedButton.icon(
                        onPressed: () =>
                            _launch('mailto:${PortfolioData.email}'),
                        icon: const Icon(Icons.email_outlined, size: 18),
                        label: const Text('Email Me'),
                        style: _elevatedButtonStyle(),
                      ),
                    ),
                    HoverScale(
                      child: OutlinedButton.icon(
                        onPressed: () => _launch(PortfolioData.github),
                        icon: const Icon(Icons.code, size: 18),
                        label: const Text('GitHub'),
                        style: _outlinedButtonStyle(),
                      ),
                    ),
                    HoverScale(
                      child: OutlinedButton.icon(
                        onPressed: () => _launch(PortfolioData.linkedin),
                        icon: const Icon(Icons.link, size: 18),
                        label: const Text('LinkedIn'),
                        style: _outlinedButtonStyle(),
                      ),
                    ),
                    HoverScale(
                      child: OutlinedButton.icon(
                        onPressed: () => _launch(PortfolioData.cvUrl),
                        icon: const Icon(Icons.link, size: 18),
                        label: const Text('CV'),
                        style: _outlinedButtonStyle(),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 60),
                Container(height: 1, color: AppColors.border),
                const SizedBox(height: 24),
                Text(
                  '© ${DateTime.now().year} ${PortfolioData.name}. Built with Flutter.',
                  style: const TextStyle(
                      color: AppColors.textSecondary, fontSize: 13),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ButtonStyle _elevatedButtonStyle() {
    return ButtonStyle(
      animationDuration: const Duration(milliseconds: 220),
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        return states.contains(WidgetState.hovered)
            ? AppColors.primaryLight
            : AppColors.primary;
      }),
      foregroundColor: const WidgetStatePropertyAll(Colors.white),
      padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 24, vertical: 16)),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  ButtonStyle _outlinedButtonStyle() {
    return ButtonStyle(
      animationDuration: const Duration(milliseconds: 220),
      foregroundColor: const WidgetStatePropertyAll(AppColors.textPrimary),
      side: WidgetStateProperty.resolveWith((states) {
        return BorderSide(
          color: states.contains(WidgetState.hovered)
              ? AppColors.primary
              : AppColors.border,
        );
      }),
      padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 24, vertical: 16)),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

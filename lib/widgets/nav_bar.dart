import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';

class NavBar extends StatelessWidget {
  final VoidCallback onAboutTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  const NavBar({
    super.key,
    required this.onAboutTap,
    required this.onProjectsTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.horizontalPadding(context),
        vertical: 20,
      ),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            PortfolioData.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          if (!isMobile)
            Row(
              children: [
                _NavItem(label: 'About', onTap: onAboutTap),
                const SizedBox(width: 32),
                _NavItem(label: 'Projects', onTap: onProjectsTap),
                const SizedBox(width: 32),
                _NavItem(label: 'Contact', onTap: onContactTap),
              ],
            )
          else
            IconButton(
              icon: const Icon(Icons.menu, color: AppColors.textPrimary),
              onPressed: onContactTap,
            ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _NavItem({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

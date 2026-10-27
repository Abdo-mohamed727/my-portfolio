import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HoverScale extends StatefulWidget {
  final Widget child;
  final double scale;

  const HoverScale({
    super.key,
    required this.child,
    this.scale = 1.03,
  });

  @override
  State<HoverScale> createState() => _HoverScaleState();
}

class _HoverScaleState extends State<HoverScale> {
  bool _hovering = false;

  bool get _supportsHover =>
      kIsWeb ||
      defaultTargetPlatform == TargetPlatform.macOS ||
      defaultTargetPlatform == TargetPlatform.windows ||
      defaultTargetPlatform == TargetPlatform.linux;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _supportsHover ? (_) => setState(() => _hovering = true) : null,
      onExit: _supportsHover ? (_) => setState(() => _hovering = false) : null,
      child: AnimatedScale(
        scale: _hovering ? widget.scale : 1,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        child: widget.child,
      ),
    );
  }
}

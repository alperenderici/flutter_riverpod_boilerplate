import 'package:flutter/material.dart';

/// Loading button widget with built-in loading state
class LoadingButton extends StatefulWidget {
  const LoadingButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.style,
    this.loadingText,
    this.icon,
    this.isLoading = false,
    this.disabled = false,
  });

  final Future<void> Function() onPressed;
  final String text;
  final ButtonStyle? style;
  final String? loadingText;
  final Widget? icon;
  final bool isLoading;
  final bool disabled;

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _isLoading = widget.isLoading;
  }

  @override
  void didUpdateWidget(LoadingButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isLoading != oldWidget.isLoading) {
      _isLoading = widget.isLoading;
    }
  }

  Future<void> _handlePressed() async {
    if (_isLoading || widget.disabled) return;

    setState(() {
      _isLoading = true;
    });

    try {
      await widget.onPressed();
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDisabled = widget.disabled || _isLoading;

    if (widget.icon != null) {
      return ElevatedButton.icon(
        onPressed: isDisabled ? null : _handlePressed,
        style: widget.style,
        icon: _isLoading
            ? const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : widget.icon!,
        label: Text(
          _isLoading ? (widget.loadingText ?? 'Loading...') : widget.text,
        ),
      );
    }

    return ElevatedButton(
      onPressed: isDisabled ? null : _handlePressed,
      style: widget.style,
      child: _isLoading
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
                const SizedBox(width: 8),
                Text(widget.loadingText ?? 'Loading...'),
              ],
            )
          : Text(widget.text),
    );
  }
}

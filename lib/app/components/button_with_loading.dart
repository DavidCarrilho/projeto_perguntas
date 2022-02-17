import 'package:flutter/material.dart';

class ButtonWithLoading extends StatefulWidget {
  final String buttonText;
  final Function onClick;
  final bool isLoading;

  const ButtonWithLoading({
    this.buttonText,
    this.onClick,
    this.isLoading = false,
  });

  @override
  State<ButtonWithLoading> createState() => _ButtonWithLoadingState();
}

class _ButtonWithLoadingState extends State<ButtonWithLoading>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Tween<double> _tween;
  Animation<double> _animation;
  bool isAnimating = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    _tween = Tween(begin: 0.0, end: 1);

    _animation = _tween.animate(
      CurvedAnimation(
        curve: Curves.linear,
        parent: _controller,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildButtonTitle() {
    return Text(
      widget.buttonText.toUpperCase(),
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading && isAnimating == false) {
      isAnimating = true;
      _controller.repeat();
    } else {
      isAnimating = false;
      _controller.stop();
    }
    return InkWell(
      onTap: isAnimating ? null : widget.onClick,
      child: Container(
        height: 60.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(60.0),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return LinearProgressIndicator(
                    value: !widget.isLoading
                        ? 0.0
                        : _animation.value,
                    // minHeight: 60.0,
                    backgroundColor: Colors.yellow,
                    valueColor: const AlwaysStoppedAnimation((Colors.amber)),
                  );
                },
              ),
              _buildButtonTitle() ?? const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}

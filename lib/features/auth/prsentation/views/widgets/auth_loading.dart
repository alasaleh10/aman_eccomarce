import 'package:flutter/material.dart';

class AuthLoading extends StatefulWidget {
  final bool canPop;
  const AuthLoading({super.key, this.canPop = false});

  @override
  State<AuthLoading> createState() => _AuthLoadingState();
}

class _AuthLoadingState extends State<AuthLoading> {
  Offset offset = const Offset(0, -1);
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        offset = Offset.zero;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: widget.canPop,
      child: AnimatedSlide(
        offset: offset,
        duration: const Duration(milliseconds: 200),
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

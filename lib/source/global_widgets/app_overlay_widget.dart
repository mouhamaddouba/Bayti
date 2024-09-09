import 'package:bayti/source/global_widgets/app_loading_widget.dart';
import 'package:flutter/material.dart';

class AppOverlayWidget extends StatelessWidget {
  final Widget child;

  const AppOverlayWidget({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          child,
          ModalBarrier(
            dismissible: false,
            color: Colors.black.withOpacity(0.5),
          ),
          const AppLoadingWidget(),
        ],
      ),
    );
  }
}

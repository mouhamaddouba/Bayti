import 'package:flutter/material.dart';

import 'package:get/get.dart';

typedef BindingCreator<S extends Bindings> = S Function();

abstract class BaseWidget<Binding extends Bindings, Controller>
    extends GetView<Controller> {
  final BindingCreator<Binding>? bindingCreator;

  const BaseWidget({
    super.key,
    required this.bindingCreator,
  });

  Widget view(BuildContext context);

  @override
  Widget build(BuildContext context) {
    _createBinding();
    return view(context);
  }

  void _createBinding() {
    Binding? binding = bindingCreator?.call();
    binding?.dependencies();
  }
}

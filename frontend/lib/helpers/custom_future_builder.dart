import 'package:flutter/material.dart';

class CustomFutureBuilder<T> extends StatelessWidget {
  final Future<T>? future;
  final Widget Function(BuildContext context, AsyncSnapshot<T> snapshot)
      builder;
  final Widget Function(BuildContext context, AsyncSnapshot<T> snapshot)?
      loadingBuilder;
  final Widget Function(BuildContext context, AsyncSnapshot<T> snapshot)?
      errorBuilder;
  const CustomFutureBuilder(
      {super.key,
      required this.future,
      required this.builder,
      this.loadingBuilder,
      this.errorBuilder});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error!);
            print(snapshot.stackTrace!);
            errorBuilder?.call(context, snapshot);
          }
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            // TODO: Handle this case.
            case ConnectionState.waiting:
              return loadingBuilder?.call(context, snapshot) ??
                  const CircularProgressIndicator();
            case ConnectionState.active:
            // TODO: Handle this case.
            case ConnectionState.done:
              if (snapshot.hasData) {
                return builder.call(context, snapshot);
              } else {
                return Container();
              }
          }
        });
  }
}

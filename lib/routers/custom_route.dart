import 'package:flutter/material.dart';

class FadeRoute extends PageRouteBuilder{
  final Widget widget;
  FadeRoute({this.widget})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) => widget,
          transitionDuration: Duration(milliseconds: 500),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
                opacity: animation,
                child: child,
              ),
        );
}

class ScaleRoute extends PageRouteBuilder{
  final Widget widget;
  ScaleRoute({this.widget})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            // return new ScaleTransition(
            //   scale: new Tween<double>(
            //     begin: 0.0,
            //     end: 1.0,
            //   ).animate(
            //       CurvedAnimation(
            //         parent: animation,
            //         curve: Interval(
            //           0.00,
            //           0.50,
            //           curve: Curves.linear,
            //         ),
            //       ),
            //     ),
            //   child: ScaleTransition(
            //            scale: Tween<double>(
            //              begin: 1.5,
            //              end: 1.0,
            //            ).animate(
            //              CurvedAnimation(
            //                parent: animation,
            //                curve: Interval(
            //                  0.50,
            //                  1.00,
            //                  curve: Curves.linear,
            //                ),
            //              ),
            //            ),
            //            child: child,
            //          ),
            //  );

            // return new SlideTransition(
            //   position: new Tween<Offset>(
            //     begin: const Offset(-1.0, 0.0),
            //     end: Offset.zero,
            //   ).animate(animation),
            //   child: child,
            //  );

            // return new ScaleTransition(
            //   scale: new Tween<double>(
            //     begin: 0.0,
            //     end: 1.0,

            //   ).animate(
            //     CurvedAnimation(
            //       parent: animation,
            //       curve: Interval(
            //         0.00,
            //         0.50,
            //         curve: Curves.linear,
            //       ),
            //     ),
            //   ),
            //   child: ScaleTransition(
            //     scale: Tween<double>(
            //       begin: 1.5,
            //       end: 1.0,
            //     ).animate(
            //       CurvedAnimation(
            //         parent: animation,
            //         curve: Interval(
            //           0.50,
            //           1.00,
            //           curve: Curves.linear,
            //         ),
            //       ),
            //     ),
            //     child: child,
            //   ),
            // );
            return SlideTransition(
              position: new Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
                //begin: Offset.zero, end: Offset(0.0, 1.0)
              ).animate(animation),
              child: new SlideTransition(
                position: new Tween<Offset>(
                  begin: Offset.zero,
                  //end: const Offset(05, 0.5),
                  end: const Offset(0, 1),
                ).animate(secondaryAnimation),
                child: child,
              ),
            );
          },
          transitionDuration: Duration(milliseconds: 500),
        );
}

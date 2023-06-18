import 'package:flutter/widgets.dart';
class ScaleAnimationRoute extends StatefulWidget {
  const ScaleAnimationRoute({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;
  @override
  _ScaleAnimationRouteState createState() => _ScaleAnimationRouteState();
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  
  @override
  initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    //匀速
    //图片宽高从0变到300
    animation = Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener(() {
        setState(() => {});
      });

    //启动动画(正向执行)
     controller.forward();
  }

  @override
@override
Widget build(BuildContext context) {
  return Center(
    child: Image.network(
     widget.imageUrl,
      width: animation.value,
      height: animation.value,
    ),
  );
}
  
  @override
  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}
import 'package:flutter/material.dart';
import 'ScaleAnimationRoute.dart';
import 'ThemeTestRoute.dart';
void main() {
  runApp(const MyApp()); //流状态的文件，flutter把app看做有限状态自动机所以
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); //超验构造函数

  // This widget is the root of your application.
  @override //覆盖函数
  Widget build(BuildContext context) {
    return MaterialApp(
      //materialapp是个ui设计规范 ，例如开始菜单在右下角巴拉巴拉
      //一条长语句（一整个构造函数）
      title: 'Flutter Demo', //参数名称和值
      theme: ThemeData(
        //参数名称和值

        primarySwatch: Colors.blue,
      ),
     //  home: const MyHomePage(title: 'Flutter Demo Home Page'), //计数器程序扩展、基础组件、动画
      home:   SingleChildScrollViewTestRoute(),//滚动条
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState(); //胖箭头创立函数
}



class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    //方法
    setState(/*以下内容为一个匿名函数功能是count++*/ () {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //一个覆盖方法

    return Scaffold(
      //很长的return语句
      appBar: AppBar(
        //第一个参数值为appbar

        title: Text(widget.title),
      ),
      body: Center(
        //body的值是center但center又是一个对象有构造函数什么的

        child: Column(
           
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[//children里有个列表<widget>
            
           
            const Text(
              '诶嘿:',
            ),
            Text(
              '一起来玩吧',
              // style: Theme.of(context).textTheme.headline4,//显示多少次
            ),
            TextButton(
              child: Text("吨吨吨"),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.thumb_up),
              color: Colors.red,
              onPressed: () {},
            ),
            /*Image.network(
  "https://i0.hdslb.com/bfs/new_dyn/7d0edd2d12cb83535fe8554b5ce41d2e27626322.jpg@560w_560h_1e_1c.webp",
  width: 100.0,
            )， */
             ScaleAnimationRoute(//图片逐渐变大
   imageUrl: "https://i0.hdslb.com/bfs/new_dyn/7d0edd2d12cb83535fe8554b5ce41d2e27626322.jpg@560w_560h_1e_1c.webp",
            ),
          
          ],
        ),
      ),
     
      floatingActionButton: FloatingActionButton(
        //放置一个浮动按钮
        onPressed: _incrementCounter, //点击增加次数，函数在上面
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}

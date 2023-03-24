import 'package:flutter/material.dart';
import 'destination.dart';
import 'setting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyHomePage'),
      ),
      body: Container(child: Text('Homeのページ．予定がここで確認できる')),
      persistentFooterButtons: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          ElevatedButton.icon(
            onPressed: () async {
              // "push"で新規画面に遷移
              // リスト追加画面から渡される値を受け取る
              final newListText = await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  // 遷移先の画面としてリスト追加画面を指定
                  return MyHomePage(
                    title: '現在地と目的地!',
                  );
                }),
              );
              if (newListText != null) {
                // キャンセルした場合は newListText が null となるので注意
              }
            },
            icon: Icon(Icons.home), //アイコン
            label: Text('ホーム'), //テキスト
          ),
          InkWell(
            splashColor: Colors.green,
            onTap: () async {
              // "push"で新規画面に遷移
              // リスト追加画面から渡される値を受け取る
              final newListText = await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  // 遷移先の画面としてリスト追加画面を指定
                  return Destination(
                    title: '現在地と目的地!',
                  );
                }),
              );
              if (newListText != null) {
                // キャンセルした場合は newListText が null となるので注意
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.shopping_cart), // <-- Icon
                Text("予定入力"), // <-- Text
              ],
            ),
          ),
          SizedBox.fromSize(
            size: Size(56, 56),
            child: ClipOval(
              child: Material(
                color: Colors.amberAccent,
                child: InkWell(
                  splashColor: Colors.green,
                  onTap: () async {
                    // "push"で新規画面に遷移
                    // リスト追加画面から渡される値を受け取る
                    final newListText = await Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        // 遷移先の画面としてリスト追加画面を指定
                        return Setting(
                          title: '設定画面!',
                        );
                      }),
                    );
                    if (newListText != null) {
                      // キャンセルした場合は newListText が null となるので注意
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.settings), // <-- Icon
                      Text("Setting"), // <-- Text
                    ],
                  ),
                ),
              ),
            ),
          )
        ]),
      ],
    );
  }
}

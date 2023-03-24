import 'package:flutter/material.dart';
import 'main.dart';
import 'destination.dart';
import 'luggage.dart';

class Setting extends StatefulWidget {
  final String title;

  const Setting({
    super.key,
    required this.title,
  });

  @override
  State<Setting> createState() => _Setting();
}

class _Setting extends State<Setting> {
  final List<String> items = ['大学', '最寄り駅', 'バイト先', 'カフェ', 'サポーターズ'];
  var timeType = '';
  var setTime = '';
  late String stateTitle;
  late String stateCurrentLocation;
  late String stateDestination;

  @override
  void initState() {
    super.initState();

    // 受け取ったデータを状態を管理する変数に格納
    stateTitle = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.stateTitle),
      ),
      body: Container(child: Text('設定画面．場所リスト，持ち物リストの追加が出来たらいいな')),
      persistentFooterButtons: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          ElevatedButton.icon(
            // onPressed: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => NextPage()),
            //   );
            // },
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
                      Text("設定"), // <-- Text
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

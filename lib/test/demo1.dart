// import 'package:dio/dio.dart';

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     getHttp();
//     return Container(
//       child: Scaffold(
//         appBar: AppBar(title: Text('云衣裤优选')),
//         body: {}
//       )
//     );
//   }

// // http test
//   void getHttp() async{
//     try{
//       Response response = await Dio().get('http://192.168.3.9:3000/get/demo1');
//       print(response);
//     }catch(e){
//       print(e);
//     }
//   }
// }
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   TextEditingController typeController = TextEditingController();
//   String showText = '欢迎使用云衣库';
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Scaffold(
//         appBar: AppBar(title: Text('云衣裤优选')),
//         body: SingleChildScrollView(
//           child:       Container(
//           child: Column(
//             children: <Widget>[
//               TextField(
//                 controller: typeController,
//                 decoration: InputDecoration(
//                   contentPadding: EdgeInsets.all(10.0),
//                   labelText: '大风车会员',
//                   helperText: '请输入您喜欢的类型'
//                 ),
//                 autofocus: false,
//               ),
//               RaisedButton(
//                 onPressed: _choiceAction,
//                 child: Text('提交'),
//               ),
//               Text(
//                 showText,
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 1,
//                 )
//             ],
//           )
//         )
//         )

//       ),
//     );
//   }

// void _choiceAction() {
//   print('开始选择你喜欢的类型---------------------------');
//   if (typeController.text.toString() == '') {
//     showDialog(
//         context: context,
//         builder: (context) => AlertDialog(title: Text('衣服款式不能为空'))
//     );
//   }else {
//     getHttp(typeController.text.toString()).then((val){
//       setState(() {
//        showText = val['name'];
//       });
//     });
//   }
// }

//   Future getHttp(String TypeText) async{
//     try{
//       var data = {
//         "name": TypeText
//       };
//       print(TypeText);
//       Response response = await Dio().post('http://192.168.3.9:3000/post/demo1',
//       data: data
//       );
//       print(response);
//       return response.data;
//     }catch(e){
//       return print(e);
//     }
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String showText = '还没请求数据';
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Scaffold(
//         appBar: AppBar(title: Text('云衣裤优选')),
//         body: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               RaisedButton(
//                 onPressed: _jike,
//                 child: Text('请求数据')
//               ),
//               Text(showText)
//             ],
//           )
//         )
//       )
//     );
//   }

//   void _jike() {
//     print('开始请求数据-----------------------');
//     getHttp().then((val) {
//       setState(() {
//        showText = val['result']['list'].toString();
//       });
//     });

//   }

//   Future getHttp() async{
//     try{
//       Response response;
//       Dio dio = new Dio();
//       dio.options.headers = httpHeaders;
//       response = await dio.post('https://www.yunyiku.com.cn/api/clearActivity/sub/secondPage/product?specialPageId=641&sort=1&pageSize=10&pageNo=1');
//       print(response);
//       return response.data;
//     }catch(e){print(e);}
//   }
// }

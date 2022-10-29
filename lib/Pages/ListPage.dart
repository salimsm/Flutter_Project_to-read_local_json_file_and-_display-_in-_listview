import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Model/User.dart';


class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  Future<List<User>> readJsonData() async{
    final jsonData = await rootBundle.loadString("JsonFile/user.json");
    final list = json.decode(jsonData) as List<dynamic>;
    return list.map((e) => User.fromJson(e)).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Json Parsing'),
      ),
      body: Center(
        child: FutureBuilder(
          future: readJsonData(),
          builder: (context,data){
            if(data.hasError) {
              return Text('${data.error}');
            }else if(data.hasData){
              var listOfData = data.data as List<User>;
              return ListView.separated(
                itemCount: listOfData.length,
                separatorBuilder: (context,index)=>Divider(
                  color: Colors.black54,
                ),
                itemBuilder: (context, index) => ListTile(
                  title: Text(listOfData[index].title.toString()),
                  leading: Text(listOfData[index].id.toString()),
                  subtitle: Text(listOfData[index].body.toString()),
                  onTap: (){
                    print(listOfData[index]);
                  },
                ),
              );
            }else{
              return Text('Loading...');
            }
          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

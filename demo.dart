import 'package:flutter/material.dart';
import 'package:untitled2/service/service.dart';
class DemoList extends StatelessWidget {
  Service service;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: DemoListState(service: this.service,),
    );
  }

}

class DemoListState extends StatefulWidget {
  DemoListState({Key key,this.service}) : super(key: key);
  final Service service;
  @override
  DemoListWidget createState() => DemoListWidget();
}

class DemoListWidget extends State<DemoListState> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    widget.service.context = context;
    widget.service.request();
    widget.service.success = (){
      setState(() {});
    };
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:widget.service.navigation(),
      body: widget.service.body(),
    );
  }
}

List<Component> widgets = [];
Widget body(){
  return ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position){
        return widgets[position].build();
      });
}
class Component {
  Widget build(){
    return null;
  }
}
class BarDefault extends Component{
  String title = "APP";
  Widget build(){
    return AppBar(
      title: Text(title),
    );
  }
}

class ButtonDefault extends Component{
  VoidCallback onclick;
  String title = '';
  @override
  Widget build(){
    return GestureDetector(
      onTap: onclick,
      child: Text(
          '$title'
      ),
    );
  }

}
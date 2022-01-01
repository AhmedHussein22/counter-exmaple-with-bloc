import 'package:counter_bloc/bloc/bloc.dart';
import 'package:counter_bloc/bloc/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(0),
          child: MaterialApp(
        title: 'Flutter Demo',
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
 
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
       
        title: Text('Flutter Demo Home Page'),
      ),
      body: Center(       
        child: Row(        
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.add) ,
              onPressed: (){
                counterBloc.add(CounterEvents.add);
              }
              ),
            BlocBuilder<CounterBloc,int>(
              builder: (context,state){
                return Text(
              '$state',
              style: Theme.of(context).textTheme.headline4,
            );
              }
              ),
            IconButton(
              icon: Icon(Icons.remove) ,
              onPressed: (){
                counterBloc.add(CounterEvents.remove);
              }
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:counter_bloc/bloc/events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvents,int> {
  CounterBloc(int initialState) : super(initialState);


   @override
  Stream<int> mapEventToState(CounterEvents event) async* {
    switch (event) {
      case CounterEvents.add:
      yield state + 1;      
        break;
      case CounterEvents.remove:
      yield state -1 ;      
        break;
      default:
    }
  }
  @override
  void onTransition(Transition<CounterEvents, int> transition) {
    super.onTransition(transition);
    print(transition.toString());
  }
  
}
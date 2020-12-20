import 'dart:async';
import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
 String task2Result = await task2();
  task3(task2Result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String>task2()async{
//String  task2()  {
  Duration threeSeconds = Duration( seconds:3 );
  //sleep(threeSeconds); // sleep is synchronous method 
  String result;
 // String result = 'task 2 data';
 // print('Task 2 complete');
  await Future.delayed(threeSeconds, (){      // future is asynchronous
     result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;
}

void task3(String task2Result) {
  String result = 'task 3 data';
  print('Task 3 complete $task2Result');
}
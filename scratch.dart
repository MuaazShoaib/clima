// https://gist.github.com/angelabauer/c19c42b7795a185d2113f3b47263d2c0

void main() {
  performTasks();
}

// void performTasks() {
void performTasks() async {
  task1();
  // String task2Result = await task2();
  // task3(task2Result);
  print(task2());
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

// void task2() {
// String task2() {
Future<String> task2() async {
  Duration threeSeconds = Duration(seconds: 3);
  // sleep(threeSeconds);

  String result = '';

  // Future.delayed(threeSeconds, () {
  await Future.delayed(threeSeconds, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });

  // String result = 'task 2 data';
  // print('Task 2 complete');

  return Future(() => result);
}

// void task3() {
void task3(String taskData) {
  String result = 'task 3 data';
  // print('Task 3 complete');
  print('Task 3 complete with $taskData');
}

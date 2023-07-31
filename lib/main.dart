import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:audioplayers/audioplayers.dart';
import 'todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of the application.
  const MyApp({super.key});

  // When performing hot reload, it rebuilds the widget tree.
  @override
  Widget build(BuildContext context) {

    // A MaterialApp widget is used here to build the app in Material Design style.
    return MaterialApp(
      title: 'Pomodoro Timer',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 55, 185)),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final int _currentTimerDuration = 1500; // the duration of the timer in seconds (1500s = 25mins)
  int _isRunning = 0; // 0 = waiting to start, 1 = running, 2 = paused
  late CountdownTimerController _timerController;
  final AudioPlayer _player = AudioPlayer();
  int _pausedTime = 0;

  // When performing hot restart, it rebuilds the widget tree and set it to the default state.
  @override
  void initState() {
    super.initState();
    _newTimerController(_currentTimerDuration);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _timerController.disposeTimer();
    });
  }

  void _startTimer() {
    if (_isRunning == 0) {
      setState(() {
        _player.stop();
        _isRunning = 1;
        _newTimerController(_currentTimerDuration);
      });
    } else {
      setState(() {
        _isRunning = 1;
        _newTimerController(_pausedTime);
      });
    }
  }

  void _pauseTimer() {
    setState(() {
      _isRunning = 2;
      _timerController.disposeTimer();
      _pausedTime = 0;
      if (_timerController.currentRemainingTime?.min != null) {
        _pausedTime = _timerController.currentRemainingTime?.min as int;
      }
      _pausedTime =
          _pausedTime * 60 + (_timerController.currentRemainingTime?.sec as int);
    });
  }

  void _resetTimer() {
    setState(() {
      _isRunning = 0;
      _newTimerController(_currentTimerDuration);
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _timerController.disposeTimer();
      });
    });
  }

  void _newTimerController(int timeDuration) {
    _timerController = CountdownTimerController(
        endTime:
            (timeDuration + 1) * 1000 + DateTime.now().millisecondsSinceEpoch,
        onEnd: _onEnd);
  }

    void _onEnd() async {
    setState(() {
      _isRunning = 0;
    });
    _player.play(AssetSource('alarm.mp3'));
    await _player.onPlayerComplete.first;
    setState(() {
      _newTimerController(_currentTimerDuration);
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _timerController.disposeTimer();
      });
    });
  }

  String _formatTime(CurrentRemainingTime time) {
    return "${"${time.min ?? ""}".padLeft(2, "0")}:${"${time.sec ?? ""}".padLeft(2, "0")}";
  }

  // When performing hot reload, it rebuilds the widget tree.
  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;

    return Scaffold(

      // the banner of the app
      appBar: AppBar(
        title: Text(
          'Pomodoro Timer',
          style: TextStyle(color: themeColor.onPrimary, fontSize: 25),
        ),
        backgroundColor: themeColor.primary,
      ),

      // the body content of the app
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: Text(
                    'Start a Pomodoro session:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Center(
                  child: CountdownTimer(
                    controller: _timerController,
                    widgetBuilder: (_, time) {
                      return Text(
                        time == null ? "00:00" : _formatTime(time),
                        style: TextStyle(
                            fontSize: 100.0, color: themeColor.primary),
                      );
                    },
                  ),
                ),
                if (_isRunning == 1)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          _pauseTimer();
                        },
                        icon: const Icon(Icons.pause),
                        label: const Text('pause'),
                      ),
                      const SizedBox(width: 30),
                      ElevatedButton.icon(
                        onPressed: () {
                          _resetTimer();
                        },
                        icon: const Icon(Icons.restore),
                        label: const Text('Reset'),
                      ),
                    ],
                  )
                else if (_isRunning == 2)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          _startTimer();
                        },
                        icon: const Icon(Icons.replay),
                        label: const Text('Resume'),
                      ),
                      const SizedBox(width: 30),
                      ElevatedButton.icon(
                        onPressed: () {
                          _resetTimer();
                        },
                        icon: const Icon(Icons.restore),
                        label: const Text('Reset'),
                      ),
                    ],
                  )
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          _startTimer();
                        },
                        icon: const Icon(Icons.play_arrow),
                        label: const Text('Start'),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: themeColor.primaryContainer,
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: TodoList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

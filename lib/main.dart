import 'package:flutter/material.dart';

void main() {
  runApp(BrocolisApp());
}

class BrocolisApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flag Referee',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light, // Modo claro como predeterminado
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark, // Modo oscuro
      ),
      home: BrocolisHomePage(),
    );
  }
}

class BrocolisHomePage extends StatefulWidget {
  @override
  _BrocolisHomePageState createState() => _BrocolisHomePageState();
}

class _BrocolisHomePageState extends State<BrocolisHomePage> {
  int leftScore = 0;
  int rightScore = 0;
  int leftTimeout = 0;
  int rightTimeout = 0;

  String leftTeamName = "";
  String rightTeamName = "";

  bool isAdditionMode = true;
  bool isDarkModeEnabled = false;

  void updateScore(int value) {
    setState(() {
      if (isAdditionMode) {
        leftScore = (leftScore + value).clamp(0, double.infinity).toInt();
      } else {
        leftScore = (leftScore - value).clamp(0, double.infinity).toInt();
      }
    });
  }

  void updateRightScore(int value) {
    setState(() {
      if (isAdditionMode) {
        rightScore = (rightScore + value).clamp(0, double.infinity).toInt();
      } else {
        rightScore = (rightScore - value).clamp(0, double.infinity).toInt();
      }
    });
  }

  void resetScores() {
    setState(() {
      leftScore = 0;
      rightScore = 0;
    });
  }

  void incrementLeftTimeout() {
    setState(() {
      leftTimeout = (leftTimeout + 1) % 3;
    });
  }

  void incrementRightTimeout() {
    setState(() {
      rightTimeout = (rightTimeout + 1) % 3;
    });
  }

  void resetTimeouts() {
    setState(() {
      leftTimeout = 0;
      rightTimeout = 0;
    });
  }

  void toggleMode() {
    setState(() {
      isAdditionMode = !isAdditionMode;
    });
  }

  void toggleDarkMode() {
    setState(() {
      isDarkModeEnabled = !isDarkModeEnabled;
    });
  }

  String getScoreButtonText() {
    return isAdditionMode ? '+1' : '-1';
  }

  void handleScoreButtonPressed() {
    if (isAdditionMode) {
      updateScore(1);
    } else {
      updateScore(1);
    }
  }

  String getRightScoreButtonText() {
    return isAdditionMode ? '+1' : '-1';
  }

  void handleRightScoreButtonPressed() {
    if (isAdditionMode) {
      updateRightScore(1);
    } else {
      updateRightScore(1);
    }
  }

  String getLeftScoreButton6Text() {
    return isAdditionMode ? '+6' : '-6';
  }

  void handleLeftScoreButton6Pressed() {
    if (isAdditionMode) {
      updateScore(6);
    } else {
      updateScore(6);
    }
  }

  String getRightScoreButton6Text() {
    return isAdditionMode ? '+6' : '-6';
  }

  void handleRightScoreButton6Pressed() {
    if (isAdditionMode) {
      updateRightScore(6);
    } else {
      updateRightScore(6);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brocolis App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: isDarkModeEnabled ? Brightness.dark : Brightness.light,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Brocolis App'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Local',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8), // Agregado: Espacio vertical
                          TextField(
                            maxLength: 15,
                            onChanged: (text) {
                              setState(() {
                                leftTeamName = text;
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Team 1',
                              counterText: '',
                            ),
                            autofocus: false,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16), // Agregado: Espacio horizontal
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Visitor',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8), // Agregado: Espacio vertical
                          TextField(
                            maxLength: 15,
                            onChanged: (text) {
                              setState(() {
                                rightTeamName = text;
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Team 2',
                              counterText: '',
                            ),
                            autofocus: false,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: handleLeftScoreButton6Pressed,
                      child: Text(getLeftScoreButton6Text()),
                    ),
                    ElevatedButton(
                      onPressed: handleScoreButtonPressed,
                      child: Text(getScoreButtonText()),
                    ),
                    ElevatedButton(
                      onPressed: handleRightScoreButton6Pressed,
                      child: Text(getRightScoreButton6Text()),
                    ),
                    ElevatedButton(
                      onPressed: handleRightScoreButtonPressed,
                      child: Text(getRightScoreButtonText()),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Switch(
                      value: isAdditionMode,
                      onChanged: (value) {
                        toggleMode();
                      },
                    ),
                    Text(
                      isAdditionMode ? '+' : '-',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      leftScore.toString(),
                      style: TextStyle(fontSize: 72),
                    ),
                    SizedBox(width: 24),
                    Text(
                      rightScore.toString(),
                      style: TextStyle(fontSize: 72),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: resetScores,
                      child: Text('Reset Scores'),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        'TIMEOUTS',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: incrementLeftTimeout,
                      child: Text(leftTimeout.toString()),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: incrementRightTimeout,
                      child: Text(rightTimeout.toString()),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: resetTimeouts,
                      child: Text('Reset Timeouts'),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      Text('Dark Mode'),
                      Switch(
                        value: isDarkModeEnabled,
                        onChanged: (value) {
                          toggleDarkMode();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

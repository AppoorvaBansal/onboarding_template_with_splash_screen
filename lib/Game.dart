import 'package:flutter/material.dart';

void main() {
  runApp(const Game());
}

class Game extends StatelessWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic-Tac-Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TicTacToePage(),
    );
  }
}

class TicTacToePage extends StatefulWidget {
  const TicTacToePage({super.key});

  @override
  State<TicTacToePage> createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  // Represents the board with empty spaces
  List<List<String>> board = [
    ['', '', ''],
    ['', '', ''],
    ['', '', ''],
  ];

  // Current player (X or O)
  String currentPlayer = 'X';

  // Function to handle the player's move
  void _makeMove(int row, int col) {
    setState(() {
      // Only allow a move if the cell is empty
      if (board[row][col] == '') {
        board[row][col] = currentPlayer;
        // Check if there's a winner
        if (_checkWinner()) {
          _showWinnerDialog();
        } else {
          // Switch player
          currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
        }
      }
    });
  }

  // Check if there's a winner
  bool _checkWinner() {
    // Check rows and columns
    for (int i = 0; i < 3; i++) {
      if (board[i][0] == board[i][1] && board[i][1] == board[i][2] && board[i][0] != '') {
        return true;
      }
      if (board[0][i] == board[1][i] && board[1][i] == board[2][i] && board[0][i] != '') {
        return true;
      }
    }

    // Check diagonals
    if (board[0][0] == board[1][1] && board[1][1] == board[2][2] && board[0][0] != '') {
      return true;
    }
    if (board[0][2] == board[1][1] && board[1][1] == board[2][0] && board[0][2] != '') {
      return true;
    }

    return false;
  }

  // Show winner dialog
  void _showWinnerDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('$currentPlayer wins!'),
        content: const Text('Congratulations!'),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                // Reset the board and start a new game
                board = [
                  ['', '', ''],
                  ['', '', ''],
                  ['', '', ''],
                ];
                currentPlayer = 'X'; // Start with player X
              });
              Navigator.pop(context);
            },
            child: const Text('Play Again'),
          ),
        ],
      ),
    );
  }

  // Build the Tic-Tac-Toe grid
  Widget _buildGrid() {
    return Column(
      children: List.generate(3, (row) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (col) {
            return GestureDetector(
              onTap: () => _makeMove(row, col),
              child: Container(
                margin: const EdgeInsets.all(4.0),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Center(
                  child: Text(
                    board[row][col],
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: board[row][col] == 'X' ? Colors.blue : Colors.red,
                    ),
                  ),
                ),
              ),
            );
          }),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic-Tac-Toe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Player $currentPlayer\'s turn',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            _buildGrid(),
          ],
        ),
      ),
    );
  }
}

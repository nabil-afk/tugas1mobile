import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _output = "0"; // Menyimpan hasil sementara
  String _input = ""; // Menyimpan input yang dimasukkan pengguna
  String _expression = ""; // Menyimpan ekspresi yang sedang dibentuk
  double currentResult = 0; // Menyimpan hasil sementara dari operasi
  String operand = ""; // Menyimpan operator terakhir yang digunakan
  final List<double> _numbers = []; // Menyimpan angka untuk perhitungan
  final List<String> _operators = []; // Menyimpan operator untuk perhitungan

  void _buttonPressed(String value) {
    setState(() {
      if (value == "C") {
        // Reset kalkulator
        _input = "";
        _output = "0";
        _expression = ""; // Reset ekspresi
        currentResult = 0;
        operand = "";
        _numbers.clear();
        _operators.clear();
      } else if (value == "+" || value == "-" || value == "*" || value == "/") {
        if (_input.isNotEmpty) {
          double inputNumber = double.parse(_input);
          _numbers.add(inputNumber); // Tambahkan angka ke daftar
          if (_operators.isNotEmpty) {
            _applyPriorityOperations(); // Terapkan operasi prioritas (* atau /)
          }
          _operators.add(value); // Tambahkan operator
          _input = ""; // Kosongkan input untuk angka berikutnya
          _expression += " $value"; // Tambahkan operator ke ekspresi
        }
      } else if (value == "=") {
        if (_input.isNotEmpty) {
          double inputNumber = double.parse(_input);
          _numbers.add(inputNumber);
          _applyPriorityOperations(); // Selesaikan operasi prioritas
          currentResult = _numbers[0];
          for (int i = 0; i < _operators.length; i++) {
            currentResult =
                _calculate(currentResult, _numbers[i + 1], _operators[i]);
          }
          _output = currentResult.toString();
          _expression += " =";
          _numbers.clear();
          _operators.clear();
        }
      } else {
        // Tambahkan angka atau titik desimal ke input
        _input += value;
        _output = _input;
        _expression += value;
      }
    });
  }

  // Fungsi untuk mengatasi operasi prioritas (* dan /)
  void _applyPriorityOperations() {
    for (int i = 0; i < _operators.length; i++) {
      if (_operators[i] == "*" || _operators[i] == "/") {
        double result = _calculate(_numbers[i], _numbers[i + 1], _operators[i]);
        _numbers[i] = result; // Simpan hasil pada posisi pertama
        _numbers.removeAt(i + 1); // Hapus angka kedua
        _operators.removeAt(i); // Hapus operator
        i--; // Kembali ke indeks sebelumnya karena ada pergeseran
      }
    }
  }

  // Fungsi untuk melakukan perhitungan berdasarkan operator
  double _calculate(double num1, double num2, String operand) {
    switch (operand) {
      case "+":
        return num1 + num2;
      case "-":
        return num1 - num2;
      case "*":
        return num1 * num2;
      case "/":
        return num1 / num2;
      default:
        return num2;
    }
  }

  Widget _buildButton(String value) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(24.0),
          backgroundColor: Colors.blue[100], // Warna biru cerah
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          shadowColor: Colors.blue.withOpacity(0.5), // Shadow biru
          elevation: 5, // Tambahkan bayangan
        ),
        onPressed: () => _buttonPressed(value),
        child: Text(
          value,
          style: TextStyle(
            fontSize: 24,
            color: Colors.blue[800], // Teks biru tua
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700], // Warna biru gelap untuk AppBar
        title: const Text(
          'Kalkulator',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // Pusatkan judul
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.blue[100]!
            ], // Latar belakang biru lembut
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _expression,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.blue[600],
                    ),
                  ),
                  Text(
                    _output,
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Divider(color: Colors.blue[300])),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    _buildButton("7"),
                    _buildButton("8"),
                    _buildButton("9"),
                    _buildButton("/"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton("4"),
                    _buildButton("5"),
                    _buildButton("6"),
                    _buildButton("*"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton("1"),
                    _buildButton("2"),
                    _buildButton("3"),
                    _buildButton("-"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton("."),
                    _buildButton("0"),
                    _buildButton("C"),
                    _buildButton("+"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton("="),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

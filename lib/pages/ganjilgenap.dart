import 'package:flutter/material.dart';

class NumberPage extends StatefulWidget {
  const NumberPage({super.key});

  @override
  _NumberPageState createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  final TextEditingController _controller = TextEditingController();
  List<int> _evenNumbers = [];
  List<int> _oddNumbers = [];
  String _result = ""; // Variabel untuk menyimpan hasil genap/ganjil

  void _findEvenAndOddNumbers() {
    int? inputNumber = int.tryParse(_controller.text);

    if (inputNumber != null) {
      List<int> evens = [];
      List<int> odds = [];

      // Cek apakah angka yang diinputkan genap atau ganjil
      if (inputNumber % 2 == 0) {
        _result = "Angka tersebut adalah angka genap.";
      } else {
        _result = "Angka tersebut adalah angka ganjil.";
      }

      for (int i = 1; i <= inputNumber; i++) {
        if (i % 2 == 0) {
          evens.add(i);
        } else {
          odds.add(i);
        }
      }

      setState(() {
        _evenNumbers = evens;
        _oddNumbers = odds;
      });

      // Menampilkan pop-up dialog dengan hasil
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Hasil"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_result),
                const SizedBox(height: 10),
                Text("Angka Genap: ${evens.join(', ')}"),
                Text("Angka Ganjil: ${odds.join(', ')}"),
              ],
            ),
            actions: [
              TextButton(
                child: const Text("Tutup"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        _result = "Masukkan angka yang valid!";
      });

      // Tampilkan dialog jika input tidak valid
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text(_result),
            actions: [
              TextButton(
                child: const Text("Tutup"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  Widget _buildNumberList(String title, List<int> numbers) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue[800], // Warna biru tua untuk judul
            fontFamily: 'Roboto', // Gaya font yang lebih modern
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: numbers.map((number) {
            return Chip(
              label: Text(
                number.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Roboto',
                ),
              ),
              backgroundColor: Colors.blue[300], // Warna latar belakang biru
              shadowColor: Colors.blueAccent, // Shadow untuk chip
              elevation: 5, // Memberikan efek tiga dimensi pada chip
            );
          }).toList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700], // Warna biru gelap untuk AppBar
        title: const Text(
          'Angka Ganjil dan Genap',
          style: TextStyle(
            fontFamily: 'Roboto', // Font lebih modern
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.blue[100]!
            ], // Latar belakang gradasi biru lembut
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Masukan Angka',
                labelStyle: TextStyle(
                  color: Colors.blue[700], // Warna biru untuk label input
                  fontFamily: 'Roboto',
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      20.0), // Kotak input dengan sudut membulat
                  borderSide: BorderSide(color: Colors.blue[300]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Colors.blue[500]!),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _findEvenAndOddNumbers,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor:
                    Colors.blue[300], // Tombol dengan latar belakang biru
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      20.0), // Sudut membulat untuk tombol
                ),
              ),
              child: const Text('Tampilkan Angka Ganjil dan Genap'),
            ),
            const SizedBox(height: 20),
            // Tampilkan hasil genap/ganjil
            _buildNumberList("Angka Genap", _evenNumbers),
            const SizedBox(height: 20),
            _buildNumberList("Angka Ganjil", _oddNumbers),
          ],
        ),
      ),
    );
  }
}

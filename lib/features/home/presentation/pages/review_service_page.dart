import 'package:flutter/material.dart';

class ReviewServicePage extends StatefulWidget {
  final Map<String, dynamic> service;

  const ReviewServicePage({super.key, required this.service});

  @override
  State<ReviewServicePage> createState() => _ReviewServicePageState();
}

class _ReviewServicePageState extends State<ReviewServicePage> {
  final TextEditingController _reviewController = TextEditingController();
  double _rating = 0;

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  void _submitReview() {
    if (_rating == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, selecione uma avaliação.')),
      );
      return;
    }
    // Aqui você pode enviar a avaliação para o backend ou banco de dados
    final reviewData = {
      'serviceId': widget.service['id'],
      'rating': _rating,
      'comment': _reviewController.text,
    };
    Navigator.pop(context, reviewData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avaliar ${widget.service['name']}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Avaliação do Serviço',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  onPressed: () {
                    setState(() {
                      _rating = index + 1.0;
                    });
                  },
                  icon: Icon(
                    Icons.star,
                    color: index < _rating ? Colors.amber : Colors.grey,
                  ),
                );
              }),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _reviewController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Deixe seu comentário',
                border: OutlineInputBorder(),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: _submitReview,
              child: const Text('Enviar Avaliação'),
            ),
          ],
        ),
      ),
    );
  }
}

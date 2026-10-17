import 'package:flutter/material.dart';

void main() {
  runApp(const KashmirReelsApp());
}

class KashmirReelsApp extends StatelessWidget {
  const KashmirReelsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kashmir Reels Pro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.redAccent,
      ),
      home: const ReelsFeedScreen(),
    );
  }
}

class ReelsFeedScreen extends StatefulWidget {
  const ReelsFeedScreen({super.key});

  @override
  State<ReelsFeedScreen> createState() => _ReelsFeedScreenState();
}

class _ReelsFeedScreenState extends State<ReelsFeedScreen> {
  final PageController _pageController = PageController();

  final List<Map<String, dynamic>> _reelsData = [
    {
      'username': 'kashmir_official',
      'caption': 'Beautiful Neelum Valley, Kashmir 🏔️❤️ #KashmirReels #Pro',
      'likes': '12.4K',
      'comments': '450',
      'badge': 'Gold',
      'boosted': true,
    },
    {
      'username': 'talha_creators',
      'caption': 'Testing Kashmir Reels Pro App! 🚀',
      'likes': '8.9K',
      'comments': '210',
      'badge': 'Green',
      'boosted': false,
    },
  ];

  Widget _buildVerificationBadge(String badgeType) {
    if (badgeType == 'Gold') {
      return const Icon(Icons.verified, color: Colors.amber, size: 18);
    } else if (badgeType == 'Green') {
      return const Icon(Icons.verified, color: Colors.greenAccent, size: 18);
    }
    return const Icon(Icons.verified, color: Colors.blueAccent, size: 18);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: _reelsData.length,
        itemBuilder: (context, index) {
          final item = _reelsData[index];
          return Stack(
            children: [
              Container(
                color: Colors.grey[900],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.play_circle_fill, size: 80, color: Colors.white54),
                      const SizedBox(height: 10),
                      Text(
                        "Kashmir Reel #${index + 1}",
                        style: const TextStyle(color: Colors.white70, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              if (item['boosted'] == true)
                Positioned(
                  top: 50,
                  left: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.bolt, color: Colors.white, size: 14),
                        SizedBox(width: 4),
                        Text(
                          "BOOSTED",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              Positioned(
                right: 15,
                bottom: 100,
                child: Column(
                  children: [
                    _buildActionButton(Icons.favorite, item['likes'], Colors.redAccent),
                    const SizedBox(height: 20),
                    _buildActionButton(Icons.comment, item['comments'], Colors.white),
                    const SizedBox(height: 20),
                    _buildActionButton(Icons.share, 'Share', Colors.white),
                    const SizedBox(height: 20),
                    IconButton(
                      icon: const Icon(Icons.rocket_launch, color: Colors.amber, size: 30),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Video Boost Requested!')),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 15,
                bottom: 30,
                right: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "@${item['username']}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 5),
                        _buildVerificationBadge(item['badge']),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item['caption'],
                      style: const TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, Color color) {
    return Column(
      children: [
        Icon(icon, color: color, size: 32),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}

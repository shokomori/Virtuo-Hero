import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Add this import
import 'package:hive_flutter/hive_flutter.dart';
import 'package:virtuohero/app_styles.dart';
import 'package:virtuohero/pages/subpages/create_scrum_page.dart';
import 'package:virtuohero/widgets/scrum.dart';

class ScrumPage extends StatefulWidget {
  const ScrumPage({super.key});

  @override
  State<ScrumPage> createState() => _ScrumPageState();
}

class _ScrumPageState extends State<ScrumPage> {
  // ═══════════════════════════════════════════════════════════════════════
  // PROPERTIES
  // ═══════════════════════════════════════════════════════════════════════
  
  late Box _storage;

  // Sample scrum data (Not yet functional - will be replaced with Hive data)
  final List<String> _scrums = [
    "June 28, 2025",
    "June 27, 2025", 
    "June 26, 2025",
    "June 25, 2025",
    "June 24, 2025",
    "June 23, 2025",
    "June 22, 2025",
    "June 21, 2025",
    "June 20, 2025"
  ];

  // ═══════════════════════════════════════════════════════════════════════
  // LIFECYCLE METHODS
  // ═══════════════════════════════════════════════════════════════════════

  @override
  void initState() {
    super.initState();
    _initHive();
  }

  // ═══════════════════════════════════════════════════════════════════════
  // METHODS
  // ═══════════════════════════════════════════════════════════════════════

  Future<void> _initHive() async {
    _storage = await Hive.openBox('storage');
  }

  void _createNewScrum() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateScrumPage(),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════
  // UI BUILDERS
  // ═══════════════════════════════════════════════════════════════════════

  Widget _buildProgressIndicator() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'progress',
          style: TextStyle(
            color: AppColors.darkGray,
            fontSize: 14,
          ),
        ),
        SizedBox(width: 8),
        ...List.generate(3, (index) => Padding(
          padding: EdgeInsets.only(left: index > 0 ? 4 : 0),
          child: Icon(
            Icons.circle,
            color: AppColors.secondary,
            size: 12,
          ),
        )),
      ],
    );
  }

  Widget _buildScrumTile(String date) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: AppColors.secondary.withOpacity(0.7),
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Date Section
          Text(
            date,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.darkGray,
            ),
          ),
          
          // Progress Section  
          _buildProgressIndicator(),
        ],
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════
  // BUILD METHOD
  // ═══════════════════════════════════════════════════════════════════════

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      
      // ─────────────────────────────────────────────────────────────────────
      // FLOATING ACTION BUTTON
      // ─────────────────────────────────────────────────────────────────────
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _createNewScrum,
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        icon: Icon(Icons.add_box_outlined),
        label: Text(
          "Log Scrum",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      
      // ─────────────────────────────────────────────────────────────────────
      // BODY
      // ─────────────────────────────────────────────────────────────────────
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Page Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Add this to spread items
                children: [
                  Text(
                    'Daily Scrums',
                    style: AppTextStyles.heading3.copyWith(
                      color: AppColors.darkGray,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min, // Add this to minimize row size
                      children: [
                        SvgPicture.asset(
                          'assets/flame.svg',
                          width: 30,  // Set desired width
                          height: 30, // Set desired height
                          colorFilter: ColorFilter.mode(
                            Colors.orange, // You can customize the color
                            BlendMode.srcIn,
                          ),
                        ),
                        SizedBox(width: 4), // Add spacing if you add more icons
                        Text(
                          '5', // Streak number example
                          style: TextStyle(
                            color: AppColors.darkGray,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              
              // Scrum List
              Expanded(
                child: ListView.builder(
                  itemCount: _scrums.length,
                  itemBuilder: (context, index) {
                    return _buildScrumTile(_scrums[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

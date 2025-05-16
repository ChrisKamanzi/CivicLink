import 'package:civic_link/widgets/BottomNavBar.dart';
import 'package:civic_link/widgets/StatusTile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/CategoryCards.dart';
import '../widgets/Drawer.dart';

class CitizenHomePage extends StatelessWidget {
  const CitizenHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Citizen Portal'),
        actions: [
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
          IconButton(icon: Icon(Icons.person), onPressed: () {}),
        ],
      ),
      drawer: Drawerr(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back 👋',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.report),
                      label: Text('Submit Complaint'),
                      onPressed: () => context.push('/complains'),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.track_changes),
                      label: Text('Track Status'),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Text(
                'Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [
                  CategoryCard(icon: Icons.local_hospital, label: 'Health'),
                  CategoryCard(icon: Icons.add_road, label: 'Infrastructure'),
                  CategoryCard(icon: Icons.water_drop, label: 'Water'),
                  CategoryCard(
                    icon: Icons.electrical_services,
                    label: 'Electricity',
                  ),
                  CategoryCard(icon: Icons.security, label: 'Safety'),
                  CategoryCard(icon: Icons.more_horiz, label: 'Other'),
                ],
              ),
              SizedBox(height: 24),
              Text(
                'Recent Complaints',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              StatusTile(
                title: ' Land Titles', status: 'In Progress', onTap: () {},),
              StatusTile(title: 'Power of Attorney delay', status: 'Resolved'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Bottomnavbar(),
    );
  }
}

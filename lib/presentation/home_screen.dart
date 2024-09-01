import 'package:flutter/material.dart';
import 'package:practice_project/widgets/centered_view.dart';
import 'package:practice_project/widgets/humberger_menu.dart';
import 'package:practice_project/widgets/responsive_builder.dart';
import 'package:practice_project/widgets/tablet_and_mobile_content_section.dart';
import 'package:practice_project/widgets/web_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final String heading = 'FLUTTER WEB. THE BASICS';
  final String description =
      'In this course we will go over the basics of using Flutter Web for development. Topics will include Responsive Layout, Deploying, Font Changes, Hover functionality, Modals and more.';

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      mobile: _buildMobileLayout(),
      tablet: _buildTabletLayout(),
      desktop: _buildDesktopLayout(),
    );
  }

  Widget _buildMobileLayout() {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Text('HUMMING\nBIRD .'),
          Padding(
            padding: EdgeInsets.only(right: 16),
          )
        ],
      ),
      drawer: const HumbergerMenu(),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: TabletAndMobileContentSection(
            heading: heading, description: description),
      ),
    );
  }

  Widget _buildTabletLayout() {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30),
            child: WebNavigationBar(),
          ),
          Expanded(
            child: TabletAndMobileContentSection(
                heading: heading, description: description),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Scaffold(
      body: Column(
        children: [
          const CenteredView(
            child: WebNavigationBar(),
          ),
          _desktopCenteredViewContent(),
        ],
      ),
    );
  }

  Widget _desktopCenteredViewContent() {
    return CenteredView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 540,
            padding: const EdgeInsets.only(
              top: 80,
              bottom: 80,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  heading,
                  style: const TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.w900,
                    height: 1,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.9,
                    letterSpacing: 0.5,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.teal.shade500,
              ),
              child: const Text(
                'Join Course',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

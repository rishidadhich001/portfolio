
import 'package:flutter/material.dart';
import 'package:portfolio/models/Project.dart';
import 'package:portfolio/responsive.dart';
import 'package:portfolio/screen/home/components/project_card.dart';
import '../../../constants.dart';


class MyProjects extends StatelessWidget {
  const MyProjects({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Projects',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        const Responsive(
          mobile: ProjectsGridview(
            crossAxisCount: 1,
            childAspectRatio: 1.7,
          ),
          mobileLarge: ProjectsGridview(
            crossAxisCount: 2,
          ),
          tablet: ProjectsGridview(
            childAspectRatio: 1.1,
          ),
          desktop: ProjectsGridview(),
        ),
      ],
    );
  }
}

class ProjectsGridview extends StatelessWidget {
  const ProjectsGridview({
    super.key,
    this.crossAxisCount = 3,
    this.childAspectRatio = 1.3,
  });

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: demo_projects.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => MyProjectCard(
        project: demo_projects[index],
      ),
    );
  }
}

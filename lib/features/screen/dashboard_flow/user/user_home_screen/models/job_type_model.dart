import '../../../../../../core/constant/icons.dart';

class JobTypeModel {
  final String iconPath;
  final String jobTitle;
  final String totalJobs;

  JobTypeModel({
    required this.iconPath,
    required this.jobTitle,
    required this.totalJobs,
  });
}

final List<JobTypeModel> jobTypes = [
  JobTypeModel(iconPath: AppIcons.vanSvg, jobTitle: 'Furniture Moving', totalJobs: '21 jobs'),
  JobTypeModel(iconPath: AppIcons.flowerSvg, jobTitle: 'Yard Work', totalJobs: '19 jobs'),
  JobTypeModel(iconPath: AppIcons.vanSvg, jobTitle: 'Grocery Pickup', totalJobs: '8 jobs'),
  JobTypeModel(iconPath: AppIcons.vanSvg, jobTitle: 'Cleaning Service', totalJobs: '15 jobs'),
];

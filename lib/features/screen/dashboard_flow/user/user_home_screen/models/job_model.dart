import '../../../../../../core/constant/icons.dart';

class JobModel {
  final String iconPath;
  final String jobTitle;
  final String totalJobs;

  JobModel({
    required this.iconPath,
    required this.jobTitle,
    required this.totalJobs,
  });
}

final List<JobModel> jobs = [
  JobModel(iconPath: AppIcons.vanSvg, jobTitle: 'Furniture Moving', totalJobs: '21 jobs'),
  JobModel(iconPath: AppIcons.flowerSvg, jobTitle: 'Yard Work', totalJobs: '19 jobs'),
  JobModel(iconPath: AppIcons.vanSvg, jobTitle: 'Grocery Pickup', totalJobs: '8 jobs'),
  JobModel(iconPath: AppIcons.vanSvg, jobTitle: 'Cleaning Service', totalJobs: '15 jobs'),
];

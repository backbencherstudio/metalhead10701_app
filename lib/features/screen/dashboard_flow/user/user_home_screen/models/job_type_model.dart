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
  JobTypeModel(iconPath: AppIcons.movingSvg, jobTitle: 'Grocery Pickup', totalJobs: '8 jobs'),
  JobTypeModel(iconPath: AppIcons.cleaningSvg, jobTitle: 'Cleaning Service', totalJobs: '15 jobs'),


  JobTypeModel(iconPath: AppIcons.vanSvg, jobTitle: 'Delivery Services', totalJobs: '16 jobs'),
  JobTypeModel(iconPath: AppIcons.flowerSvg, jobTitle: 'Handyman Tasks', totalJobs: '23 jobs'),
  JobTypeModel(iconPath: AppIcons.movingSvg, jobTitle: 'Pet Care', totalJobs: '10 jobs'),
  JobTypeModel(iconPath: AppIcons.cleaningSvg, jobTitle: 'Errands & Shopping', totalJobs: '14 jobs'),


  JobTypeModel(iconPath: AppIcons.vanSvg, jobTitle: 'Assembly & Installation', totalJobs: '25 jobs'),
  JobTypeModel(iconPath: AppIcons.flowerSvg, jobTitle: 'Event Setup', totalJobs: '22 jobs'),
  JobTypeModel(iconPath: AppIcons.movingSvg, jobTitle: 'Personal Assistance', totalJobs: '10 jobs'),
  JobTypeModel(iconPath: AppIcons.cleaningSvg, jobTitle: 'Technology Setup & Repair', totalJobs: '15 jobs'),


  JobTypeModel(iconPath: AppIcons.cleaningSvg, jobTitle: 'Car Services', totalJobs: '12 jobs'),
  JobTypeModel(iconPath: AppIcons.cleaningSvg, jobTitle: 'House Sitting', totalJobs: '15 jobs'),
];

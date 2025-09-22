class NotificationModel {
  final String title;
  final String description;
  final String? reviewOffer;
  final String? activeStatus;
  final bool isSeen;

  NotificationModel({
    required this.title,
    required this.description,
    this.reviewOffer,
    this.activeStatus,
    required this.isSeen,
  });
}


List<NotificationModel> dummyNotifications = [
  NotificationModel(
    title: 'Job Offer Accepted',
    description: "Your job 'Help Move Couch and Dining Table' has been accepted by John Doe.",
    reviewOffer: 'Review Offer',
    activeStatus: '1 hour ago',
    isSeen: false,
  ),
  NotificationModel(
    title: 'New Message Received',
    description: "You have a new message from Sarah on your job 'Deliver Groceries'.",
    reviewOffer: 'Review Message',
    activeStatus: '2 hours ago',
    isSeen: true,
  ),
  NotificationModel(
    title: 'Offer Expiring Soon',
    description: "Your job 'Clean the Garage' offer is about to expire in 24 hours.",
    reviewOffer: null,
    activeStatus: '3 hours ago',
    isSeen: false,
  ),
  NotificationModel(
    title: 'Job Offer Declined',
    description: "Your job 'Move Furniture' has been declined by the worker.",
    reviewOffer: 'Review Decline',
    activeStatus: '4 hours ago',
    isSeen: true,
  ),
  NotificationModel(
    title: 'Payment Received',
    description: "You have received payment for 'Help Move Couch and Dining Table'.",
    reviewOffer: null,
    activeStatus: '5 hours ago',
    isSeen: false,
  ),
  NotificationModel(
    title: 'Job Completed',
    description: "Your job 'Clean the Backyard' has been successfully completed by Alice.",
    reviewOffer: 'Leave a Review',
    activeStatus: '6 hours ago',
    isSeen: true,
  ),
  NotificationModel(
    title: 'New Job Available',
    description: "A new job titled 'Walk the Dog' is available in your area.",
    reviewOffer: 'Apply Now',
    activeStatus: '7 hours ago',
    isSeen: false,
  ),
  NotificationModel(
    title: 'Job Offer Accepted',
    description: "Your job 'Help Set Up Event' has been accepted by Bob.",
    reviewOffer: 'Review Offer',
    activeStatus: '8 hours ago',
    isSeen: true,
  ),
  NotificationModel(
    title: 'Payment Failed',
    description: "Your payment for the job 'Help Move Couch' was unsuccessful. Please try again.",
    reviewOffer: null,
    activeStatus: '9 hours ago',
    isSeen: false,
  ),
  NotificationModel(
    title: 'Offer Extension',
    description: "The deadline for your job 'Paint the Fence' has been extended by 48 hours.",
    reviewOffer: 'Review Offer',
    activeStatus: '10 hours ago',
    isSeen: true,
  ),
];

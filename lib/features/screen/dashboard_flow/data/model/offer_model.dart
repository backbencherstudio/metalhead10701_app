class OfferModel{
  final String id;
  final String jobId;
  final String helperName;
  final double offeredPrice;
  final DateTime offerTime;

  const OfferModel({
    required this.id,
    required this.jobId,
    required this.helperName,
    required this.offeredPrice,
    required this.offerTime,
  });
}



//Dummies
final offers = <OfferModel>[
  OfferModel(id: 'offer1', jobId: 'job1', helperName: 'HelperA', offeredPrice: 90.0, offerTime: DateTime.now()),
  OfferModel(id: 'offer2', jobId: 'job2', helperName: 'HelperB', offeredPrice: 195.0, offerTime: DateTime.now()),
  OfferModel(id: 'offer3', jobId: 'job3', helperName: 'HelperC', offeredPrice: 75.0, offerTime: DateTime.now()),
  OfferModel(id: 'offer4', jobId: 'job4', helperName: 'HelperD', offeredPrice: 310.0, offerTime: DateTime.now()),
  OfferModel(id: 'offer5', jobId: 'job5', helperName: 'HelperE', offeredPrice: 145.0, offerTime: DateTime.now()),
  OfferModel(id: 'offer6', jobId: 'job6', helperName: 'HelperF', offeredPrice: 112.0, offerTime: DateTime.now()),
  OfferModel(id: 'offer7', jobId: 'job7', helperName: 'HelperG', offeredPrice: 120.0, offerTime: DateTime.now()),
  OfferModel(id: 'offer8', jobId: 'job8', helperName: 'HelperH', offeredPrice: 50.0, offerTime: DateTime.now()),
  OfferModel(id: 'offer9', jobId: 'job9', helperName: 'HelperI', offeredPrice: 175.0, offerTime: DateTime.now()),
  OfferModel(id: 'offer10', jobId: 'job10', helperName: 'HelperJ', offeredPrice: 249.0, offerTime: DateTime.now()),
];
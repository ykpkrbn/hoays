class MyStoryDetailModel{

  final String? nickname; /// Hikayeyi Paylaşan kişinin adı soyadı
  final String photo; /// Hikayenin Fotoğrafı
  final int? storySeeCount; /// Hikayeyi Kaç Kişi izledi
  final DateTime storyShareDate; /// Kaç Saat önce paylaşma
  final int? storyLike; /// Hikayeyi Beğenenlerin Sayısı
  final int? storyDislike;/// Hikayeyi Beğenmeyenlerin Sayısı
  final bool? isStoryLive; /// Story Hala Devam Ediyor mu?
  final int? storyRemainingTime; /// Hikayenin bitiş saati

  MyStoryDetailModel({
    this.nickname,
    required this.photo,
    this.storySeeCount = 0,
    required this.storyShareDate,
    this.storyLike =0,
    this.storyDislike =0,
    this.isStoryLive = false,
    this.storyRemainingTime
});

}
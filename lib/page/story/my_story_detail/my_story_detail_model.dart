class MyStoryDetailModel {
  /// Hikayeyi Paylaşan kişinin adı soyadı
  final String? nickname;

  /// Hikayenin Fotoğrafı
  final String photo;

  /// Hikayeyi Kaç Kişi izledi
  final int? storySeeCount;

  /// Kaç Saat önce paylaşma
  final DateTime storyShareDate;

  /// Hikayeyi Beğenenlerin Sayısı
  final int? storyLike;

  /// Hikayeyi Beğenmeyenlerin Sayısı
  final int? storyDislike;

  /// Story Hala Devam Ediyor mu?
  final bool? isStoryLive;

  MyStoryDetailModel({
    this.nickname,
    required this.photo,
    this.storySeeCount = 0,
    required this.storyShareDate,
    this.storyLike = 0,
    this.storyDislike = 0,
    this.isStoryLive = false,
  });
}

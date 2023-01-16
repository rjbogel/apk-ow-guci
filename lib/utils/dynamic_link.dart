import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class DynamicLinkService {
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  Future<String> createDynamicLink(String? token, int idProduct) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://umkmbangkit.page.link',
      link: Uri.parse(
          'https://umkm.metimes.id/webServices/get_product_detail.php?token=$token&id_product=$idProduct'),
      androidParameters: const AndroidParameters(
        packageName: 'id.umkm.bangkit',
      ),

      // googleAnalyticsParameters: GoogleAnalyticsParameters(
      //   campaign: 'example-promo',
      //   medium: 'social',
      //   source: 'orkut',
      // ),
      // itunesConnectAnalyticsParameters: ItunesConnectAnalyticsParameters(
      //   providerToken: '123456',
      //   campaignToken: 'example-promo',
      // ),
      // socialMetaTagParameters: SocialMetaTagParameters(
      //   title: 'Example of a Dynamic Link',
      //   description: 'This link works whether app is installed or not!',
      // ),
    );
    Uri url;
    final ShortDynamicLink shortLink =
        await dynamicLinks.buildShortLink(parameters);
    url = shortLink.shortUrl;

    return url.toString();
    // return dynamicUrl.toString();
  }
}

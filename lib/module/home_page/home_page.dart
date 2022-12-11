import 'package:apk_ow_guci/module/home_page/home_notifier.dart';
import 'package:apk_ow_guci/module/menu_page/menu_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeNotifier(context),
      child: Consumer<HomeNotifier>(
        builder: (context, myType, child) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(0),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          "assets/gerbang.jpg",
                          fit: BoxFit.fill,
                          height: 250,
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Obyek wisata GUCI",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "Mbetahi lan ngangeni",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "(4.345 views)",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "SEJARAH DESA GUCI",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 19, 19, 19)),
                    ),
                    Text(
                      "Desa Guci kec.Bumijawa kab.Tegal",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "     Pada tahun 1767 ada seorang bangsawan dari Keraton Demak Bintoro, bernama Raden Aryo Wiryo yang merasa jenuh dengan keadaan dan kehidupan keraton. Pasalnya seringkali terjadi konflik perang saudara dan persaingan perebutan tahta di antara sesama saudara dalam lingkup keraton. Keadaan itu membuat Raden Aryo Wiryo merasa jenuh dan berniat meninggalkan keraton. Akhirnya dia berangkat meninggalkan keraton dengan mengajak istrinya yang kemudian dikenal dengan Nyai Tumbu. Selang beberapa tahun kemudian dia sempat mengabdi di Keraton Mataram pada zaman kejayaan Sultan Agung Hanyorokusumo kemudian dia sempat pula ditugaskan oleh Sultan Agung untuk berangkat ke Cirebon pada masa itu. Kemudian dia kembali mengembara hingga sampai di lereng Gunung Slamet sebelah utara dan dia menetap di daerah tersebut . Dia orang pertama yang membuka lahan perkampungan di tempat itu sampai banyak orang berdatangan ke daerah itu untuk berguru kepada Raden Aryo Wiryo dan akhirnya menetap di daerah tersebut. Oleh karenanya Raden Aryo Wiryo memeberi nama tempat itu Kampung Keputihan , (daerah yang masih asli tak terjamah peradaban agama selain Islam).\n      Suatu saat datanglah pengembara dari Pesantren Gunungjati yang merupakan santri Syech Syarif Hidayatulloh atau Sunan Gunungjati bernama Kyai Elang Sutajaya bermaksud menyebarkan agama Islam. Kemudian Raden Aryo Wiryo dan pengikutnya berkenan mendalami ajaran agama Islam untuk lebih memantapkan keimanan para pengikutnya. Pada saat itu kampung keputihan sedang dilanda wabah pageblug seperti banyak tanah longsor dan penyakit gatal-gatal (gudigen, bahasa setempat)sehingga Kyai Elang Sutajaya mengajak Raden Aryo Wiryo dan warganya untuk berdoa kepada Alllah SWT. Doa tersebut melalui ritual yang sekarang dikenal sebagai ruwat bumi dengan menyembelih kambing Kendit dan menyajikan hasil bumi seperti Pala Pendem dan sayur mayur yang akan disedekahkan kepada fakir miskin. Acara ritual tersebut terjadi pada bulan Asyuro atau bulan Mukharom dan turun temurun sampai sekarang. Pada saat berdoa dengan tasyakuran Tahlilan dan Manaqib kala itu, Kanjeng Sunan Gunungjati berkenan hadir secara ghoib dan memberikan sebuah guci sakti. Dimana guci sakti tersebut sudah diisi dengan do’a Kanjeng Sunan agar penduduk Kampung Keputihan yang terjangkit wabah gatal segera meminum air guci tersebut dan pojok-pojok Kampung Keputihan agar dipercikkan air guci tersebut untuk menghilangkan kerusakan akibat bencana alam. Sehingga pada saat Radenn Aryo Wiryo berkeliling bersama Kyai Elang Sutajaya dia menemukan sumber mata air panas dibawah sebuah Gua yang sekarang terkenal dengan nama Pancuran 13. Adapun guci sakti tersebut ditempatkan di sebuah dukuh tempat Raden Aryo Wiryo biasa semedi, daerah tersebut sekarang dikenal dengan nama Telaga Ada di Dukuh Engang Desa Guci. Sehingga karena kekeramatan guci tersebut maka Kampung Keputihan dapat pulih kembali, bebas dari pageblug.\n     Untuk mengenang peristiwa tersebut maka Kampung Keputihan diubah namanya menajadi Desa Guci. Adapun guci sakti tersebut sekarang ada di Museum Nasional karena pada zaman Adipati Cokroningrat dari Brebes memindahkannya dari Desa Guci ke pendopo Kadipaten Brebes yang kala itu Desa Guci adalah bagian dari Kabupaten Brebes. Untuk lebih membaur dengan warga, Raden Aryo Wiryo menggunakan nama samaran yaitu Kyai Ageng Klitik atau untuk lebih akrab dengan sebutan Kyai Klitik. Selain itu penyamaran tersebut juga mengandung maksud lain, sebab keturunan darah biru atau bangsawan dari keraton banyak yang diburu penjajah Belanda. Sampai sekarang tidak diketahui maksud dan asal muasal makna yang sesungguhnya, dia juga menemukan tuk atau mata air panas lain yang sekarang terkenal dengan Pemandian Kasepuhan dan Pemandian Pengasihan yang berkasiat untuk sababiyah berbagai penyakit kulit dan tulang dan sarana mengabulkan khajat tertentu bagi yang meyakininya. Konon kabarnya Pemandian tersebut adalah tempat untuk penjamasan atau memandikan keris Kyai Klitik agar pamornya menjadi sepuh sehingga tempat itu dinamakan Kasepuhan dan tempat untuk memandikan pusaka-pusaka lain yang berpamor welas asih. Sehingga tempat tersebut dinamakan Pengasihan. Tempat tersebut sekarang dipergunakan untuk pemandian umum yang didatangi pengunjung dari berbagai tempat. Setelah Desa Guci semakin ramai maka datanglah seorang pengembara bernama Mbah Segeong dan bertapa di dalam Gua, yang sekarang terkenal dengan Gua Segeong terletak di sebelah selatan Pos I Retribusi sekitar 350 m jaraknya. Pada saat Kyai Elang Sutajaya mensyiarkan agama Islam dia sering melakukan semedi di atas sebuah bukit. Di sekitar tempat itu banyak terdapat hewan badak ( warak, dalam bahasa jawa ), maka Kyai Elang Sutajaya menyebutnya dengan Kandang Warak yang sekarang nama tersebut digunakan sebagai nama sebuah dukuh di sebelah timur Desa Guci yaitu Dukuh Pekandangan.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

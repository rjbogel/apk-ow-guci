import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FormInput extends StatelessWidget {
  const FormInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            width: 270,
            padding: EdgeInsets.symmetric(vertical: 7),
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75))
              ],
              color: Colors.blueAccent.withOpacity(0.9),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                Text("Input gambar Wisata"),
                Container(
                  child: FaIcon(FontAwesomeIcons.image),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 270,
            padding: EdgeInsets.symmetric(vertical: 7),
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75))
              ],
              color: Colors.blueAccent.withOpacity(0.9),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                Text("Input nama wisata"),
                Container(
                  height: 40,
                  padding: EdgeInsets.only(left: 10),
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.white),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Masukan nama wisata"),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 270,
            padding: EdgeInsets.symmetric(vertical: 7),
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75))
              ],
              color: Colors.blueAccent.withOpacity(0.9),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                Text("Input HTM"),
                Container(
                  height: 40,
                  padding: EdgeInsets.only(left: 10),
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.white),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Masukan HTM wisata"),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(onPressed: () {}, child: Text("INPUT DATA"))
        ],
      ),
    );
  }
}

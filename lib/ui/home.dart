import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'package:translator_app/helper/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleTranslator translator = GoogleTranslator();

  String _transalateLanguage = "";
  String selectedLanguage = '🇬🇧 English UK';

  // output and input
  late String out = "";
  final lang = TextEditingController();

  List listLanguage = LANGUAGE_DATA;

  void trans() async {
    if (selectedLanguage == '🇬🇧 English UK') {
      _transalateLanguage = 'en';
    } else if (selectedLanguage == '🇫🇷 French') {
      _transalateLanguage = 'fr';
    } else if (selectedLanguage == '🇺🇸 English US') {
      _transalateLanguage = 'en';
    } else if (selectedLanguage == '🇸🇦 Arabic') {
      _transalateLanguage = 'ar';
    } else if (selectedLanguage == '🇩🇪 Dutch') {
      _transalateLanguage = 'nl';
    } else if (selectedLanguage == '🇮🇹 Italian') {
      _transalateLanguage = 'it';
    } else if (selectedLanguage == '🇪🇸 Spanish') {
      _transalateLanguage = 'es';
    } else if (selectedLanguage == '🇮🇳 Hindi') {
      _transalateLanguage = 'hi';
    } else if (selectedLanguage == '🇨🇳 Chinese Traditional') {
      _transalateLanguage = 'zh-cn';
    } else if (selectedLanguage == '🇯🇵 Japanese') {
      _transalateLanguage = 'ja';
    } else if (selectedLanguage == '🇰🇷 Korean') {
      _transalateLanguage = 'ko';
    } else if (selectedLanguage == '🇷🇺 Russian') {
      _transalateLanguage = 'ru';
    } else if (selectedLanguage == '🇵🇹 Portuguese') {
      _transalateLanguage = 'pt';
    } else if (selectedLanguage == '🇨🇿 Czech') {
      _transalateLanguage = 'cs';
    } else if (selectedLanguage == '🇹🇷 Turkish') {
      _transalateLanguage = 'tr';
    } else if (selectedLanguage == '🇮🇩 Indonesian') {
      _transalateLanguage = 'id';
    }

    translator.translate(lang.text, to: "$_transalateLanguage").then((value) {
      setState(() {
        out = value.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: 'Flutter',
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF121212),
                      fontFamily: 'PoppinsBold')),
              TextSpan(
                  text: 'Translate',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontFamily: 'PoppinsBold')),
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey[200],
                  ),
                  child: Center(
                    child: TextField(
                      onChanged: (value) {
                        setState(() {});
                      },
                      controller: lang,
                      maxLines: 999,
                      decoration: InputDecoration(
                        hintText:
                            "Tap to enter a text without worrying about the language",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontFamily: 'PoppinsReg',
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: TextStyle(
                          fontFamily: 'PoppinsReg',
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                  child: Container(
                    padding: const EdgeInsets.only(left: 16.0, right: 3),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        menuMaxHeight: MediaQuery.of(context).size.height/2.25,
                        items: listLanguage.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem(
                              child: Text(value, style: TextStyle(fontSize: 18)),
                              value: value);
                        }).toList(),
                        value: selectedLanguage,
                        isExpanded: true,
                        style: TextStyle(
                            fontFamily: 'PoppinsReg', color: Colors.black),
                        onChanged: (value) {
                          setState(() {
                            selectedLanguage = value.toString();
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey[200],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 10.0, right: 10.0),
                    child: SelectableText(
                      out,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'PoppinsReg',
                      ),
                      showCursor: true,
                      cursorColor: Colors.black,
                      minLines: 5,
                      maxLines: 999,
                      scrollPhysics: ClampingScrollPhysics(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.red[400],
                    ),
                    child: TextButton(
                      onPressed: () {
                        trans();
                      },
                      child: Text("Translate",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'PoppinsBold')),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

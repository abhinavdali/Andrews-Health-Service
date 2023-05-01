import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Extracted Widgets/const.dart';
import '../../Extracted Widgets/custom_text.dart';
import '../../Logic/News_bloc/news_bloc.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<NewsBloc>(context).add(OnNewsLoad());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'News',
          color: Colors.white,
          weight: FontWeight.w600,
        ),
        backgroundColor: Colors.blue.shade300,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: kColorGrey,
      body: Column(
        children: [
          Expanded(child: BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              if(state is NewsLoading){
                return Center(child: CircularProgressIndicator.adaptive(),);
              }
              if(state is NewsLoaded){
                var def = state.newsModel.news;


                return ListView.builder(
                  itemCount: def.length,
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 24),
                    itemBuilder: (context, i) {
                      _launchURL() async {
                        var url =Uri.parse(def[i].link);
                        print('url$url');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      }
                  return GestureDetector(
                    onTap: (){
                     _launchURL();
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 16),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [shadow],
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: '${def[i].date}',color: Colors.grey,fontSize: 9.sp,),
                          SizedBox(height: 1.h,),
                          CustomText(text: '${def[i].title}',color: Colors.black,weight: FontWeight.w600,)
                        ],
                      ),
                    ),
                  );
                });
              }
              if(state is NewsError){

              }
              return Center(child: CircularProgressIndicator.adaptive(),);
            },
          ))
        ],
      ),
    );
  }
}

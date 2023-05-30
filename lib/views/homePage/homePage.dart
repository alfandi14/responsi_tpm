import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tpm_responsi/models/modelAgent.dart';
import 'package:tpm_responsi/services/agent_service.dart';
import '../../theme/theme.dart';
import '../auth/loginPage.dart';
import '../detailPage/detailPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 34, 34, 34),
      body: Container(
        margin: basicMargin.copyWith(top: 40),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  _validasi();
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              "Valorant Agents",
              style: titleTextStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: spaceSize,
            ),
            Expanded(
              child: FutureBuilder(
                future: AgentsData.instance.loadData(),
                builder: (context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasError) {
                    return _buildErrorSection();
                  }
                  if (snapshot.hasData) {
                    Agents agents = Agents.fromJson(snapshot.data);
                    return _buildSuccessSection(agents);
                  }
                  return _buildLoadingSection();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _validasi() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Logout"),
          content: Text("Are you sure want to logout?"),
          actions: [
            TextButton(
                onPressed: () => _logoutProcess(), child: Text("Yes")),
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text("No")),
          ],
        ));
  }

  _logoutProcess() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('status', false);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return LoginPage();
    }));
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(Agents agents) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: agents.data?.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return _buildItem(agents.data?[index]);
        });
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildItem(Agent? data) {
    debugPrint(data?.fullPortrait ?? "");
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailPage(
            uuid: data?.uuid ?? "",
          );
        }));
      },
      child: Container(
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(data?.background ?? ""),
                  fit: BoxFit.cover,
                ),
              ),
              child:
              Image.network(data?.fullPortraitV2 ?? "", fit: BoxFit.cover),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data?.displayName ?? "",
                    style: titleTextStyle.copyWith(fontSize: 25),
                  ),
                  data?.role?.displayName == ""
                      ? SizedBox()
                      : Text(
                    data?.role?.displayName ?? "",
                    style: subTitleTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

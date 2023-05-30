import 'package:flutter/material.dart';
import 'package:tpm_responsi/theme/theme.dart';

import '../../models/modelAgent.dart';
import '../../services/agentbyid_service.dart';

class DetailPage extends StatefulWidget {
  final String uuid;
  const DetailPage({super.key, required this.uuid});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 34, 34, 34),
      body: Container(
        margin: basicMargin.copyWith(top: 40),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
          future: AgentsDataById.instance.loadData(widget.uuid),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return _buildErrorSection();
            }
            if (snapshot.hasData) {
              Agents agents =
              Agents.fromJsonId(snapshot.data as Map<String, dynamic>);
              return _buildDetail(agents);
            }
            return _buildLoadingSection();
          },
        ),
      ),
    );
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildDetail(Agents? data) {
    return Container(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
          Text(
            data?.data?[0].displayName ?? "",
            style: titleTextStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: spaceSize,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("${data?.data?[0].fullPortrait}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: spaceSize,
                  ),
                  Text(
                    data?.data?[0].description ?? "",
                    style: subTitleTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: spaceSize,
                  ),
                  Text(
                    "Role: ${data?.data?[0].role?.displayName ?? ""}",
                    style: subTitleTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: spaceSize,
                  ),
                  Text(
                    "Abilities",
                    style: subTitleTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: spaceSize,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

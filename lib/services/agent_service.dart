import '../../services/network_base.dart';

class AgentsData {
  static AgentsData instance = AgentsData();
  Future<Map<String, dynamic>> loadData() {
    return BaseNetwork.get("agents");
  }
}

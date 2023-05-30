class Agents {
  int? status;
  List<Agent>? data;

  Agents({this.status, this.data});

  Agents.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Agent>[];
      json['data'].forEach((v) {
        data!.add(Agent.fromJson(v));
      });
    }
  }

  Agents.fromJsonId(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Agent>[];
      data!.add(Agent.fromJson(json['data']));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Agent {
  String? uuid;
  String? displayName;
  String? description;
  String? developerName;
  List? characterTags;
  String? displayIcon;
  String? displayIconSmall;
  String? bustPortrait;
  String? fullPortrait;
  String? fullPortraitV2;
  String? killfeedPortrait;
  String? background;
  List? backgroundGradientColors;
  String? assetPath;
  bool? isFullPortraitRightFacing;
  bool? isPlayableCharacter;
  bool? isAvailableForTest;
  bool? isBaseContent;
  Role? role;
  List<Abilities>? abilities;
  VoiceLine? voiceLine;

  Agent(
      {this.uuid,
        this.displayName,
        this.description,
        this.developerName,
        this.characterTags,
        this.displayIcon,
        this.displayIconSmall,
        this.bustPortrait,
        this.fullPortrait,
        this.fullPortraitV2,
        this.killfeedPortrait,
        this.background,
        this.backgroundGradientColors,
        this.assetPath,
        this.isFullPortraitRightFacing,
        this.isPlayableCharacter,
        this.isAvailableForTest,
        this.isBaseContent,
        this.role,
        this.abilities,
        this.voiceLine});

  Agent.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'] as String?;
    displayName = json['displayName'] as String?;
    description = json['description'] as String?;
    developerName = json['developerName'] as String?;
    characterTags = json['characterTags'] as List? ?? <dynamic>[];
    displayIcon = json['displayIcon'] as String?;
    displayIconSmall = json['displayIconSmall'] as String?;
    bustPortrait = json['bustPortrait'] as String?;
    fullPortrait = json['fullPortrait'] as String?;
    fullPortraitV2 = json['fullPortraitV2'] as String?;
    killfeedPortrait = json['killfeedPortrait'] as String?;
    background = json['background'] as String?;
    backgroundGradientColors =
        json['backgroundGradientColors'] as List? ?? <dynamic>[];
    assetPath = json['assetPath'];
    isFullPortraitRightFacing = json['isFullPortraitRightFacing'] as bool?;
    isPlayableCharacter = json['isPlayableCharacter'] as bool?;
    isAvailableForTest = json['isAvailableForTest'] as bool?;
    isBaseContent = json['isBaseContent'] as bool?;
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    if (json['abilities'] != null) {
      abilities = <Abilities>[];
      json['abilities'].forEach((v) {
        abilities!.add(new Abilities.fromJson(v));
      });
    }
    voiceLine = json['voiceLine'] != null
        ? new VoiceLine.fromJson(json['voiceLine'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = uuid;
    data['displayName'] = displayName;
    data['description'] = description;
    data['developerName'] = developerName;
    data['characterTags'] = characterTags;
    data['displayIcon'] = displayIcon;
    data['displayIconSmall'] = displayIconSmall;
    data['bustPortrait'] = bustPortrait;
    data['fullPortrait'] = fullPortrait;
    data['fullPortraitV2'] = fullPortraitV2;
    data['killfeedPortrait'] = killfeedPortrait;
    data['background'] = background;
    data['backgroundGradientColors'] = backgroundGradientColors;
    data['assetPath'] = assetPath;
    data['isFullPortraitRightFacing'] = isFullPortraitRightFacing;
    data['isPlayableCharacter'] = isPlayableCharacter;
    data['isAvailableForTest'] = isAvailableForTest;
    data['isBaseContent'] = isBaseContent;
    if (role != null) {
      data['role'] = role!.toJson();
    }
    if (abilities != null) {
      data['abilities'] = abilities!.map((v) => v.toJson()).toList();
    }
    if (voiceLine != null) {
      data['voiceLine'] = voiceLine!.toJson();
    }
    return data;
  }
}

class Role {
  String? uuid;
  String? displayName;
  String? description;
  String? displayIcon;
  String? assetPath;

  Role(
      {this.uuid,
        this.displayName,
        this.description,
        this.displayIcon,
        this.assetPath});

  Role.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    description = json['description'];
    displayIcon = json['displayIcon'];
    assetPath = json['assetPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['displayName'] = this.displayName;
    data['description'] = this.description;
    data['displayIcon'] = this.displayIcon;
    data['assetPath'] = this.assetPath;
    return data;
  }
}

class Abilities {
  String? slot;
  String? displayName;
  String? description;
  String? displayIcon;

  Abilities({this.slot, this.displayName, this.description, this.displayIcon});

  Abilities.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    displayName = json['displayName'];
    description = json['description'];
    displayIcon = json['displayIcon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slot'] = this.slot;
    data['displayName'] = this.displayName;
    data['description'] = this.description;
    data['displayIcon'] = this.displayIcon;
    return data;
  }
}

class VoiceLine {
  double? minDuration;
  double? maxDuration;
  List<MediaList>? mediaList;

  VoiceLine({this.minDuration, this.maxDuration, this.mediaList});

  VoiceLine.fromJson(Map<String, dynamic> json) {
    minDuration = json['minDuration'];
    maxDuration = json['maxDuration'];
    if (json['mediaList'] != null) {
      mediaList = <MediaList>[];
      json['mediaList'].forEach((v) {
        mediaList!.add(new MediaList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['minDuration'] = this.minDuration;
    data['maxDuration'] = this.maxDuration;
    if (this.mediaList != null) {
      data['mediaList'] = this.mediaList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MediaList {
  int? id;
  String? wwise;
  String? wave;

  MediaList({this.id, this.wwise, this.wave});

  MediaList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    wwise = json['wwise'];
    wave = json['wave'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['wwise'] = this.wwise;
    data['wave'] = this.wave;
    return data;
  }
}

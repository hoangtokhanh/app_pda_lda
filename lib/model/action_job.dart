class ActionJob {
  String? job;
  String? qrcode;
  List<int>? indexs;

  ActionJob({
    this.job,
    this.qrcode,
    this.indexs,
  });

  ActionJob copyWith({
    String? job,
    String? qrcode,
    List<int>? indexs,
  }) {
    return ActionJob(
      job: job ?? this.job,
      qrcode: qrcode ?? this.qrcode,
      indexs: indexs ?? this.indexs,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'job': job,
      'qrcode': qrcode,
      'indexs': indexs,
    };
  }

  factory ActionJob.fromJson(Map<String, dynamic> json) {
    return ActionJob(
      job: json['job'] as String?,
      qrcode: json['qrcode'] as String?,
      indexs: (json['indexs'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );
  }

  @override
  String toString() => "ActionJob(job: $job,qrcode: $qrcode,indexs: $indexs)";

  @override
  int get hashCode => Object.hash(job, qrcode, indexs);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ActionJob &&
              runtimeType == other.runtimeType &&
              job == other.job &&
              qrcode == other.qrcode &&
              indexs == other.indexs;
}

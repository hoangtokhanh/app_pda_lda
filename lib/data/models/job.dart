class Job {
  String? job;
  String? qrcodeDst;
  String? productSrc;
  String? transportunitSrc;
  String? transportunitDst;
  int? unitSrcBefore;
  int? unitSrcAfter;
  int? unitIncDst;
  String? typeSrcBefore;
  String? typeSrcAfter;
  String? packetSrcBefore;
  String? packetSrcAfter;
  String? deviceSrc;
  String? deviceDst;
  String? warehouseSrc;
  String? warehouseDst;
  String? error;
  String? order;
  int? distance;

  Job({
    this.job = '',
    this.qrcodeDst = '',
    this.productSrc = '',
    this.transportunitSrc = '',
    this.transportunitDst = '',
    this.unitSrcBefore = 0,
    this.unitSrcAfter = 0,
    this.unitIncDst = 0,
    this.typeSrcBefore = '',
    this.typeSrcAfter = '',
    this.packetSrcBefore = '',
    this.packetSrcAfter = '',
    this.deviceSrc = '',
    this.deviceDst = '',
    this.warehouseSrc = '',
    this.warehouseDst = '',
    this.error = '',
    this.order = '',
    this.distance = 0,
  });

  Job copyWith({
    String? job,
    String? qrcodeDst,
    String? productSrc,
    String? transportunitSrc,
    String? transportunitDst,
    int? unitSrcBefore,
    int? unitSrcAfter,
    int? unitIncDst,
    String? typeSrcBefore,
    String? typeSrcAfter,
    String? packetSrcBefore,
    String? packetSrcAfter,
    String? deviceSrc,
    String? deviceDst,
    String? warehouseSrc,
    String? warehouseDst,
    String? error,
    String? order,
    int? distance,
  }) {
    return Job(
      job: job ?? this.job,
      qrcodeDst: qrcodeDst ?? this.qrcodeDst,
      productSrc: productSrc ?? this.productSrc,
      transportunitSrc: transportunitSrc ?? this.transportunitSrc,
      transportunitDst: transportunitDst ?? this.transportunitDst,
      unitSrcBefore: unitSrcBefore ?? this.unitSrcBefore,
      unitSrcAfter: unitSrcAfter ?? this.unitSrcAfter,
      unitIncDst: unitIncDst ?? this.unitIncDst,
      typeSrcBefore: typeSrcBefore ?? this.typeSrcBefore,
      typeSrcAfter: typeSrcAfter ?? this.typeSrcAfter,
      packetSrcBefore: packetSrcBefore ?? this.packetSrcBefore,
      packetSrcAfter: packetSrcAfter ?? this.packetSrcAfter,
      deviceSrc: deviceSrc ?? this.deviceSrc,
      deviceDst: deviceDst ?? this.deviceDst,
      warehouseSrc: warehouseSrc ?? this.warehouseSrc,
      warehouseDst: warehouseDst ?? this.warehouseDst,
      error: error ?? this.error,
      order: order ?? this.order,
      distance: distance ?? this.distance,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'job': job,
      'qrcodeDst': qrcodeDst,
      'productSrc': productSrc,
      'transportunitSrc': transportunitSrc,
      'transportunitDst': transportunitDst,
      'unitSrcBefore': unitSrcBefore,
      'unitSrcAfter': unitSrcAfter,
      'unitIncDst': unitIncDst,
      'typeSrcBefore': typeSrcBefore,
      'typeSrcAfter': typeSrcAfter,
      'packetSrcBefore': packetSrcBefore,
      'packetSrcAfter': packetSrcAfter,
      'deviceSrc': deviceSrc,
      'deviceDst': deviceDst,
      'warehouseSrc': warehouseSrc,
      'warehouseDst': warehouseDst,
      'error': error,
      'order': order,
      'distance': distance,
    };
  }

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      job: json['job'] as String?,
      qrcodeDst: json['qrcodeDst'] as String?,
      productSrc: json['productSrc'] as String?,
      transportunitSrc: json['transportunitSrc'] as String?,
      transportunitDst: json['transportunitDst'] as String?,
      unitSrcBefore: json['unitSrcBefore'] as int?,
      unitSrcAfter: json['unitSrcAfter'] as int?,
      unitIncDst: json['unitIncDst'] as int?,
      typeSrcBefore: json['typeSrcBefore'] as String?,
      typeSrcAfter: json['typeSrcAfter'] as String?,
      packetSrcBefore: json['packetSrcBefore'] as String?,
      packetSrcAfter: json['packetSrcAfter'] as String?,
      deviceSrc: json['deviceSrc'] as String?,
      deviceDst: json['deviceDst'] as String?,
      warehouseSrc: json['warehouseSrc'] as String?,
      warehouseDst: json['warehouseDst'] as String?,
      error: json['error'] as String?,
      order: json['order'] as String?,
      distance: json['distance'] as int?,
    );
  }

  @override
  String toString() =>
      "Job(job: $job,qrcodeDst: $qrcodeDst,productSrc: $productSrc,transportunitSrc: $transportunitSrc,transportunitDst: $transportunitDst,unitSrcBefore: $unitSrcBefore,unitSrcAfter: $unitSrcAfter,unitIncDst: $unitIncDst,typeSrcBefore: $typeSrcBefore,typeSrcAfter: $typeSrcAfter,packetSrcBefore: $packetSrcBefore,packetSrcAfter: $packetSrcAfter,deviceSrc: $deviceSrc,deviceDst: $deviceDst,warehouseSrc: $warehouseSrc,warehouseDst: $warehouseDst,error: $error,order: $order,distance: $distance)";

  @override
  int get hashCode => Object.hash(
      job,
      qrcodeDst,
      productSrc,
      transportunitSrc,
      transportunitDst,
      unitSrcBefore,
      unitSrcAfter,
      unitIncDst,
      typeSrcBefore,
      typeSrcAfter,
      packetSrcBefore,
      packetSrcAfter,
      deviceSrc,
      deviceDst,
      warehouseSrc,
      warehouseDst,
      error,
      order,
      distance);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Job &&
              runtimeType == other.runtimeType &&
              job == other.job &&
              qrcodeDst == other.qrcodeDst &&
              productSrc == other.productSrc &&
              transportunitSrc == other.transportunitSrc &&
              transportunitDst == other.transportunitDst &&
              unitSrcBefore == other.unitSrcBefore &&
              unitSrcAfter == other.unitSrcAfter &&
              unitIncDst == other.unitIncDst &&
              typeSrcBefore == other.typeSrcBefore &&
              typeSrcAfter == other.typeSrcAfter &&
              packetSrcBefore == other.packetSrcBefore &&
              packetSrcAfter == other.packetSrcAfter &&
              deviceSrc == other.deviceSrc &&
              deviceDst == other.deviceDst &&
              warehouseSrc == other.warehouseSrc &&
              warehouseDst == other.warehouseDst &&
              error == other.error &&
              order == other.order &&
              distance == other.distance;
}

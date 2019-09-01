let Prelude = ../dhall/Prelude.dhall

let types = ../dhall/types.dhall

let renderObj = ../dhall/render/Obj.dhall

----------------------------------------------------------------------
-- Create an `Oid` value with zeroed `cont7` field.
let zoid =
    \(objt : types.ObjT)
 -> \(key : Natural)
 ->
    { cont7 = 0 } /\ { type = objt, key = key } : types.Oid

let tcpEndpoint =
    \(ipaddr : Text)
 -> \(portal : Natural)
 -> \(tmid : Natural)
 ->
    let addr = { ipaddr = ipaddr, mdigit = None Natural }
    in
      { nid = types.NetId.tcp { tcp = addr }
      , portal = portal
      , tmid = tmid
      } : types.Endpoint

let toConfGen = \(objs : List types.Obj) ->
    Prelude.Text.concatMapSep "\n" types.Obj renderObj objs ++ "\n"
----------------------------------------------------------------------

let ids =
  { root       = zoid types.ObjT.Root 0
  , node       = zoid types.ObjT.Node 6
  , process_24 = zoid types.ObjT.Process 24
  , process_27 = zoid types.ObjT.Process 27
  , process_30 = zoid types.ObjT.Process 30
  , process_38 = zoid types.ObjT.Process 38
  , process_40 = zoid types.ObjT.Process 40
  , process_42 = zoid types.ObjT.Process 42
  , process_44 = zoid types.ObjT.Process 44
  , process_45 = zoid types.ObjT.Process 44
  , process_46 = zoid types.ObjT.Process 46
  , service_25 = zoid types.ObjT.Service 25
  , service_26 = zoid types.ObjT.Service 26
  , service_28 = zoid types.ObjT.Service 28
  , service_29 = zoid types.ObjT.Service 29
  , service_31 = zoid types.ObjT.Service 31
  , service_32 = zoid types.ObjT.Service 32
  , service_33 = zoid types.ObjT.Service 33
  , service_34 = zoid types.ObjT.Service 34
  , service_35 = zoid types.ObjT.Service 35
  , service_36 = zoid types.ObjT.Service 36
  , service_37 = zoid types.ObjT.Service 37
  , service_39 = zoid types.ObjT.Service 39
  , service_41 = zoid types.ObjT.Service 41
  , service_43 = zoid types.ObjT.Service 43
  , service_45 = zoid types.ObjT.Service 45
  , service_47 = zoid types.ObjT.Service 47
  , site       = zoid types.ObjT.Site 3
  , pool_1     = zoid types.ObjT.Pool 1
  , pool_48    = zoid types.ObjT.Pool 48
  , pool_69    = zoid types.ObjT.Pool 69
  , pver_2     = zoid types.ObjT.Pver 2
  , pver_49    = zoid types.ObjT.Pver 49
  , pver_63    = zoid types.ObjT.Pver 63
  , pver_f     = zoid types.ObjT.PverF 62
  , profile    = zoid types.ObjT.Profile 77
  , sdev_8     = zoid types.ObjT.Sdev 8
  , sdev_10    = zoid types.ObjT.Sdev 10
  , sdev_12    = zoid types.ObjT.Sdev 12
  , sdev_14    = zoid types.ObjT.Sdev 14
  , sdev_16    = zoid types.ObjT.Sdev 16
  , sdev_18    = zoid types.ObjT.Sdev 18
  , sdev_20    = zoid types.ObjT.Sdev 20
  , sdev_22    = zoid types.ObjT.Sdev 22
  , sdev_70    = zoid types.ObjT.Sdev 70
  , objv_50    = zoid types.ObjT.Objv 50
  , objv_51    = zoid types.ObjT.Objv 51
  , objv_52    = zoid types.ObjT.Objv 52
  , objv_53    = zoid types.ObjT.Objv 53
  , objv_54    = zoid types.ObjT.Objv 54
  , objv_55    = zoid types.ObjT.Objv 55
  , objv_56    = zoid types.ObjT.Objv 56
  , objv_57    = zoid types.ObjT.Objv 57
  , objv_58    = zoid types.ObjT.Objv 58
  , objv_59    = zoid types.ObjT.Objv 59
  , objv_60    = zoid types.ObjT.Objv 60
  , objv_61    = zoid types.ObjT.Objv 61
  , objv_64    = zoid types.ObjT.Objv 64
  , objv_65    = zoid types.ObjT.Objv 65
  , objv_66    = zoid types.ObjT.Objv 66
  , objv_67    = zoid types.ObjT.Objv 67
  , objv_68    = zoid types.ObjT.Objv 68
  , objv_72    = zoid types.ObjT.Objv 72
  , objv_73    = zoid types.ObjT.Objv 73
  , objv_74    = zoid types.ObjT.Objv 74
  , objv_75    = zoid types.ObjT.Objv 75
  , objv_76    = zoid types.ObjT.Objv 76
  , drive_9    = zoid types.ObjT.Drive 9
  , drive_11   = zoid types.ObjT.Drive 11
  , drive_13   = zoid types.ObjT.Drive 13
  , drive_15   = zoid types.ObjT.Drive 15
  , drive_17   = zoid types.ObjT.Drive 17
  , drive_19   = zoid types.ObjT.Drive 19
  , drive_21   = zoid types.ObjT.Drive 21
  , drive_23   = zoid types.ObjT.Drive 23
  , drive_71   = zoid types.ObjT.Drive 71
  , controller = zoid types.ObjT.Controller 7
  , enclosure  = zoid types.ObjT.Enclosure 5
  , rack       = zoid types.ObjT.Rack 4
  }

let root = types.Obj.Root
  { id = ids.root
  , mdpool = ids.pool_1
  , imeta_pver = Some ids.pver_2
  , nodes = [ids.node]
  , sites = [ids.site]
  , pools = [ids.pool_69, ids.pool_48, ids.pool_1]
  , profiles = [ids.profile]
  }

let node = types.Obj.Node
  { id = ids.node
  , nr_cpu = 3
  , memsize_MB = 2846
  , processes = [ ids.process_24, ids.process_44, ids.process_46
                , ids.process_30, ids.process_27, ids.process_38
                , ids.process_42, ids.process_40 ]
  }

let endpoints =
    let ep = tcpEndpoint "172.28.128.3"
    in
      { process_24 = ep 34 101
      , process_27 = ep 44 101
      , process_30 = ep 41 401
      , process_38 = ep 41 301
      , process_40 = ep 41 302
      , process_42 = ep 41 303
      , process_44 = ep 41 304
      , process_46 = ep 41 305
      }

let process_24 = types.Obj.Process
  { id = ids.process_24
  , nr_cpu = 3
  , memsize_MB = 2846
  , endpoint = endpoints.process_24
  , services = [ids.service_26, ids.service_25]
  }

let process_40 = types.Obj.Process
  { id = ids.process_40
  , nr_cpu = 3
  , memsize_MB = 2846
  , endpoint = endpoints.process_40
  , services = [ids.service_41]
  }

let process_42 = types.Obj.Process
  { id = ids.process_42
  , nr_cpu = 3
  , memsize_MB = 2846
  , endpoint = endpoints.process_42
  , services = [ids.service_43]
  }

let process_38 = types.Obj.Process
  { id = ids.process_38
  , nr_cpu = 3
  , memsize_MB = 2846
  , endpoint = endpoints.process_38
  , services = [ids.service_39]
  }

let process_27 = types.Obj.Process
  { id = ids.process_27
  , nr_cpu = 3
  , memsize_MB = 2846
  , endpoint = endpoints.process_27
  , services = [ids.service_28, ids.service_29]
  }

let process_30 = types.Obj.Process
  { id = ids.process_30
  , nr_cpu = 3
  , memsize_MB = 2846
  , endpoint = endpoints.process_30
  , services = [ ids.service_31, ids.service_36, ids.service_35
               , ids.service_33, ids.service_37, ids.service_34
               , ids.service_32 ]
  }

let process_44 = types.Obj.Process
  { id = ids.process_44
  , nr_cpu = 3
  , memsize_MB = 2846
  , endpoint = endpoints.process_44
  , services = [ids.service_45]
  }

let process_46 = types.Obj.Process
  { id = ids.process_46
  , nr_cpu = 3
  , memsize_MB = 2846
  , endpoint = endpoints.process_46
  , services = [ids.service_47]
  }

let sdev_16 = types.Obj.Sdev
  { id = ids.sdev_16
  , dev_idx = 4
  , iface = 2
  , media = 1
  , bsize = 4096
  , size = 68719476736
  , filename = "/dev/loop5"
  }

let sdev_20 = types.Obj.Sdev
  { id = ids.sdev_20
  , dev_idx = 6
  , iface = 2
  , media = 1
  , bsize = 4096
  , size = 68719476736
  , filename = "/dev/loop7"
  }

let sdev_12 = types.Obj.Sdev
  { id = ids.sdev_12
  , dev_idx = 2
  , iface = 2
  , media = 1
  , bsize = 4096
  , size = 68719476736
  , filename = "/dev/loop3"
  }

let sdev_18 = types.Obj.Sdev
  { id = ids.sdev_18
  , dev_idx = 5
  , iface = 2
  , media = 1
  , bsize = 4096
  , size = 68719476736
  , filename = "/dev/loop6"
  }

let sdev_14 = types.Obj.Sdev
  { id = ids.sdev_14
  , dev_idx = 3
  , iface = 2
  , media = 1
  , bsize = 4096
  , size = 68719476736
  , filename = "/dev/loop4"
  }

let sdev_22 = types.Obj.Sdev
  { id = ids.sdev_22
  , dev_idx = 7
  , iface = 2
  , media = 1
  , bsize = 4096
  , size = 68719476736
  , filename = "/dev/loop8"
  }

let sdev_8 = types.Obj.Sdev
  { id = ids.sdev_8
  , dev_idx = 0
  , iface = 2
  , media = 1
  , bsize = 4096
  , size = 68719476736
  , filename = "/dev/loop1"
  }

let sdev_10 = types.Obj.Sdev
  { id = ids.sdev_10
  , dev_idx = 1
  , iface = 2
  , media = 1
  , bsize = 4096
  , size = 68719476736
  , filename = "/dev/loop2"
  }

let sdev_70 = types.Obj.Sdev
  { id = ids.sdev_70
  , dev_idx = 8
  , iface = 2
  , media = 1
  , bsize = 1
  , size = 1024
  , filename = "/dev/null"
  }

let drive_15 = types.Obj.Drive
  { id = ids.drive_15
  , sdev = ids.sdev_14
  , pvers = [ids.pver_49]
  }

let drive_13 = types.Obj.Drive
  { id = ids.drive_13
  , sdev = ids.sdev_12
  , pvers = [ids.pver_49]
  }

let drive_11 = types.Obj.Drive
  { id = ids.drive_11
  , sdev = ids.sdev_10
  , pvers = [ids.pver_49]
  }

let drive_9 = types.Obj.Drive
  { id = ids.drive_9
  , sdev = ids.sdev_8
  , pvers = [ids.pver_49]
  }

let drive_23 = types.Obj.Drive
  { id = ids.drive_23
  , sdev = ids.sdev_22
  , pvers = [ids.pver_49]
  }

let drive_71 = types.Obj.Drive
  { id = ids.drive_71
  , sdev = ids.sdev_70
  , pvers = [ids.pver_2]
  }

let drive_21 = types.Obj.Drive
  { id = ids.drive_21
  , sdev = ids.sdev_20
  , pvers = [ids.pver_49]
  }

let drive_19 = types.Obj.Drive
  { id = ids.drive_19
  , sdev = ids.sdev_18
  , pvers = [ids.pver_49]
  }

let drive_17 = types.Obj.Drive
  { id = ids.drive_17
  , sdev = ids.sdev_16
  , pvers = [ids.pver_49, ids.pver_63]
  }

let objv_64 = types.Obj.Objv
  { id = ids.objv_64
  , real = ids.drive_17
  , children = [] : List types.Oid
  }

let objv_65 = types.Obj.Objv
  { id = ids.objv_65
  , real = ids.controller
  , children = [ids.objv_64]
  }

let objv_66 = types.Obj.Objv
  { id = ids.objv_66
  , real = ids.enclosure
  , children = [ids.objv_65]
  }

let objv_67 = types.Obj.Objv
  { id = ids.objv_67
  , real = ids.rack
  , children = [ids.objv_66]
  }

let objv_68 = types.Obj.Objv
  { id = ids.objv_68
  , real = ids.site
  , children = [ids.objv_67]
  }

let objv_61 = types.Obj.Objv
  { id = ids.objv_61
  , real = ids.drive_23
  , children = [] : List types.Oid
  }

let objv_60 = types.Obj.Objv
  { id = ids.objv_60
  , real = ids.drive_21
  , children = [] : List types.Oid
  }

let objv_59 = types.Obj.Objv
  { id = ids.objv_59
  , real = ids.drive_19
  , children = [] : List types.Oid
  }

let objv_58 = types.Obj.Objv
  { id = ids.objv_58
  , real = ids.drive_17
  , children = [] : List types.Oid
  }

let objv_57 = types.Obj.Objv
  { id = ids.objv_57
  , real = ids.drive_15
  , children = [] : List types.Oid
  }

let objv_56 = types.Obj.Objv
  { id = ids.objv_56
  , real = ids.drive_13
  , children = [] : List types.Oid
  }

let objv_55 = types.Obj.Objv
  { id = ids.objv_55
  , real = ids.drive_11
  , children = [] : List types.Oid
  }

let objv_50 = types.Obj.Objv
  { id = ids.objv_50
  , real = ids.drive_9
  , children = [] : List types.Oid
  }

let objv_51 = types.Obj.Objv
  { id = ids.objv_51
  , real = ids.controller
  , children = [ ids.objv_50, ids.objv_55, ids.objv_56, ids.objv_57
               , ids.objv_58, ids.objv_59, ids.objv_60, ids.objv_61 ]
  }

let objv_52 = types.Obj.Objv
  { id = ids.objv_52
  , real = ids.enclosure
  , children = [ids.objv_51]
  }

let objv_53 = types.Obj.Objv
  { id = ids.objv_53
  , real = ids.rack
  , children = [ids.objv_52]
  }

let objv_54 = types.Obj.Objv
  { id = ids.objv_54
  , real = ids.site
  , children = [ids.objv_53]
  }

let objv_72 = types.Obj.Objv
  { id = ids.objv_72
  , real = ids.drive_71
  , children = [] : List types.Oid
  }

let objv_73 = types.Obj.Objv
  { id = ids.objv_73
  , real = ids.controller
  , children = [ids.objv_72]
  }

let objv_74 = types.Obj.Objv
  { id = ids.objv_74
  , real = ids.enclosure
  , children = [ids.objv_73]
  }

let objv_75 = types.Obj.Objv
  { id = ids.objv_75
  , real = ids.rack
  , children = [ids.objv_74]
  }

let objv_76 = types.Obj.Objv
  { id = ids.objv_76
  , real = ids.site
  , children = [ids.objv_75]
  }

let pver_63 = types.Obj.Pver
  { id = ids.pver_63
  , N = 1
  , K = 0
  , P = 1
  , tolerance = [0, 0, 0, 1, 0]
  , sitevs = [ids.objv_68]
  }

let pver_49 = types.Obj.Pver
  { id = ids.pver_49
  , N = 2
  , K = 1
  , P = 8
  , tolerance = [0, 0, 0, 0, 1]
  , sitevs = [ids.objv_54]
  }

let pver_2 = types.Obj.Pver
  { id = ids.pver_2
  , N = 1
  , K = 0
  , P = 1
  , tolerance = [0, 0, 0, 1, 0]
  , sitevs = [ids.objv_76]
  }

let pool_48 = types.Obj.Pool
  { id = ids.pool_48
  , pvers = [ids.pver_f, ids.pver_49]
  }

let pool_69 = types.Obj.Pool
  { id = ids.pool_69
  , pvers = [ids.pver_2]
  }

let pool_1 = types.Obj.Pool
  { id = ids.pool_1
  , pvers = [ids.pver_63]
  }

let service_41 = types.Obj.Service
  { id = ids.service_41
  , type = types.SvcT.M0_CST_RMS
  , endpoint = endpoints.process_40
  , sdevs = [] : List types.Oid
  }

let service_43 = types.Obj.Service
  { id = ids.service_43
  , type = types.SvcT.M0_CST_RMS
  , endpoint = endpoints.process_42
  , sdevs = [] : List types.Oid
  }

let service_39 = types.Obj.Service
  { id = ids.service_39
  , type = types.SvcT.M0_CST_RMS
  , endpoint = endpoints.process_38
  , sdevs = [] : List types.Oid
  }

let service_28 = types.Obj.Service
  { id = ids.service_28
  , type = types.SvcT.M0_CST_CONFD
  , endpoint = endpoints.process_27
  , sdevs = [] : List types.Oid
  }

let service_29 = types.Obj.Service
  { id = ids.service_29
  , type = types.SvcT.M0_CST_RMS
  , endpoint = endpoints.process_27
  , sdevs = [] : List types.Oid
  }

let service_32 = types.Obj.Service
  { id = ids.service_32
  , type = types.SvcT.M0_CST_IOS
  , endpoint = endpoints.process_30
  , sdevs = [ ids.sdev_10, ids.sdev_22, ids.sdev_16, ids.sdev_8, ids.sdev_14
            , ids.sdev_18, ids.sdev_12, ids.sdev_20 ]
  }

let service_34 = types.Obj.Service
  { id = ids.service_34
  , type = types.SvcT.M0_CST_SNS_REB
  , endpoint = endpoints.process_30
  , sdevs = [] : List types.Oid
  }

let service_37 = types.Obj.Service
  { id = ids.service_37
  , type = types.SvcT.M0_CST_ISCS
  , endpoint = endpoints.process_30
  , sdevs = [] : List types.Oid
  }

let service_33 = types.Obj.Service
  { id = ids.service_33
  , type = types.SvcT.M0_CST_SNS_REP
  , endpoint = endpoints.process_30
  , sdevs = [] : List types.Oid
  }

let service_35 = types.Obj.Service
  { id = ids.service_35
  , type = types.SvcT.M0_CST_ADDB2
  , endpoint = endpoints.process_30
  , sdevs = [] : List types.Oid
  }

let service_36 = types.Obj.Service
  { id = ids.service_36
  , type = types.SvcT.M0_CST_CAS
  , endpoint = endpoints.process_30
  , sdevs = [ids.sdev_70]
  }

let service_31 = types.Obj.Service
  { id = ids.service_31
  , type = types.SvcT.M0_CST_RMS
  , endpoint = endpoints.process_30
  , sdevs = [] : List types.Oid
  }

let service_45 = types.Obj.Service
  { id = ids.service_45
  , type = types.SvcT.M0_CST_RMS
  , endpoint = endpoints.process_44
  , sdevs = [] : List types.Oid
  }

let service_47 = types.Obj.Service
  { id = ids.service_47
  , type = types.SvcT.M0_CST_RMS
  , endpoint = endpoints.process_46
  , sdevs = [] : List types.Oid
  }

let service_25 = types.Obj.Service
  { id = ids.service_25
  , type = types.SvcT.M0_CST_HA
  , endpoint = endpoints.process_24
  , sdevs = [] : List types.Oid
  }

let service_26 = types.Obj.Service
  { id = ids.service_26
  , type = types.SvcT.M0_CST_RMS
  , endpoint = endpoints.process_24
  , sdevs = [] : List types.Oid
  }

let controller = types.Obj.Controller
  { id = ids.controller
  , node = ids.node
  , drives = [ ids.drive_17, ids.drive_19, ids.drive_21, ids.drive_71
             , ids.drive_23, ids.drive_9, ids.drive_11, ids.drive_13
             , ids.drive_15 ]
  , pvers = [ids.pver_2, ids.pver_49, ids.pver_63]
  }

let enclosure = types.Obj.Enclosure
  { id = ids.enclosure
  , ctrls = [ids.controller]
  , pvers = [ids.pver_2, ids.pver_49, ids.pver_63]
  }

let rack = types.Obj.Rack
  { id = ids.rack
  , encls = [ids.enclosure]
  , pvers = [ids.pver_2, ids.pver_49, ids.pver_63]
  }

let site = types.Obj.Site
  { id = ids.site
  , racks = [ids.rack]
  , pvers = [ids.pver_2, ids.pver_49, ids.pver_63]
  }

let pver_f = types.Obj.PverF
  { id = ids.pver_f
  , cuid = 0
  , base = ids.pver_49
  , allowance = [0, 0, 0, 0, 1]
  }

let profile_77 = types.Obj.Profile
  { id = ids.profile
  , pools = [ids.pool_69, ids.pool_48, ids.pool_1]
  }

let objs =
  [ root
  , node
  , process_24
  , process_27
  , process_30
  , process_38
  , process_40
  , process_42
  , process_44
  , process_46
  , service_25
  , service_26
  , service_28
  , service_29
  , service_31
  , service_32
  , service_33
  , service_34
  , service_35
  , service_36
  , service_37
  , service_39
  , service_41
  , service_43
  , service_45
  , service_47
  , sdev_8
  , sdev_10
  , sdev_12
  , sdev_14
  , sdev_16
  , sdev_18
  , sdev_20
  , sdev_22
  , sdev_70
  , site
  , rack
  , enclosure
  , controller
  , drive_9
  , drive_11
  , drive_13
  , drive_15
  , drive_17
  , drive_19
  , drive_21
  , drive_23
  , drive_71
  , pool_1
  , pool_48
  , pool_69
  , pver_2
  , pver_49
  , pver_63
  , pver_f
  , objv_50
  , objv_51
  , objv_52
  , objv_53
  , objv_54
  , objv_55
  , objv_56
  , objv_57
  , objv_58
  , objv_59
  , objv_60
  , objv_61
  , objv_64
  , objv_65
  , objv_66
  , objv_67
  , objv_68
  , objv_72
  , objv_73
  , objv_74
  , objv_75
  , objv_76
  , profile_77
  ]

in toConfGen objs

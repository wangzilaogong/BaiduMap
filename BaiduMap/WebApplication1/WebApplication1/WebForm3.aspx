<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="百度地图,百度地图API，百度地图自定义工具，百度地图所见即所得工具" />
    <meta name="description" content="百度地图API自定义地图，帮助用户在可视化操作下生成百度地图" />
    <title>百度地图API自定义地图</title>
    <!--引用百度地图API-->
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ot7Yxb0wVwEXqyhP9gBZlVN7Zbngdd2j"></script>
  </head>
  
  <body>
    <!--百度地图容器-->
    <div style="width:1500px;height:800px;border:#ccc solid 1px;font-size:12px" id="map"></div>
    <p style="color:red;font-weight:600">地图生成工具基于百度地图JS api v2.0版本开发，使用请申请密匙。
      <a href="http://developer.baidu.com/map/index.php?title=jspopular/guide/introduction" style="color:#2f83c7" target="_blank">了解如何申请密匙</a>
      <a href="http://lbsyun.baidu.com/apiconsole/key?application=key" style="color:#2f83c7" target="_blank">申请密匙</a>
    </p>
  </body>
  <script type="text/javascript">
      //创建和初始化地图函数：
      function initMap() {
          createMap(); //创建地图
          setMapEvent(); //设置地图事件
          addMapControl(); //向地图添加控件
          //addMapOverlay(); //向地图添加覆盖物
          addCustomLayer();
      }
      function createMap() {
          //map = new BMap.Map("map");                     //原本可用的代码
          //map.addControl("BMAP_SATELLITE_MAP");          //添加地图类型控件


          //map = new BMap.Map("map");                     //原本可用的代码
          //map.addControl("BMAP_SATELLITE_MAP");          //添加地图类型控件
          //map.setMapStyle();
          map = new BMap.Map("map", { mapType: BMAP_HYBRID_MAP });
          map.centerAndZoom(new BMap.Point(118.89, 34.112), 14);

      }
      function setMapEvent() {
          map.enableScrollWheelZoom();
          map.enableKeyboard();
          map.enableDragging();
          map.enableDoubleClickZoom()
      }
      function addClickHandler(target, window) {
          target.addEventListener("click", function () {
              target.openInfoWindow(window);
          });
      }
      function addMapOverlay() {
          var markers = [
        { content: "<table><tr>ss</tr><tr>sss</tr></table>", title: "1", imageOffset: { width: -46, height: -21 }, position: { lat: 34.139257, lng: 118.814679} },
        { content: "我的备注", title: "2", imageOffset: { width: -69, height: -21 }, position: { lat: 34.152683, lng: 118.818991} },
        { content: "我的备注", title: "3", imageOffset: { width: -115, height: -21 }, position: { lat: 34.151514, lng: 118.827228} },
        { content: "我的备注", title: "4", imageOffset: { width: -46, height: -21 }, position: { lat: 34.144643, lng: 118.825072} },
        { content: "我的备注", title: "5", imageOffset: { width: -46, height: -21 }, position: { lat: 34.154356, lng: 118.845253} },
        { content: "我的备注", title: "6", imageOffset: { width: -69, height: -21 }, position: { lat: 34.14638, lng: 118.844211} },
        //{ content: "我的备注", title: "7", imageOffset: { width: -46, height: -21 }, position: { lat: 34.135354, lng: 118.842809} },
        { content: "我的备注", title: "8", imageOffset: { width: -46, height: -21 }, position: { lat: 34.150712, lng: 118.8625} },
        //{ content: "我的备注", title: "9", imageOffset: { width: -46, height: -21 }, position: { lat: 34.133681, lng: 118.862159} },
        { content: "我的备注", title: "10", imageOffset: { width: -69, height: -21 }, position: { lat: 34.151507, lng: 118.827233} }
      ];
          for (var index = 0; index < markers.length; index++) {
              var point = new BMap.Point(markers[index].position.lng, markers[index].position.lat);
              var marker = new BMap.Marker(point, { icon: new BMap.Icon("http://api.map.baidu.com/lbsapi/createmap/images/icon.png", new BMap.Size(20, 25), {
                  imageOffset: new BMap.Size(markers[index].imageOffset.width, markers[index].imageOffset.height)
              })
              });
              var label = new BMap.Label(markers[index].title, { offset: new BMap.Size(25, 5) });
              var opts = {
                  width: 200,
                  title: markers[index].title,
                  enableMessage: false
              };
              var infoWindow = new BMap.InfoWindow(markers[index].content, opts);
              marker.setLabel(label);
              addClickHandler(marker, infoWindow);
              map.addOverlay(marker);
          };
          var labels = [
        { position: { lng: 118.88335, lat: 34.134563 }, content: "我的标记" }
      ];
          for (var index = 0; index < labels.length; index++) {
              var opt = { position: new BMap.Point(labels[index].position.lng, labels[index].position.lat) };
              var label = new BMap.Label(labels[index].content, opt);
              map.addOverlay(label);
          };
          var plOpts = [
        { strokeColor: "#f00", strokeWeight: "4", strokeOpacity: "0.6" },
        { strokeColor: "#f00", strokeWeight: "4", strokeOpacity: "0.6" },
        { strokeColor: "#0f0", strokeWeight: "2", strokeOpacity: "0.6" },
        { strokeColor: "#0f0", strokeWeight: "2", strokeOpacity: "0.6" },
        { strokeColor: "#0f0", strokeWeight: "2", strokeOpacity: "0.6" },
        { strokeColor: "#0f0", strokeWeight: "2", strokeOpacity: "0.6" },
        { strokeColor: "#0f0", strokeWeight: "2", strokeOpacity: "0.6" },
        { strokeColor: "#0f0", strokeWeight: "2", strokeOpacity: "0.6" },
        { strokeColor: "#0f0", strokeWeight: "2", strokeOpacity: "0.6" },
        //
          { strokeColor: "#0f0", strokeWeight: "2", strokeOpacity: "0.6" }, //10
          { strokeColor: "#0f0", strokeWeight: "2", strokeOpacity: "0.6" }, //11
          { strokeColor: "#0f0", strokeWeight: "2", strokeOpacity: "0.6" }, //12
          { strokeColor: "#0f0", strokeWeight: "2", strokeOpacity: "0.6" }, //13
          { strokeColor: "#0f0", strokeWeight: "2", strokeOpacity: "0.6" }, //14
          { strokeColor: "#0f0", strokeWeight: "2", strokeOpacity: "0.6" }, //15
          { strokeColor: "#f00", strokeWeight: "4", strokeOpacity: "0.6" }, //16
          { strokeColor: "#f00", strokeWeight: "4", strokeOpacity: "0.6" }, //17
          { strokeColor: "#0f0", strokeWeight: "2", strokeOpacity: "0.6" }, //18
          { strokeColor: "#0f0", strokeWeight: "2", strokeOpacity: "0.6" }, //19
          { strokeColor: "#f00", strokeWeight: "2", strokeOpacity: "0.6" },  //20

          { strokeColor: "#0f0", strokeWeight: "4", strokeOpacity: "0.6" }, //21
          { strokeColor: "#0f0", strokeWeight: "4", strokeOpacity: "0.6" }, //22
          { strokeColor: "#0f0", strokeWeight: "4", strokeOpacity: "0.6" }, //23
          { strokeColor: "#0f0", strokeWeight: "4", strokeOpacity: "0.6" }, //24
          { strokeColor: "#0f0", strokeWeight: "4", strokeOpacity: "0.6" }, //25
          { strokeColor: "#0f0", strokeWeight: "4", strokeOpacity: "0.6" }, //26
          { strokeColor: "#f00", strokeWeight: "4", strokeOpacity: "0.6" }, //27
          { strokeColor: "#ff0", strokeWeight: "4", strokeOpacity: "0.6" }, //28
          { strokeColor: "#0f0", strokeWeight: "4", strokeOpacity: "0.6" }, //29
          { strokeColor: "#0f0", strokeWeight: "4", strokeOpacity: "0.6" }, //30
          { strokeColor: "#f00", strokeWeight: "4", strokeOpacity: "0.6" }, //31
          { strokeColor: "#00f", strokeWeight: "4", strokeOpacity: "0.6" }, //32
          { strokeColor: "#00f", strokeWeight: "4", strokeOpacity: "0.6" }  //33
      ];
          var plPath = [
        [
          new BMap.Point(118.815115, 34.139164),
          new BMap.Point(118.819606, 34.138208),
          new BMap.Point(118.832506, 34.136565),
          new BMap.Point(118.842711, 34.13528),
          new BMap.Point(118.848352, 34.134592),
          new BMap.Point(118.85658, 34.133696),
          new BMap.Point(118.86215, 34.133606),
          new BMap.Point(118.866929, 34.133547),
          new BMap.Point(118.87372, 34.134084),
          new BMap.Point(118.873612, 34.136923),
          new BMap.Point(118.873253, 34.142869),
          new BMap.Point(118.872426, 34.156552),
          new BMap.Point(118.872426, 34.156642),
          new BMap.Point(118.872426, 34.156642),
          new BMap.Point(118.872426, 34.156642)
        ],
        [
          new BMap.Point(118.84272, 34.135388),
          new BMap.Point(118.842872, 34.136441),
          new BMap.Point(118.843043, 34.137756),
          new BMap.Point(118.843142, 34.138495),
          new BMap.Point(118.843294, 34.139668),
          new BMap.Point(118.843366, 34.140221),
          new BMap.Point(118.843492, 34.141095),
          new BMap.Point(118.843546, 34.141618),
          new BMap.Point(118.843663, 34.142499),
          new BMap.Point(118.843771, 34.143254),
          new BMap.Point(118.843932, 34.144531),
          new BMap.Point(118.844103, 34.145606),
          new BMap.Point(118.844229, 34.146719),
          new BMap.Point(118.84431, 34.147362),
          new BMap.Point(118.844471, 34.148975),
          new BMap.Point(118.844669, 34.150476),
          new BMap.Point(118.844857, 34.151567),
          new BMap.Point(118.845064, 34.153105),
          new BMap.Point(118.845217, 34.154263),
          new BMap.Point(118.845217, 34.154263),
          new BMap.Point(118.845226, 34.154263),
          new BMap.Point(118.845226, 34.154263),
          new BMap.Point(118.845244, 34.15445),
          new BMap.Point(118.845244, 34.15445),
          new BMap.Point(118.845244, 34.15445)
        ],
        [
          new BMap.Point(118.814746, 34.139467),
          new BMap.Point(118.815824, 34.142813),
          new BMap.Point(118.816579, 34.145263),
          new BMap.Point(118.817818, 34.148773),
          new BMap.Point(118.818573, 34.151134),
          new BMap.Point(118.81913, 34.152941),
          new BMap.Point(118.81913, 34.152941),
          new BMap.Point(118.81913, 34.152941)
        ],
        [
          new BMap.Point(118.817244, 34.146309),
          new BMap.Point(118.823136, 34.145024),
          new BMap.Point(118.830143, 34.14356),
          new BMap.Point(118.834527, 34.142992),
          new BMap.Point(118.849726, 34.141349),
          new BMap.Point(118.856985, 34.140542),
          new BMap.Point(118.873334, 34.140363),
          new BMap.Point(118.873334, 34.140363),
          new BMap.Point(118.873334, 34.140363)
        ],
        [
          new BMap.Point(118.834527, 34.143171),
          new BMap.Point(118.835856, 34.147295),
          new BMap.Point(118.836755, 34.149953),
          new BMap.Point(118.838048, 34.153777),
          new BMap.Point(118.838048, 34.153777),
          new BMap.Point(118.838048, 34.153777)
        ],
        [
          new BMap.Point(118.849403, 34.14849),
          new BMap.Point(118.84545, 34.148878),
          new BMap.Point(118.839845, 34.149505),
          new BMap.Point(118.834275, 34.150192),
          new BMap.Point(118.831437, 34.150581),
          new BMap.Point(118.82885, 34.151119),
          new BMap.Point(118.827341, 34.151477),
          new BMap.Point(118.826694, 34.149774),
          new BMap.Point(118.825328, 34.145233),
          new BMap.Point(118.825185, 34.144934),
          new BMap.Point(118.825185, 34.144934),
          new BMap.Point(118.825221, 34.145024),
          new BMap.Point(118.825221, 34.145024),
          new BMap.Point(118.825364, 34.145442),
          new BMap.Point(118.825364, 34.145442),
          new BMap.Point(118.825364, 34.145442),
          new BMap.Point(118.825364, 34.145442),
          new BMap.Point(118.825364, 34.145442),
          new BMap.Point(118.825364, 34.145442),
          new BMap.Point(118.825364, 34.145442),
          new BMap.Point(118.825364, 34.145442),
          new BMap.Point(118.825364, 34.145442),
          new BMap.Point(118.825364, 34.145442),
          new BMap.Point(118.825364, 34.145442),
          new BMap.Point(118.825364, 34.145442),
          new BMap.Point(118.8254, 34.145323),
          new BMap.Point(118.8254, 34.145323),
          new BMap.Point(118.823154, 34.137808)
        ],
        [
          new BMap.Point(118.826963, 34.149401),
          new BMap.Point(118.839468, 34.146772),
          new BMap.Point(118.855709, 34.14486),
          new BMap.Point(118.858224, 34.14474),
          new BMap.Point(118.863327, 34.144621),
          new BMap.Point(118.870944, 34.144441),
          new BMap.Point(118.8731, 34.144382),
          new BMap.Point(118.8731, 34.144382),
          new BMap.Point(118.8731, 34.144382)
        ],
        [
          new BMap.Point(118.816687, 34.144621),
          new BMap.Point(118.828544, 34.142111),
          new BMap.Point(118.828544, 34.142111),
          new BMap.Point(118.828544, 34.142111),
          new BMap.Point(118.828544, 34.142111)
        ],
        [
          new BMap.Point(118.845109, 34.15194),
          new BMap.Point(118.850966, 34.151313),
          new BMap.Point(118.857506, 34.150685),
          new BMap.Point(118.862536, 34.150476),
          new BMap.Point(118.862428, 34.148504),
          new BMap.Point(118.862105, 34.134163),
          new BMap.Point(118.862141, 34.134013),
          new BMap.Point(118.862141, 34.134103),
          new BMap.Point(118.862141, 34.134103),
          new BMap.Point(118.862141, 34.134103)
        ],
  //===========================横向============= =======================
//永嘉路（上接宁波路，向东过G205，到沭七路）10
//      var plPath = [
        [
          new BMap.Point(118.819373,34.138256),
          new BMap.Point(118.819031,34.133715),
          new BMap.Point(118.826254,34.132833),
          new BMap.Point(118.831715,34.132161),
          new BMap.Point(118.842136,34.130891),
          new BMap.Point(118.852089,34.129606),
          new BMap.Point(118.856455,34.129083),
          new BMap.Point(118.861988,34.128978),
          new BMap.Point(118.874223,34.128829),
          new BMap.Point(118.883098,34.128769),
          new BMap.Point(118.883098,34.128769),
          new BMap.Point(118.883098,34.128769)
        ],
//      ];
//荣亿路（）11
//      var plPath = [
        [
          new BMap.Point(118.84439, 34.124653),
          new BMap.Point(118.851541, 34.123756),
          new BMap.Point(118.85614, 34.123248),
          new BMap.Point(118.86171, 34.122979),
          new BMap.Point(118.874214, 34.12265),
          new BMap.Point(118.882802, 34.122471),
          new BMap.Point(118.88273, 34.122471)
        ],
        //  ];
        //余杭路12

        //var plPath = [
          [
            new BMap.Point(118.832425,34.136718),
            new BMap.Point(118.83167,34.132236),
            new BMap.Point(118.830772,34.126379),
            new BMap.Point(118.831024,34.122613),
            new BMap.Point(118.840869,34.121388),
            new BMap.Point(118.846906,34.120581),
            new BMap.Point(118.851217,34.120073),
            new BMap.Point(118.856032,34.119505),
            new BMap.Point(118.86153,34.119266),
            new BMap.Point(118.873855,34.118877),
            new BMap.Point(118.882766,34.118788),
            new BMap.Point(118.882766,34.118818),
            new BMap.Point(118.882766,34.118818),
            new BMap.Point(118.882766,34.118818)
          ],
        //];

        //瑞安路13

        //var plPath = [
          [
            new BMap.Point(118.844319,34.116576),
            new BMap.Point(118.846367,34.116337),
            new BMap.Point(118.850858,34.115769),
            new BMap.Point(118.85323,34.11547),
            new BMap.Point(118.855817,34.115142),
            new BMap.Point(118.861422,34.114962),
            new BMap.Point(118.873388,34.114604),
            new BMap.Point(118.882479,34.114394),
            new BMap.Point(118.882479,34.114394),
            new BMap.Point(118.882479,34.114394),
            new BMap.Point(118.882479,34.114394)
          ],
        //];
        //邦源路14
        //var plPath = [
          [
            new BMap.Point(118.838066,34.112601),
            new BMap.Point(118.84572,34.111555),
            new BMap.Point(118.850427,34.111017),
            new BMap.Point(118.855673,34.110449),
            new BMap.Point(118.861171,34.11024),
            new BMap.Point(118.872813,34.109851),
            new BMap.Point(118.882299,34.109612),
            new BMap.Point(118.882299,34.109612),
            new BMap.Point(118.882299,34.109612)
          ],
        //];
        //台南路（友富路）15
        //var plPath = [
          [
            new BMap.Point(118.850113,34.107617),
            new BMap.Point(118.855538,34.106959),
            new BMap.Point(118.861108,34.10672),
            new BMap.Point(118.866498,34.106481),
            new BMap.Point(118.872642,34.106421),
            new BMap.Point(118.882236,34.106242),
            new BMap.Point(118.882236,34.106242),
            new BMap.Point(118.8822,34.106272),
            new BMap.Point(118.8822,34.106272),
            new BMap.Point(118.8822,34.106272)
          ],
        //];
        //规划道路（地图中没有）


        //===========================纵向====================================（从右向左）
        //沭七路16
        //var plPath = [
          [
            new BMap.Point(118.88414,34.155995),
            new BMap.Point(118.883745,34.146495),
            new BMap.Point(118.883314,34.134604),
            new BMap.Point(118.883062,34.128807),
            new BMap.Point(118.882703,34.118765),
            new BMap.Point(118.882344,34.10959),
            new BMap.Point(118.881733,34.094016),
            new BMap.Point(118.881769,34.094076),
            new BMap.Point(118.881769,34.094076),
            new BMap.Point(118.881769,34.094076)
          ],
        //];

        //205国道（宁波路--规划S326)17
        //var plPath = [
          [
            new BMap.Point(118.873756,34.134036),
            new BMap.Point(118.874151,34.128807),
            new BMap.Point(118.874259,34.12265),
            new BMap.Point(118.873361,34.114581),
            new BMap.Point(118.872786,34.109889),
            new BMap.Point(118.872606,34.106451),
            new BMap.Point(118.872462,34.09557),
            new BMap.Point(118.872103,34.076585),
            new BMap.Point(118.871888,34.071203),
            new BMap.Point(118.871888,34.071203),
            new BMap.Point(118.871888,34.071203)
          ],
        //];

        //瑞声大道18
        //var plPath = [
          [
            new BMap.Point(118.862509,34.150573),
            new BMap.Point(118.86215,34.133543),
            new BMap.Point(118.861719,34.123054),
            new BMap.Point(118.860856,34.101953),
            new BMap.Point(118.860749,34.098634),
            new BMap.Point(118.860749,34.098634),
            new BMap.Point(118.860749,34.098634),
            new BMap.Point(118.860749,34.098634)
          ],
        //];
        //台北大道19
        //var plPath = [
          [
            new BMap.Point(118.852682,34.134066),
            new BMap.Point(118.852071,34.129613),
            new BMap.Point(118.851514,34.123756),
            new BMap.Point(118.851173,34.12008),
            new BMap.Point(118.850795,34.115807),
            new BMap.Point(118.850364,34.111084),
            new BMap.Point(118.849627,34.102461),
            new BMap.Point(118.849627,34.102461),
            new BMap.Point(118.849627,34.102461),
            new BMap.Point(118.849627,34.102461)
          ],
        //];

        //义乌路20
        //var plPath = [
          [
            new BMap.Point(118.842603,34.135298),
            new BMap.Point(118.842136,34.130936),
            new BMap.Point(118.841345,34.125004),
            new BMap.Point(118.84104,34.122568),
            new BMap.Point(118.840806,34.121328),
            new BMap.Point(118.839656,34.117219),
            new BMap.Point(118.838974,34.115201),
            new BMap.Point(118.838147,34.113259),
            new BMap.Point(118.838057,34.112571),
            new BMap.Point(118.837446,34.108342),
            new BMap.Point(118.837446,34.108342),
            new BMap.Point(118.837446,34.108342)
          ],
//沿着迎宾大道  （宿迁大道--瑞声大道）21
          //var plPath = [
            [
              new BMap.Point(118.82682,34.113655),
              new BMap.Point(118.834473,34.10956),
              new BMap.Point(118.841121,34.106242),
              new BMap.Point(118.849493,34.102207),
              new BMap.Point(118.856535,34.099875),
              new BMap.Point(118.860883,34.09844),
              new BMap.Point(118.860775,34.098829),
              new BMap.Point(118.860775,34.098829),
              new BMap.Point(118.860775,34.098829),
              new BMap.Point(118.860775,34.098829)
            ],
          //];
          //金华路（宿迁大道--江阴路）22
                  [
                    new BMap.Point(118.829227,34.112369),
                    new BMap.Point(118.822292,34.102296),
                    new BMap.Point(118.818304,34.096407),
                    new BMap.Point(118.812842,34.090518),
                    new BMap.Point(118.812842,34.090518),
                    new BMap.Point(118.812842,34.090518)
          ],
          //苏州东路（宿迁大道-高速）23
                  [
                    new BMap.Point(118.823334,34.109052),
                    new BMap.Point(118.830988,34.105764),
                    new BMap.Point(118.83627,34.103671),
                    new BMap.Point(118.83627,34.103671),
                    new BMap.Point(118.83627,34.103671)
          ],
          //天能路（金华路-)24
                  [
                    new BMap.Point(118.822364,34.102326),
                    new BMap.Point(118.834114,34.095152),
                    new BMap.Point(118.834114,34.095152),
                    new BMap.Point(118.834114,34.095152),
                    new BMap.Point(118.834114,34.095152)
          ],
          //杭州东路（宿迁大道--京沪高速）25
                  [
                    new BMap.Point(118.81489,34.097424),
                    new BMap.Point(118.830628,34.092162),
                    new BMap.Point(118.833072,34.091265),
                    new BMap.Point(118.835515,34.090548),
                    new BMap.Point(118.842055,34.091684),
                    new BMap.Point(118.842055,34.091684),
                    new BMap.Point(118.842055,34.091684),
                    new BMap.Point(118.842055,34.091684)
          ],

          //江阴路（宿迁大道---玉环路)26
                  [
                    new BMap.Point(118.812914,34.090578),
                    new BMap.Point(118.82028,34.088216),
                    new BMap.Point(118.824592,34.08687),
                    new BMap.Point(118.824592,34.08687),
                    new BMap.Point(118.824592,34.08687)
          ],
          //江阴路（宿迁大道-G205)27
                  [
                    new BMap.Point(118.808458,34.091684),
                    new BMap.Point(118.812842,34.090608),
                    new BMap.Point(118.820244,34.088335),
                    new BMap.Point(118.824915,34.08696),
                    new BMap.Point(118.834689,34.083671),
                    new BMap.Point(118.843672,34.079964),
                    new BMap.Point(118.848487,34.08116),
                    new BMap.Point(118.85208,34.082595),
                    new BMap.Point(118.854811,34.084628),
                    new BMap.Point(118.859985,34.084927),
                    new BMap.Point(118.872418,34.088754),
                    new BMap.Point(118.872418,34.088754),
                    new BMap.Point(118.872418,34.088754)
          ],
          //京沪高速第二水厂连接线 28
                  [
                    new BMap.Point(118.849996,34.081937),
                    new BMap.Point(118.848415,34.084389),
                    new BMap.Point(118.849277,34.084748),
                    new BMap.Point(118.849493,34.084509),
                    new BMap.Point(118.849493,34.084509),
                    new BMap.Point(118.849493,34.084509),
                    new BMap.Point(118.849493,34.084509)
          ],
//长兴路（杭州东路-温州路-金华路）29
        [
          new BMap.Point(118.823801,34.094434),
          new BMap.Point(118.82028,34.088186),
          new BMap.Point(118.818447,34.083791),
          new BMap.Point(118.808386,34.085854),
          new BMap.Point(118.808386,34.085854),
          new BMap.Point(118.808386,34.085854)
],
//长兴路（京沪高速--向右折--玉环路）30

        [
          new BMap.Point(118.833611,34.110008),
          new BMap.Point(118.831024,34.105853),
          new BMap.Point(118.836234,34.103701),
          new BMap.Point(118.83742,34.101011),
          new BMap.Point(118.835371,34.095869),
          new BMap.Point(118.831311,34.093986),
          new BMap.Point(118.829874,34.092521),
          new BMap.Point(118.829874,34.092521),
          new BMap.Point(118.829874,34.092521)
],
//赐富路（205国道左侧--沭七路）31
       [
          new BMap.Point(118.87319,34.144523),
          new BMap.Point(118.883718,34.144494),
          new BMap.Point(118.883718,34.144494),
          new BMap.Point(118.883718,34.144494)
    ],
//慈溪路（205国道--沭七路）32
        [
          new BMap.Point(118.873513,34.140281),
          new BMap.Point(118.883503,34.140251),
          new BMap.Point(118.883503,34.140251),
          new BMap.Point(118.883503,34.140251)
],
//宁波路（205国道--沭七路）33
        [
          new BMap.Point(118.873801,34.134185),
          new BMap.Point(118.883287,34.134484),
          new BMap.Point(118.883287,34.134484),
          new BMap.Point(118.883287,34.134484)
],
      ];
          for (var index = 0; index < plOpts.length; index++) {
              var polyline = new BMap.Polyline(plPath[index], plOpts[index]);
              map.addOverlay(polyline);
          }
      }
      //向地图添加控件
      function addMapControl() {
          var scaleControl = new BMap.ScaleControl({ anchor: BMAP_ANCHOR_BOTTOM_LEFT });
          scaleControl.setUnit(BMAP_UNIT_IMPERIAL);
          map.addControl(scaleControl);
          var navControl = new BMap.NavigationControl({ anchor: BMAP_ANCHOR_TOP_LEFT, type: BMAP_NAVIGATION_CONTROL_LARGE });
          map.addControl(navControl);
          var overviewControl = new BMap.OverviewMapControl({ anchor: BMAP_ANCHOR_BOTTOM_RIGHT, isOpen: false });
          map.addControl(overviewControl);
      }
      var customLayer;
      function addCustomLayer(keyword) {
          if (customLayer) {
              map.removeTileLayer(customLayer);
          }
          customLayer = new BMap.CustomLayer({
              geotableId: 154817,
              q: '', //检索关键字
              tags: '', //空格分隔的多字符串
              filter: '' //过滤条件,参考http://developer.baidu.com/map/lbs-geosearch.htm#.search.nearby
          });
          map.addTileLayer(customLayer);
          customLayer.addEventListener('hotspotclick', callback);
      }

    function callback(e) {
        var customPoi = e.customPoi; //poi的默认字段
        var contentPoi = e.content; //poi的自定义字段
       // var content = '<p style="width:280px;margin:0;line-height:20px;">地址：' + customPoi.address + '<br/>价格:' + contentPoi.liuliang + '元' + '</p>';
        //            alert(content);
        var content = '<p style="width:280px;margin:0;line-height:20px;">地址：' + customPoi.address + '<br/>高程:' + contentPoi.gaocheng + '单位' +
            '<br/>埋设深度:' + contentPoi.maishe + '米' + '<br/>管道长度:' + contentPoi.changdu + '米' + '<br/>管道直径:' + contentPoi.zhijing + '米' +
            '<br/>压力读数:' + contentPoi.yali + '单位' + '<br/>水质读数:' + contentPoi.shuizhi + '单位' + '<br/>流量:' + contentPoi.liuliang + '立方' + '</p>';

        var opts = {
            width: 250,     // 信息窗口宽度    
            height: 200,     // 信息窗口高度    
            title: customPoi.title  // 信息窗口标题   
        }
        var infoWindow = new BMap.InfoWindow(content, opts);  // 创建信息窗口对象    
        map.openInfoWindow(infoWindow, map.getCenter());      // 打开信息窗口
       
   } 
  
      var map;
      initMap();
  </script>
</html>
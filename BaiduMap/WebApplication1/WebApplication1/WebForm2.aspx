﻿<!DOCTYPE html>
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
          addMapOverlay(); //向地图添加覆盖物
          addCustomLayer();
      }
      function createMap() {
          map = new BMap.Map("map");
          map.centerAndZoom(new BMap.Point(118.800266, 34.135268), 14);
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
       // { content: "我的备注", title: "7", imageOffset: { width: -46, height: -21 }, position: { lat: 34.135354, lng: 118.842809} },
        { content: "我的备注", title: "8", imageOffset: { width: -46, height: -21 }, position: { lat: 34.150712, lng: 118.8625} },
      //  { content: "我的备注", title: "9", imageOffset: { width: -46, height: -21 }, position: { lat: 34.133681, lng: 118.862159} },
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
        { strokeColor: "#0f0", strokeWeight: "4", strokeOpacity: "0.6" },
        { strokeColor: "#0f0", strokeWeight: "4", strokeOpacity: "0.6" },
        { strokeColor: "#0f0", strokeWeight: "4", strokeOpacity: "0.6" },
        { strokeColor: "#0f0", strokeWeight: "4", strokeOpacity: "0.6" },
        { strokeColor: "#0f0", strokeWeight: "4", strokeOpacity: "0.6" },
        { strokeColor: "#0f0", strokeWeight: "4", strokeOpacity: "0.6" },
        { strokeColor: "#0f0", strokeWeight: "4", strokeOpacity: "0.6" }
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
        var content = '<p style="width:280px;margin:0;line-height:20px;">地址：' + customPoi.address + '<br/>价格:' + contentPoi.liuliang + '元' + '</p>';
//            alert(content);
        var opts = {
            width: 250,     // 信息窗口宽度    
            height: 100,     // 信息窗口高度    
            title: customPoi.title  // 信息窗口标题   
        }
        var infoWindow = new BMap.InfoWindow(content, opts);  // 创建信息窗口对象    
        map.openInfoWindow(infoWindow, map.getCenter());      // 打开信息窗口
       
   } 
  
      //var map;
      //initMap();
  </script>
</html>
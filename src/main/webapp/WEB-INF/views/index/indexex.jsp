<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/Nwagon.css" type="text/css">
<script src="../resources/css/Nwagon.js"></script>
</head>
<body>
<div id="a">

<div id="Nwagon" style="position: relative;">
</div>
<div id="Nwagon2" style="position:absolute; top:0px; left:9px;">
</div>
</div>

<script>
	var a = {
		'legend': {
			names: ['CH1','CH2','CH3','CH4','CH5','CH6','CH7','CH8','CH9','CH10','CH11','CH12'],
		
		},
		'dataset': {
			title: 'Playing time per day',
			values: [50,70,80,100,60,50,100,70,55,100,100,100],
			colorset: ['#DC143C', '#FF8C00']
		},
		'chartDiv': 'Nwagon',
		'chartType': 'column',
		'chartSize': { width: 700, height: 300 },
		'maxValue': 100,
		'increment': 20
	};
	var options = {
			'legend':{
				names: ['','','','','','','','','','','',''],
				hrefs: []
			},
			'dataset':{
				title:'Playing time per day',
				values: [[50],[70],[80],[100],[60],[50],[100],[70],[55],[100],[100],[100]],
				colorset: ['#DC143C', '#FF8C00','#FF8C00'],
				fields:[]
			},
			'chartDiv' : 'Nwagon2',
			'chartType' : 'line',
			'chartSize' : {width:700, height:300},
			'minValue' : 0,
			'maxValue' : 100,
			'increment' : 20,
			'isGuideLineNeeded' : false  //default set to false
		};
	Nwagon.chart(a);
	Nwagon.chart(options);	
</script>
</body>

</html>
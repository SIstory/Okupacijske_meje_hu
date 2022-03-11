$(function () {
    var chart;
    
    $(document).ready(function () {
    	
    	// Build the chart
        $('#exh03-pano8-chart1').highcharts({
            chart: {
                type: 'pie',
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            title: {
                text: 'Struktura smrtnih žrtev druge svetovne vojne na Žirovskem'
            },
            credits: { 
                enabled: false 
            },
            tooltip: {
        	    pointFormat: '<b>{point.percentage:.1f}%</b> ({point.y:,.0f})'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    
                    showInLegend: true
                }
            },
            series: [{
                data: [ 
                    ['povojni poboji', 95],
                    ['smrt v partizanski vojski', 83],
                    ['ubila NOV', 33],
                    ['smrt v nemški vojski', 25],
                    ['eksplozija mine', 20],
                    ['ustrelili Nemci', 14],
                    ['smrt v taborišču', 12],
                    ['smrt v internaciji ali na prisilnem delu', 5],
                    ['bombardiranje', 5],
                    ['kot talca ustrelili četniki', 4],
                    ['smrt v domobranski vojski', 4],
                    ['nejasno', 3],
                    ['ustrelili domobranci', 2],
                    ['umrl kot jugoslovanski vojak', 2],
                    ['ustrelili Italijani', 2],
                    ['eksplozija granate', 1],
                    ['smrt v italijanski vojski', 1],
                    ['eksplozija najdene letalske bombe', 1]
                  ]
               }]
        });
    });
    
});

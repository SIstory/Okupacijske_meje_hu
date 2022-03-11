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
                text: 'The structure of the World War II victims in Žiri Region'
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
                    ['Post-War Massacres', 95],
                    ['Died in the Partisans', 83],
                    ['Killed by NLA (National Liberation Army)', 33],
                    ['Died in the German Army', 25],
                    ['Mine Explosion', 20],
                    ['Shot by Germans', 14],
                    ['Died in the Camp', 12],
                    ['Died due to interment or forced labor', 5],
                    ['Bombardment', 5],
                    ['Shot as hostage by Chetniks', 4],
                    ['Died in the Home Guard', 4],
                    ['Unclear', 3],
                    ['Shot by Home Guard', 2],
                    ['Died as a Yugoslav soldier', 2],
                    ['Shot by Italians', 2],
                    ['Granade Explosion', 1],
                    ['Died in the Italian Army', 1],
                    ['Explosion of a found air bomb', 1]
                  ]
               }]
        });
    });
    
});

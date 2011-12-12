$(document).ready(function() {
	init();
});

var labelType, useGradients, nativeTextSupport, animate;

(function() {
  var ua = navigator.userAgent,
      iStuff = ua.match(/iPhone/i) || ua.match(/iPad/i),
      typeOfCanvas = typeof HTMLCanvasElement,
      nativeCanvasSupport = (typeOfCanvas == 'object' || typeOfCanvas == 'function'),
      textSupport = nativeCanvasSupport 
        && (typeof document.createElement('canvas').getContext('2d').fillText == 'function');
  // I'm setting this based on the fact that ExCanvas provides text support for IE
  // and that as of today iPhone/iPad current text support is lame
  labelType = (!nativeCanvasSupport || (textSupport && !iStuff))? 'Native' : 'HTML';
  nativeTextSupport = labelType == 'Native';
  useGradients = nativeCanvasSupport;
  animate = !(iStuff || !nativeCanvasSupport);
})();

var Log = {
  elem: false,
  write: function(text){
    if (!this.elem) 
      this.elem = document.getElementById('log');
    this.elem.innerHTML = text;
    this.elem.style.left = (500 - this.elem.offsetWidth / 2) + 'px';
  }
};


function init(){
    //init data

	// var json = $.getJSON("localhost:3000/users/100/following.json");
	/*
	var json = {};
	$.ajax({
		url: 'localhost:3000/users/100/following.json',
		success: function(data){ 
			json += data;
		}
	});
	*/
	var json = 
	{"name":"Adi Dahiya","data":{"relation":"<h4>Adi Dahiya</h4><b>Following:</b><ul><li>Ida Metz</li><li>Mauricio Kunze</li><li>Shanelle Heaney</li></ul>"},"id":"100","children":[{"name":"Ida Metz","data":{"relation":"<h4>Ida Metz</h4><b>Following:</b><ul><li>Delaney Osinski</li><li>Mauricio Kunze</li><li>Aylin Crona</li><li>Shanelle Heaney</li><li>Frederic Conn</li><li>Tyreek Kovacek</li><li>Donnie Kassulke</li><li>Deborah Roob</li><li>Letitia Lowe</li><li>Cletus Wiegand</li><li>Mable Boehm</li><li>Cielo Towne</li><li>Viviane Russel</li><li>Rosella Kozey</li><li>Quinton Spencer</li><li>Tia Kuhic</li><li>Shawna Vandervort</li><li>Oda Reilly</li><li>Beatrice Grady</li><li>Carson DuBuque</li><li>Clarissa Corwin</li><li>Dariana Kuhic</li><li>Clementine Ferry</li><li>Rosetta Hessel</li><li>Christelle Lakin</li><li>Claud Rohan</li><li>Shayna Lindgren</li><li>Alfredo Fay</li><li>Janelle Hudson</li><li>Serena Murazik</li><li>Nelle Aufderhar</li><li>Erling Moen</li><li>Presley Hayes</li><li>Edwardo Shields</li><li>Ismael Walker</li><li>Lucas Zieme</li><li>Patience Padberg</li><li>Kane Murphy</li><li>Bettye Kiehn</li><li>Karl Brakus</li><li>Cynthia Morar</li><li>Bruce Weissnat</li><li>Vada Collins</li><li>Harvey Hermann</li><li>Victor Jakubowski</li><li>Krystel Labadie</li><li>Justine Erdman</li><li>Pattie Raynor</li><li>Lucy Schaden</li><li>Reuben Ryan</li></ul>"},"id":"1","children":[{"name":"Delaney Osinski","data":{"relation":"<h4>Delaney Osinski</h4>"},"id":"2","children":[]},{"name":"Mauricio Kunze","data":{"relation":"<h4>Mauricio Kunze</h4>"},"id":"3","children":[]},{"name":"Aylin Crona","data":{"relation":"<h4>Aylin Crona</h4>"},"id":"4","children":[]},{"name":"Shanelle Heaney","data":{"relation":"<h4>Shanelle Heaney</h4>"},"id":"5","children":[]},{"name":"Frederic Conn","data":{"relation":"<h4>Frederic Conn</h4>"},"id":"6","children":[]},{"name":"Tyreek Kovacek","data":{"relation":"<h4>Tyreek Kovacek</h4>"},"id":"7","children":[]},{"name":"Donnie Kassulke","data":{"relation":"<h4>Donnie Kassulke</h4>"},"id":"8","children":[]},{"name":"Deborah Roob","data":{"relation":"<h4>Deborah Roob</h4>"},"id":"9","children":[]},{"name":"Letitia Lowe","data":{"relation":"<h4>Letitia Lowe</h4>"},"id":"10","children":[]},{"name":"Cletus Wiegand","data":{"relation":"<h4>Cletus Wiegand</h4>"},"id":"11","children":[]},{"name":"Mable Boehm","data":{"relation":"<h4>Mable Boehm</h4>"},"id":"12","children":[]},{"name":"Cielo Towne","data":{"relation":"<h4>Cielo Towne</h4>"},"id":"13","children":[]},{"name":"Viviane Russel","data":{"relation":"<h4>Viviane Russel</h4>"},"id":"14","children":[]},{"name":"Rosella Kozey","data":{"relation":"<h4>Rosella Kozey</h4>"},"id":"15","children":[]},{"name":"Quinton Spencer","data":{"relation":"<h4>Quinton Spencer</h4>"},"id":"16","children":[]},{"name":"Tia Kuhic","data":{"relation":"<h4>Tia Kuhic</h4>"},"id":"17","children":[]},{"name":"Shawna Vandervort","data":{"relation":"<h4>Shawna Vandervort</h4>"},"id":"18","children":[]},{"name":"Oda Reilly","data":{"relation":"<h4>Oda Reilly</h4>"},"id":"19","children":[]},{"name":"Beatrice Grady","data":{"relation":"<h4>Beatrice Grady</h4>"},"id":"20","children":[]},{"name":"Carson DuBuque","data":{"relation":"<h4>Carson DuBuque</h4>"},"id":"21","children":[]},{"name":"Clarissa Corwin","data":{"relation":"<h4>Clarissa Corwin</h4>"},"id":"22","children":[]},{"name":"Dariana Kuhic","data":{"relation":"<h4>Dariana Kuhic</h4>"},"id":"23","children":[]},{"name":"Clementine Ferry","data":{"relation":"<h4>Clementine Ferry</h4>"},"id":"24","children":[]},{"name":"Rosetta Hessel","data":{"relation":"<h4>Rosetta Hessel</h4>"},"id":"25","children":[]},{"name":"Christelle Lakin","data":{"relation":"<h4>Christelle Lakin</h4>"},"id":"26","children":[]},{"name":"Claud Rohan","data":{"relation":"<h4>Claud Rohan</h4>"},"id":"27","children":[]},{"name":"Shayna Lindgren","data":{"relation":"<h4>Shayna Lindgren</h4>"},"id":"28","children":[]},{"name":"Alfredo Fay","data":{"relation":"<h4>Alfredo Fay</h4>"},"id":"29","children":[]},{"name":"Janelle Hudson","data":{"relation":"<h4>Janelle Hudson</h4>"},"id":"30","children":[]},{"name":"Serena Murazik","data":{"relation":"<h4>Serena Murazik</h4>"},"id":"31","children":[]},{"name":"Nelle Aufderhar","data":{"relation":"<h4>Nelle Aufderhar</h4>"},"id":"32","children":[]},{"name":"Erling Moen","data":{"relation":"<h4>Erling Moen</h4>"},"id":"33","children":[]},{"name":"Presley Hayes","data":{"relation":"<h4>Presley Hayes</h4>"},"id":"34","children":[]},{"name":"Edwardo Shields","data":{"relation":"<h4>Edwardo Shields</h4>"},"id":"35","children":[]},{"name":"Ismael Walker","data":{"relation":"<h4>Ismael Walker</h4>"},"id":"36","children":[]},{"name":"Lucas Zieme","data":{"relation":"<h4>Lucas Zieme</h4>"},"id":"37","children":[]},{"name":"Patience Padberg","data":{"relation":"<h4>Patience Padberg</h4>"},"id":"38","children":[]},{"name":"Kane Murphy","data":{"relation":"<h4>Kane Murphy</h4>"},"id":"39","children":[]},{"name":"Bettye Kiehn","data":{"relation":"<h4>Bettye Kiehn</h4>"},"id":"40","children":[]},{"name":"Karl Brakus","data":{"relation":"<h4>Karl Brakus</h4>"},"id":"41","children":[]},{"name":"Cynthia Morar","data":{"relation":"<h4>Cynthia Morar</h4>"},"id":"42","children":[]},{"name":"Bruce Weissnat","data":{"relation":"<h4>Bruce Weissnat</h4>"},"id":"43","children":[]},{"name":"Vada Collins","data":{"relation":"<h4>Vada Collins</h4>"},"id":"44","children":[]},{"name":"Harvey Hermann","data":{"relation":"<h4>Harvey Hermann</h4>"},"id":"45","children":[]},{"name":"Victor Jakubowski","data":{"relation":"<h4>Victor Jakubowski</h4>"},"id":"46","children":[]},{"name":"Krystel Labadie","data":{"relation":"<h4>Krystel Labadie</h4>"},"id":"47","children":[]},{"name":"Justine Erdman","data":{"relation":"<h4>Justine Erdman</h4>"},"id":"48","children":[]},{"name":"Pattie Raynor","data":{"relation":"<h4>Pattie Raynor</h4>"},"id":"49","children":[]},{"name":"Lucy Schaden","data":{"relation":"<h4>Lucy Schaden</h4>"},"id":"50","children":[]},{"name":"Reuben Ryan","data":{"relation":"<h4>Reuben Ryan</h4>"},"id":"51","children":[]}]},{"name":"Mauricio Kunze","data":{"relation":"<h4>Mauricio Kunze</h4><b>Following:</b><ul></ul>"},"id":"3","children":[]},{"name":"Shanelle Heaney","data":{"relation":"<h4>Shanelle Heaney</h4><b>Following:</b><ul><li>Ida Metz</li></ul>"},"id":"5","children":[{"name":"Ida Metz","data":{"relation":"<h4>Ida Metz</h4>"},"id":"1","children":[]}]}]};
    //end
    
    //init RGraph
    var rgraph = new $jit.RGraph({
        //Where to append the visualization
        injectInto: 'infovis',
        //Optional: create a background canvas that plots
        //concentric circles.
        background: {
          CanvasStyles: {
            strokeStyle: '#555'
          }
        },
        //Add navigation capabilities:
        //zooming by scrolling and panning.
        Navigation: {
          enable: true,
          panning: true,
          zooming: 10
        },
        //Set Node and Edge styles.
        Node: {
            color: '#ddeeff'
        },
        
        Edge: {
          color: '#3B5998',
          lineWidth:1.5
        },

        onBeforeCompute: function(node){
            Log.write("centering " + node.name + "...");
            //Add the relation list in the right column.
            //This list is taken from the data property of each JSON node.
            $jit.id('inner-details').innerHTML = node.data.relation;
        },
        
        onAfterCompute: function(){
            Log.write("done");
        },
        //Add the name of the node in the correponding label
        //and a click handler to move the graph.
        //This method is called once, on label creation.
        onCreateLabel: function(domElement, node){
            domElement.innerHTML = node.name;
            domElement.onclick = function(){
                rgraph.onClick(node.id);
            };
        },
        //Change some label dom properties.
        //This method is called each time a label is plotted.
        onPlaceLabel: function(domElement, node){
            var style = domElement.style;
            style.display = '';
            style.cursor = 'pointer';

            if (node._depth <= 1) {
                style.fontSize = "0.8em";
                style.color = "#eee";
            
            } else if(node._depth == 2){
                style.fontSize = "0.7em";
                style.color = "#888";
            
            } else {
                style.display = 'none';
            }

            var left = parseInt(style.left);
            var w = domElement.offsetWidth;
            style.left = (left - w / 2) + 'px';
        }
    });
    //load JSON data
    rgraph.loadJSON(json);
    //trigger small animation
    rgraph.graph.eachNode(function(n) {
      var pos = n.getPos();
      pos.setc(-200, -200);
    });
    rgraph.compute('end');
    rgraph.fx.animate({
      modes:['polar'],
      duration: 1000
    });
    //end
    //append information about the root relations in the right column
    $jit.id('inner-details').innerHTML = rgraph.graph.getNode(rgraph.root).data.relation;
}

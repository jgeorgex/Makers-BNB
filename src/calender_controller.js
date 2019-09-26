

var events = [
  {'Date': new Date(2019, 8, 7), 'Title': 'Doctor appointment at 3:25pm.'},
  {'Date': new Date(2019, 8, 18), 'Title': 'New Garfield movie comes out!', 'Link': 'https://garfield.com'},
  {'Date': new Date(2019, 8, 27), 'Title': '25 year anniversary', 'Link': 'https://www.google.com.au/#q=anniversary+gifts'},
  {'Date': new Date(2019, 8, 23)}
];

// $("#caleandar").click(function(){
// alert("You have selected X ")
// })

$(document).on("click","#caleandar",function(event){
  alert(event.target.id);
});

var settings = {
  DateTimeShow: true,
  EventTargetWholeDay: true,

};
var element = document.getElementById('caleandar');
caleandar(element, events, settings);

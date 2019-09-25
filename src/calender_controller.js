

var events = [
  {'Date': new Date(2019, 8, 7), 'Title': 'Doctor appointment at 3:25pm.'},
  {'Date': new Date(2019, 8, 18), 'Title': 'New Garfield movie comes out!', 'Link': 'https://garfield.com'},
  {'Date': new Date(2019, 8, 27), 'Title': '25 year anniversary', 'Link': 'https://www.google.com.au/#q=anniversary+gifts'},
];
//
// var yr = '2019'
// var month = '9'  parse(yr, 10), parse(month, 10), parse( day, 10)
// var day = '5'
// // var newEvent = {'Date': new Date(2019, 8, 20)};
//
// events.push(newEvent)

var settings = {
  DateTimeShow: true,
};
var element = document.getElementById('caleandar');
caleandar(element, events, settings);

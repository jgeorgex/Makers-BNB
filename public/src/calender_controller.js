
  var events = [];
  reservations.forEach(function(date){
    var res = {'Date': new Date(date)};
    events.push(res)
    console.log(events)
  })

  console.log(events)
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

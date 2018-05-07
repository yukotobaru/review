->
$(document).on 'turbolinks:load', ->
 $('#event_end_time').on "change", ->

  start = $('#event_start_time')
  end = $('#event_end_time')

  t = new Date("#{end.val().toString()}")
  s = new Date("#{start.val().toString()}")
  
  diffMs = t.getTime() - s.getTime()
 
  minus = 0
  if (s.getHours() >= 0 && s.getHours()<=12) && (t.getHours() >= 13 && t.getHours()<=17)
   minus = 1
  else if (s.getHours() >= 0 && s.getHours()<=12) && (t.getHours() >= 13 && t.getHours()<=24)
   minus = 1.5
   #alert minus
  else if (s.getHours()>=13) && (t.getHours()<=17) && (s.getHours()<18) 
   minus = 0
  else if (s.getHours()>=13) && (s.getHours()<18) && (t.getHours()>17) 
   minus = 0.5
  else if (s.getHours()>17) && (t.getHours()>17) 
   minus = 0
  else
   minus = 0
  
  #hours = parseInt(diffMs/(60*60*1000), 10) 
  minutes = parseInt(diffMs/(60*1000), 10)/60
  num = minutes - minus
  num = Math.round(num * 100) / 100
  #$("#event_kosu").style.Color = '#ff0000'
  
  $("#event_kosu").val("#{num}")
  $('#event_end_time').closest('form').submit()
  
   
 $('#event_start_time').on "change", ->

  start = $('#event_start_time')
  end = $('#event_end_time')

  t = new Date("#{end.val().toString()}")
  s = new Date("#{start.val().toString()}")
 
  diffMs = t.getTime() - s.getTime()
 
  minus = 0
  if (s.getHours() >= 0 && s.getHours()<=12) && (t.getHours() >= 13 && t.getHours()<=17)
   minus = 1
  else if (s.getHours() >= 0 && s.getHours()<=12) && (t.getHours() >= 13 && t.getHours()<=24)
   minus = 1.5
   #alert minus
  else if (s.getHours()>=13) && (t.getHours()<=17) && (s.getHours()<18) 
   minus = 0
  else if (s.getHours()>=13) && (s.getHours()<18) && (t.getHours()>17) 
   minus = 0.5
  else if (s.getHours()>17) && (t.getHours()>17) 
   minus = 0
  else
   minus = 0
 
  hours = parseInt(diffMs/(60*60*1000), 10) 
  minutes = parseInt(diffMs/(60*1000), 10)/60
  num = minutes - minus
  num = Math.round(num * 100) / 100
  #$("#event_kosu").style.Color = '#ff0000'
  
  $("#event_kosu").val("#{num}")

 $('#Applysection_id').on "change", -> 
  $Applysection_id = $('#Applysection_id')
  $Applysection_id.val($(this).val())
  
  $Member_id = $('#Member_id')
  $Member_id.val('22')
  #y = $('#date')
  #alert y
  
  $('#select2-Member_id-container').removeAttr('title')
  $("select").select2({
    #// other options 
    selectionTitleAttribute: false
  })
  $Applysection_id.closest('form').submit()   
 
 $('#Member_id').on "change", -> 
  $Member_id = $('#Member_id')
  $Member_id.val($(this).val())
  
  $Applysection_id = $('#Applysection_id')
  $Applysection_id.val('1')
  
  
  $('#select2-Applysection_id-container').removeAttr('title')
  $("select").select2({
    #// other options 
    selectionTitleAttribute: false
  })
  $Applysection_id.closest('form').submit()
  
 $('#PjMaster_id').on "change", -> 
  $PjMaster_id = $('#PjMaster_id')
  $PjMaster_id.val($(this).val())
  
  $Applysection_id = $('#Applysection_id')
  $Member_id = $('#Member_id')
  $Applysection_id.closest('form').submit()
 
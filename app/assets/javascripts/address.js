$(document).on('turbolinks:load',function(){

  function insertStr(input){
    return input.slice(0, 3) + '-' + input.slice(3,input.length);
  }

  $("#address_postal_code").on('keyup',function(e){
    var input = $(this).val();

    var key = event.keyCode || event.charCode;
    if( key == 8 || key == 46 ){
      return false;
    }

    if(input.length === 3){
      $(this).val(insertStr(input));
    }
  });

  $("#postal_code").on('blur',function(e){
    var input = $(this).val();

    if(input.length >= 3 && input.substr(3,1) !== '-'){
      $(this).val(insertStr(input));
    }
  });
})
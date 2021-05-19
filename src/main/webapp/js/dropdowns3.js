/**
 * 
 */
$(function() {

 // Set
  var main2 = $('div.mm-dropdown .textfirst2')
  var li2 = $('div.mm-dropdown > ul > li.input-option2')
  
  
  var inputoption2 = $("div.mm-dropdown .option2")
  var default_text = 'Selecciona Elemento';

  // Animation
  main2.click(function() {
    main2.html(default_text);
    li2.toggle('fast');
  });

  // Insert Data
  li2.click(function() {
    // hide
    li2.toggle('fast');
    var livalue = $(this).data('value');
    var lihtml = $(this).html();
    main2.html(lihtml);
    inputoption2.val(livalue);
  });

  
  
});
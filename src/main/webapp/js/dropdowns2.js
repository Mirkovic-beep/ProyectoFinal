/**
 * 
 */
$(function() {

 // Set
  var main1 = $('div.mm-dropdown .textfirst1')
  var li1 = $('div.mm-dropdown > ul > li.input-option1')
  
  
  var inputoption1 = $("div.mm-dropdown .option1")
  var default_text = 'Selecciona Elemento';

  // Animation
  main1.click(function() {
    main1.html(default_text);
    li1.toggle('fast');
  });

  // Insert Data
  li1.click(function() {
    // hide
    li1.toggle('fast');
    var livalue = $(this).data('value');
    var lihtml = $(this).html();
    main1.html(lihtml);
    inputoption1.val(livalue);
  });

  
  
});
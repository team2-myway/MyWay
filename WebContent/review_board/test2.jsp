<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="../demo/javascripts/jquery.js"></script>
<script src="../lib/js/jquery.raty.js"></script>
<script src="../demo/javascripts/labs.js" type="text/javascript"></script>
<script>
  $.fn.raty.defaults.path = 'lib/images';

  $(function() {
    $('#default').raty();

$('#score').raty({ score: 3 });

$('#score-callback').raty({
  score: function() {
    return $(this).attr('data-score');
  }
});

$('#scoreName').raty({ scoreName: 'entity[score]' });

$('#number').raty({ number: 10 });

$('#number-callback').raty({
  number: function() {
    return $(this).attr('data-number');
  }
});

$('#numberMax').raty({
  numberMax : 5,
  number    : 100
});

$('#readOnly').raty({ readOnly: true, score: 3 });

$('#readOnly-callback').raty({
  readOnly: function() {
    return 'true becomes readOnly' == 'true becomes readOnly';
  }
});

$('#noRatedMsg').raty({
  readOnly   : true,
  noRatedMsg : "I'am readOnly and I haven't rated yet!"
});

$('#halfShow-true').raty({ score: 3.26 });

$('#halfShow-false').raty({
  halfShow : false,
  score    : 3.26
});

$('#round').raty({
  round : { down: .26, full: .6, up: .76 },
  score : 3.26
});

$('#half').raty({ half: true });

$('#starHalf').raty({
  half     : true,
  path     : null,
  starHalf : 'demo/images/star-half-mono.png',
  starOff  : 'lib/images/star-off.png',
  starOn   : 'lib/images/star-on.png'
});

$('#click').raty({
  click: function(score, evt) {
    alert('ID: ' + $(this).attr('id') + "\nscore: " + score + "\nevent: " + evt.type);
  }
});

$('#hints').raty({ hints: ['a', null, '', undefined, '*_*']});

$('#star-off-and-star-on').raty({
  path    : 'demo/images',
  starOff : 'off.png',
  starOn  : 'on.png'
});

$('#cancel').raty({ cancel: true });

$('#cancelHint').raty({
  cancel     : true,
  cancelHint : 'My cancel hint!'
});

$('#cancelPlace').raty({
  cancel      : true,
  cancelPlace : 'right'
});

$('#star-off-and-star-on').raty({
  path    : 'demo/images',
  starOff : 'off.png',
  starOn  : 'on.png'
});

$('#cancel-off-and-cancel-on').raty({
  cancel    : true,
  cancelOff : 'demo/images/cancel-custom-off.png',
  cancelOn  : 'demo/images/cancel-custom-on.png',
  path      : null,
  starOff   : 'lib/images/star-off.png',
  starOn    : 'lib/images/star-on.png'
});

$('#iconRange').raty({
  path      : null,
  starOff   : 'lib/images/star-off.png',
  iconRange : [
    { range: 1, on: 'demo/images/1.png', off: 'demo/images/0.png' },
    { range: 2, on: 'demo/images/2.png', off: 'demo/images/0.png' },
    { range: 3, on: 'demo/images/3.png', off: 'demo/images/0.png' },
    { range: 4, on: 'demo/images/4.png', off: 'demo/images/0.png' },
    { range: 5, on: 'demo/images/5.png', off: 'demo/images/0.png' }
  ]
});

$('#size').raty({
  path      : 'demo/images',
  cancel    : true,
  cancelOff : 'cancel-off-big.png',
  cancelOn  : 'cancel-on-big.png',
  half      : true,
  size      : 24,
  starHalf  : 'star-half-big.png',
  starOff   : 'star-off-big.png',
  starOn    : 'star-on-big.png'
});

$('#width').raty({ width: 150 });

$('#target-div').raty({
  cancel : true,
  target : '#target-div-hint'
});

$('#target-text').raty({
  cancel : true,
  target : '#target-text-hint'
});

$('#target-textarea').raty({
  cancel : true,
  target : '#target-textarea-hint'
});

$('#target-select').raty({
  cancel : true,
  target : '#target-select-hint'
});

$('#targetType').raty({
  cancel     : true,
  target     : '#targetType-hint',
  targetType : 'score'
});

$('#targetKeep').raty({
  cancel     : true,
  target     : '#targetKeep-hint',
  targetKeep : true
});

$('#targetText').raty({
  target     : '#targetText-hint',
  targetText : '--'
});

$('#targetFormat').raty({
  target       : '#targetFormat-hint',
  targetFormat : 'Rating: {score}'
});

$('#mouseover').raty({
  mouseover: function(score, evt) {
    alert('ID: ' + $(this).attr('id') + "\nscore: " + score + "\nevent: " + evt.type);
  }
});

$('#mouseout').raty({
  mouseout: function(score, evt) {
    alert('ID: ' + $(this).attr('id') + "\nscore: " + score + "\nevent: " + evt.type);
  }
});

  });
</script>
</head>
<body>
<div id="score" style="cursor: pointer; width: 100px;"><img src="../lib/images/star/star-on.png" alt="1" title="bad">&nbsp;<img src="../lib/images/star/star-on.png" alt="2" title="poor">&nbsp;<img src="../lib/images/star/star-on.png" alt="3" title="regular">&nbsp;<img src="../lib/images/star/star-off.png" alt="4" title="good">&nbsp;<img src="../lib/images/star/star-off.png" alt="5" title="gorgeous"><input type="hidden" name="score" value="3"></div>
</body>
</html>
(function(){
  var chatEl = document.querySelector('[data-chat]');
  var id = $(chatEl).attr('data-chat') || '888888';

  var container = document.createElement('div');
  document.body.appendChild(container);

  function addMsg(data){
    if(data.type === 'text'){
      var div = document.createElement('div');
      div.innerHTML = data.msg;
    
      container.appendChild(div);

      var duration = 10000 + Math.round(5000 * Math.random());

      var bgmask = $.Color($('body').css('background-color'));

      function randColor(){return 128 + Math.round(128 * Math.random());};

      $(div).css({
        position: 'absolute',
        right: 0,
        zIndex: 99999,
        whiteSpace: 'nowrap',
        fontSize: '32px',
        opacity: 0.9,
        top: 50 + 24 * (0 | (18 * Math.random())) + 'px',
        color: 'rgb(' + [bgmask.red() ^ randColor(),
            bgmask.green() ^ randColor(),
            bgmask.blue() ^ randColor()] + ')'
      });

      var start = Date.now();

      requestAnimationFrame(function a(){
        var t = Date.now();
        var p = Math.min(1.0, (t - start)/duration);
        var right = 3500 * p;

        div.style.transform = 'translate3d(-' + right + 'px,0,0)'
        if(p < 1){
          requestAnimationFrame(a);
        }
      });
    }
  }

  setTimeout(function(){
    ///初始化弹幕
    var socket = new io("http://api.baomitu.com");
    socket.on('connected', function(){
      console.log('connected');
    });
    socket.emit('event', {method:'bind', params:[id]});
    socket.on('message', function(data){
      console.log(data);
      if(!(data instanceof Array)){
        if(data.type !== 'login'){
          addMsg(data);
        }
      }
    });
  }, 1000);

  var qrcode = document.getElementById("qrcode");

  if(qrcode){
    $.ajax({  
        type : "get",  
        url : "http://api.baomitu.com/wechat/qrcode?id="+id+"&callback=?",  
        dataType : "jsonp",//数据类型为jsonp    
        success : function(data){  
            //console.log(data);
            var url = data.url;
            new QRCode(qrcode, {
              text: url,
              width: 340,
              height: 340,
            });
        },  
        error:function(){  
          console.log('qrcode error');
        }  
    }); 
  }
})();

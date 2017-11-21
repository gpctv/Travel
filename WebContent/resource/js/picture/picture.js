/**
 * 
 */

$(document).ready(function(){
	ajaxInterval();
});
var fileDisplay=[] ;//回傳SERVER 目前CLIENT端的照片數量
function ajaxInterval(){
	 $.ajax({
		url:CONTEXT_PATH+"/pictureRest",
		type:'POST',
		dataType:'json',
		data:   JSON.stringify({fileDisplay:fileDisplay})  ,
        contentType: "application/json; charset=utf-8",
		success:function(s){
		 
			//$('#image1').attr('src',CONTEXT_PATH+'/resource/picture/'+s.fileName);
		 /**$('.carousel-inner').append('<div class="item">'+
					'<img src="'+CONTEXT_PATH+'/resource/picture/'+s.fileName+'">'+
					'</div>'); **/
			console.log('return vlaue:'+s.fileName);
			console.log('item:'+$('.item').length);
			if(s.refresh=='true'){//如果SERVER 端照片少於CLIENT 就重整
				location.reload();
			}
			
			$.each(s.fileName,function(key){
				var active=firstLoad(key);//判斷是否加active
				//增加圖片
				$('.carousel-inner').append('<div class="item '+active+'">'+
						'<img src="'+CONTEXT_PATH+'/resource/picture/'+s.fileName[key]+
						'" file-name="'+
						s.fileName[key]+
						'">'+
						'</div>');
				console.log('s.fileName:'+s.fileName[key]);
				 if(active=='active'){//圖片第一次載入完畢後，按一下下一張輪播
					 $("a[data-slide='next']").click();
				 }
			});
		},
		 error: function(){
             //your code here
			 console.log('error link');
          },
		complete: function () {
            // Schedule the next request when the current one has been completed
            setTimeout(ajaxInterval, 10000);//每幾秒跑一次呼叫SERVER 端(毫秒)
            console.log('complete:'+JSON.stringify(fileDisplay)); 
		    fileDisplay.length=0;//清空fileDisplay陣列
		    //告知SERVER CLIENT 有那些圖片
		    $('.item').each(function(key){ 
				 console.log('item push array:'+$(this).find('img').attr('file-name'));
				 fileDisplay.push($(this).find('img').attr('file-name')); 
		     });
		 
		
        }
	}); 
}
//判斷是否加 active
function firstLoad(key){
	var a='';
	if($('.item').length==0){//判斷是否第一次載入無圖片時 
		if(key==0){//需新增第一張圖片為投影
			a='active';
			$('#myCarousel').attr('data-ride','carousel');//原本將輪播關閉，有圖片來時現在打開
			
		} 
	}
	return a;
}
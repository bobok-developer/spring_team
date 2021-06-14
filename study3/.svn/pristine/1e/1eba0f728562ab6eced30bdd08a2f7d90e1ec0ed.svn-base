/**
 * reply module
 */

console.log("reply module...");

var replyService = (function() {
   return {
      
	   //댓글 등록
	   add : function(reply, callback, error){
         console.log("reply.add().....");
         
        $.ajax({
            type : "post",
            url : reply.cp+"/replies/new",
            data : JSON.stringify(reply),
            contentType : "application/json; charset=utf-8",
            success : function(result, status, xhr){
               if(callback){
                  callback(result);
               }
            },
            error : function(xhr, status, er){
               if(error){
                  error(er);
               }
            }
         });
        },        
              
      //댓글 목록
      getList: function(param, callback, error) {
         var bno = param.bno;
         var rnoStr = param.rno ? "/" + param.rno : "";
         var url = param.cp+"/replies/more/" + bno + rnoStr;
         
         
         
         $.getJSON(url, function(result){
            if(callback){
               callback(result);
            }
         }).fail(function(xhr, status, er){
               if(error){
                  error(er);
               }
            });
      },
      
      //댓글 삭제
      remove: function(reply, callback, error) {
    	  console.log(reply);
         var url = reply.cp + "/replies/" + reply.rno + "/" + reply.replyer
			
         $.ajax({
            type : "delete",
            url : url,
            success : function(result){
               if(callback){
                  callback(result);
               }
            },
            error : function(xhr, status, er){
               if(error){
                  error(er);
               }
            }
         })
      },
      
      //댓글 수정
      update: function(reply, callback, error) {
         var url = reply.cp +"/replies/" + reply.rno
         
         $.ajax({
            type : "put",
            url : url,
            data : JSON.stringify(reply),
            contentType : "application/json; charset=utf-8",
            success : function(result, status, xhr){
               if(callback){
                  callback(result);
               }
            },
            error : function(xhr, status, er){
               if(error){
                  error(er);
               }
            }
         });
      },
      
      
      //댓글 상세
      get: function(reply, callback, error) {
          var rno = reply.rno;
    	  var url = reply.cp+"/replies/" + rno
         $.getJSON(url, function(result){
            if(callback){
               callback(result);
            }
         }).fail(function(xhr, status, er){
               if(error){
                  error(er);
               }
            });
      },
      displayTime: function(timeValue){
         var today = moment(new Date());
         var dateObj = moment(timeValue);
         
         return moment(timeValue).fromNow();
      },
      getReplyDOM :function(param){
    	  console.log(param)
         var str = "";
	         str += '<li class="list-group-item" data-rno="' + param.rno + '">';
	         str += '    <div class="rheader">';
	         str += '       <strong>' + param.replyer + '</strong>';
	         str += '       <small class = "float-right">'+ this.displayTime(param.regDate) +'</small>';
	         str += '   </div>';
	         str += '    <p class="mt-2">' + param.reply + '</p>';
	         str += '</li>';
         return str;
      }
   }; 
})();  
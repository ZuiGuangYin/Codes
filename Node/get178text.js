
var http = require('http');  
var fs   = require('fs');  
var $ = require('jquery');  
var iconv = require('iconv-lite');  
var wOpition = {  
    flags:'w',  
    encoding:'utf-8',  
    mode:0666  
}  
var weburl = 'http://xs.dmzj.com';  
  
var starturl = '/1224/4376/27626.shtml';  
  
var fileWriteStream = fs.createWriteStream('novel2.txt',wOpition);  
  
var savenovel = function(html){  
    var $doc = $(html);  
    var novel = $doc.find('div.novel_text').text();  
    //还需加上换行  
    fileWriteStream.write(novel);  
}  
  
var gethtml = function(url,callback){  
    http.get(url,function(res){  
        res.setEncoding('binary');  
        var html = '';  
        console.log('Get Response: ' + res.statusCode);  
        res.on('data',function(data){  
            html += data;  
        }).on('end',function(){  
            var buf = new Buffer(html,'binary');  
            var str = iconv.decode(buf,'utf-8');  
            console.log('Download: ' + url);  
            callback(str.toString());  
        });  
    }).on('error',function(e){  
        console.log('Get Error: ' + e.message)  
    });  
};  
  
  
var get178text = function(url){  
    gethtml(url,function(data){  
        var $doc = $(data);  
        savenovel(data);  
        var pagenums = $doc.find('div.pages').find('span option').each(function(i,p){  
            var $t = $(p);  
            if (i != 0 && $t.length > 0) {  
                gethtml(weburl + $t.attr('value'),function(data){  
                    savenovel(data);  
                });  
            };  
        });  
        var pages = $doc.find('div.pages_novel').find('a#next_chapter').attr('href');  
        var cururl = weburl + pages;  
        if(cururl.toString() == url.toString()){  
            //console.log('Download Complete');  
            return;  
        }  
        get178text(cururl);  
    });  
}  
  
get178text(weburl + starturl);
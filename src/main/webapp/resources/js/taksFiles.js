/**
 * 
 */
//파일 리스트 번호
var fileIndex = 0;
// 등록할 전체 파일 사이즈
var totalFileSize = 0;
// 파일 리스트
var fileList = new Array();
// 파일 사이즈 리스트
var fileSizeList = new Array();
// 등록 가능한 파일 사이즈 MB
var uploadSize = 50;
// 등록 가능한 총 파일 사이즈 MB
var maxUploadSize = 500;
var reader =new FileReader();


$(function (){
    // 파일 드롭 다운
    fileDropDown();
});

// 파일 드롭 다운
function fileDropDown(){
    var dropZone = $("#dropZone");
    //Drag기능 
    dropZone.on('dragenter',function(e){
        e.stopPropagation();
        e.preventDefault();
        dropZone.css('background-color','#E3F2FC');
    });
    dropZone.on('dragleave',function(e){
        e.stopPropagation();
        e.preventDefault();
        dropZone.css('background-color','#FFFFFF');
    });
    dropZone.on('dragover',function(e){
        e.stopPropagation();
        e.preventDefault();
        dropZone.css('background-color','#E3F2FC');
    });
    dropZone.on('drop',function(e){
        e.preventDefault();
        dropZone.css('background-color','#FFFFFF');
        
        var files = e.originalEvent.dataTransfer.files;
        
        //파일인지 폴더인지 판별할때
        var isEntry= e.originalEvent.dataTransfer.items[0].webkitGetAsEntry();
        if(files != null){
            if(files.length > 3){
            	alert("3개이상 제한입니다.");
                return;    	
            }
            
            if(isEntry.isDirectory){
            	alert("폴더는 업로드하실 수 없습니다.");
                return; 
            }
            selectFile(files);
        }else{
            alert("ERROR");
        }
    });
}

// 파일 업로드시 데이터 저장
$(function() {
      $('.uploadInputFile').on('change',function(e){
      var files = $('.uploadInputFile')[0].files;
      selectFile(files);
    });
});
function dataSave(){
	var files = $('.uploadInputFile')[0].files;
	selectFile(files);
}

// 파일 선택시
function selectFile(files){
   if(files != null){
	   
	   //담겨있는 리스트 목록
      for(var i=0;i<files.length;i++){
         var fileName=files[i].name;
         var fileSize=files[i].size/1024/1024; //MB로 관리
         var number=files[i].size;
         var resultSize=returnFileSize(number);
         var fileNameArr = fileName.split("\.");
         var ext = fileNameArr[fileNameArr.length - 1];
         if($.inArray(ext, ['exe', 'bat', 'sh', 'java', 'jsp', 'html', 'js', 'css', 'xml']) >= 0){
        	 alert('등록 불가한 확장자 입니다');
        	 break;
         }else if(fileSize > uploadSize){
        	 alert("용량 초과\n업로드 가능 용량 : " + uploadSize + " MB 입니다.");
        	 break;
         }else{
        	 totalFileSize += fileSize;
             fileList[fileIndex]=files[i];
             // 이미지파일의 관리
             if(files[i].type.match('image.*')){
            	 var file=files[i];
            	 addFileListImg(fileIndex,file);
            	 
             }else{
            	 addFileList(fileIndex,fileName,resultSize); 
             }
             fileIndex++;
         }
      }
   }else{
   	 alert('고객샌터 문의 바람');
   }
}

// 파일 사이즈 구해오기
function returnFileSize(number) {
     if(number < 1024) {
       return number + 'bytes';
     } else if(number >= 1024 && number < 1048576) {
       return (number/1024).toFixed(1) + 'KB';
     } else if(number >= 1048576) {
       return (number/1048576).toFixed(1) + 'MB';
     }
 }
 
 //단순 보여줄 리스트 추가
 function addFileList(fileIndex,fileName,fileSize){
    var html = '<div class="fileInfo'+fileIndex+'">'+
       fileName+' 크기("'+fileSize+'")"<input type="button" value="X" onclick="deleteFile('+fileIndex+')"></div>';
     $('#uploadImgForm').append(html);
 }
 //단순 보여줄 이미지 리시트 추가
 function addFileListImg(fileIndex,file){
	 reader.onload = function(e){
  		  var html = '<div class="fileInfo'+fileIndex+'">'+'<img src="'+e.target.result+'" width="200" height="200" /><input type="button" value="X" onclick="deleteFile('+fileIndex+')"></div>';
  		     $('#uploadFileForm').append(html);
  		 }
  	 	 reader.readAsDataURL(file);
 }
 // 해당파일 삭제
 function deleteFile(fileIndex){
	totalFileSize -= fileSizeList[fileIndex];
    delete fileList[fileIndex];
    delete fileSizeList[fileIndex];
    $('.fileInfo'+fileIndex).remove();
    $('.upload-hidden').val("");
 }
 
 // 해당 파일 업로드
 function uploadFile(){
	 //등록 파일 리스트
    var uploadFileList = Object.keys(fileList);
	var form =$('#uploadForm');
///////////////////////////////////////////////////////////////////////////////////////////////////////////////	 
	//파일 없으면 올릴수 없는데 타임라인 4개니까 확인바람
	 if(uploadFileList.length==0){
		 form.submit();
		
	 }else{
///////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//용량이 500mb넘으면 업로드 불가
	if(totalFileSize>maxUploadSize){
		alert("총 용량 초과\n총 업로드 가능 용량 : " + maxUploadSize + " MB 입니다.");
	}
    var form =$('#uploadForm');
    var formData = new FormData(form[0]);
    for(var i=0;i<uploadFileList.length;i++){
       formData.append('files',fileList[uploadFileList[i]]);
    }
	form.submit();
   	 $.ajax({
   		url:"upload.do",
    	data:formData,
    	type:'POST',
        enctype:'multipart/form-data',
    	//뭔지모르겟지만 파일 보낼때 두개 false는 꼭해줘야함
    	contentType: false,
    	processData: false,
    	cache: false,
    	dataType: "text",
    		success : function() {
					debugger;
    			  alert("success");
    			  location.reload();
    	    },
    	    error : function(xhr, status, error) {     
    	          alert("HTTP REQUEST ERROR");    
    	          alert(xhr+'    '+status+'    '+error)
    	    }
    });
}
 }
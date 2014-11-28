$(document).ready(function(){
    $('#versionita').hide();

    $('#addita').on('click', function(){
    	$('#versionita').show();
    	$('#summernote-ita').summernote({
    		height: "300px"
    	});
    	$(this).hide();
    });

    $('#rmita').on('click', function(){
    	conf = confirm("Are you sure?");
    	if(conf===true) {
    		$('#summernote-ita').destroy().val("");
    		$('#versionita').hide();
    		$('#addita').show();
    	};
    });
});
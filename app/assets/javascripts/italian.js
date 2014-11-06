$(document).ready(function(){
	var flag = $('.myFlag');
	// var blogpost = $('.blogpost');
	var blogpostItalian = $('.blogpostItalian');
	var englishFlag = $('.englishVersion');

	englishFlag.hide()
	blogpostItalian.hide();

	flag.on('click', function(){
		var blogpost = $(this).closest('.post_section').find('.blogpost')
		var italian = $(this).closest('.post_section').find('.blogpostItalian')
		var iFlag = $(this).closest('.post_section').find('.italianVersion')
		var eFlag = $(this).closest('.post_section').find('.englishVersion')

		if(blogpost.css('display')!='none'){
			italian.show();
			blogpost.hide();
			iFlag.hide();
			eFlag.show()
		}else if(italian.css('display')!='none'){
			blogpost.show();
			italian.hide();
			eFlag.hide();
			iFlag.show();
		}
	})

})
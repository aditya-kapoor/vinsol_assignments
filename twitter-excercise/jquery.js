$('document').ready(function(){
	var global_json;
	var since_id = 235986734821;
	var timing_variable;

	getTweets()
	setTimer()
	//var timing_variable = self.setInterval(function(){getTweets()},10000);
	// function createSelectedInterface(img_src,twitter_handle,username,tweet,time,source){
		
	// 	$tweet_div = $('<div></div>')
	// 	$tweet_div.addClass('tweet-div')

	// 	$upper_div = $('<div></div>')
	// 	$upper_div.addClass("upper-div")
	// 	$profile_img = $('<img />')
	// 	$profile_img.addClass("profile-image")
	// 	$profile_img.attr("src",img_src)
		
	// 	$name_para = $('<p></p>')
	// 	$name_para.addClass("name-para")
	// 	$name_para.append(twitter_handle)
	// 	$name_para.append("("+username+")")
	// 	$upper_div.append($profile_img).append($name_para)
		
	// 	$mid_div = $('<div></div>')
	// 	$mid_div.addClass("mid-div")
	// 	$tweet_field = $('<div></div>')
	// 	$tweet_para = $('<p></p>')
	// 	$tweet_para.append(tweet)
	// 	$tweet_field.append($tweet_para)
	// 	$mid_div.append($tweet_field)
		
	// 	$lower_div = $('<div></div>')
	// 	$lower_div.addClass("lower-div")
	// 	$time_para = $('<p></p>')
	// 	$time_para.addClass("time-para")
	// 	$time_para.append("Time : " + time + "<br />")
	// 	$time_para.append("Sent Via : " + source)
	// 	$lower_div.append($time_para)

	// 	$tweet_div.append($upper_div).append($mid_div).append($lower_div)
	// 	$('div#selected-tweets').append($tweet_div)
	// 	$('div#selected-tweets').show()
	// 	$('div#tweet-container').hide()
	// }

	function setTimer(){
		timing_variable = setInterval(function(){ getTweets()},10000)
	}

	function cleanInterface(){
		$('#selected-tweets').html(" ");
		$('#tweet-container').html(" ");
		$('#select-name').find('option:gt(0)').remove();
	}

	function getTweets(){
		cleanInterface()
		$.ajax({
			url:"http://search.twitter.com/search.json?q=ruby%20OR%20ROR%20&rpp=100&lang=en&since_id="+since_id,
			dataType : "jsonp",
			success: function(data){
				global_json = data
				since_id = data.results[0].id
				console.log("Since ID",since_id)
				for(i=0;i<100;++i){
					var img_src = data.results[i].profile_image_url
					var twitter_handle = data.results[i].from_user
					var username = data.results[i].from_user_name
					var tweet = data.results[i].text
					var time = data.results[i].created_at
					var source = data.results[i].source
					createInterface(img_src,twitter_handle,username,tweet,time,source,"#tweet-container")
					addNames(twitter_handle)
					highlightKeywords()
				}
			}
		});
	}

	function highlightKeywords(){
		keywords = ["ruby","ROR"]
	}

	function addNames(twitter_handle){
			exists = false
			$('#select-name').children().each(function(index,element){
				if($(element).val() == twitter_handle) 
					exists = true
			})
			if(!exists){
			$option = $('<option></option>')
			$option.append(twitter_handle)
			$option.val(twitter_handle)
			$('#select-name').append($option)
		}
	}

	function createInterface(img_src,twitter_handle,username,tweet,time,source,div){

		$tweet_div = $('<div></div>')
		$tweet_div.addClass('tweet-div')

		$upper_div = $('<div></div>')
		$upper_div.addClass("upper-div")
		$profile_img = $('<img />')
		$profile_img.addClass("profile-image")
		$profile_img.attr("src",img_src)
		
		$name_para = $('<p></p>')
		$name_para.addClass("name-para")
		$name_para.append(twitter_handle)
		$name_para.append("("+username+")")
		$upper_div.append($profile_img).append($name_para)
		
		$mid_div = $('<div></div>')
		$mid_div.addClass("mid-div")
		$tweet_field = $('<div></div>')
		$tweet_para = $('<p></p>')
		$tweet_para.append(tweet)
		$tweet_field.append($tweet_para)
		$mid_div.append($tweet_field)
		
		$lower_div = $('<div></div>')
		$lower_div.addClass("lower-div")
		$time_para = $('<p></p>')
		$time_para.addClass("time-para")
		$time_para.append("Time : " + time + "<br />")
		$time_para.append("Sent Via : " + source)
		$lower_div.append($time_para)

		$tweet_div.append($upper_div).append($mid_div).append($lower_div)
		$(div).append($tweet_div)
		$(div).show()
		if(div == "#tweet-container"){
			$(div).prev().hide()
		}else{
			$(div).next().hide()
		}
	}

	$('#select-name').bind("change",function(){
		$('div#selected-tweets').html(" ")
		if($(this).val() == "none"){
			$('div#selected-tweets').hide()
			$('div#tweet-container').show()
		}else{
		for(i=0;i<=100;++i){
			if(global_json.results[i].from_user == $(this).val()){
				var img_src = global_json.results[i].profile_image_url
				var twitter_handle = global_json.results[i].from_user
				var username = global_json.results[i].from_user_name
				var tweet = global_json.results[i].text
				var time = global_json.results[i].created_at
				var source = global_json.results[i].source
				//createSelectedInterface(img_src,twitter_handle,username,tweet,time,source)
				createInterface(img_src,twitter_handle,username,tweet,time,source,"#selected-tweets")
			}
		}
	}
	})
})
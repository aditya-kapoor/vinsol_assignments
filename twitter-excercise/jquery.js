$('document').ready(function(){
	var global_json = [];
	var i = 0;
	var since_id = 235986734821;
	var timing_variable;

	getTweets()
	setTimer()
	function setTimer(){
		timing_variable = setInterval(function(){ getTweets()},15000)
	}
	function cleanInterface(){
		//$('#selected-tweets').html(" ");
		//$('#tweet-container').html(" ");
		//$('#select-name').find('option:gt(0)').remove();
	}
	function getTweets(){
		//cleanInterface()
		$.ajax({
			url:"http://search.twitter.com/search.json?q=ruby%20OR%20ROR%20&rpp=100&lang=en&since_id="+since_id,
			dataType : "jsonp",
			success: function(data){
				if(global_json.length == 0){ global_json = data.results}
				else {	global_json.concat(data.results) }
				since_id = data.results[0].id
				console.log("Since ID",since_id)
				for(i=0;i<data.results.length;++i){
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
		$('#tweet-container').find('.mid-div').each(function(index,element){ 
			var text = $(element).find('p').text()
			var search_string = /(Ruby|ROR)/ig;
			$(element).find('p').html(
			text.replace(search_string,"<span class='highlight'>$1</span>")
			)
		})
	}

	function addNames(twitter_handle){
		exists = false
		$('#select-name').children().each(function(index,element){
			if($(element).val() == twitter_handle) 
				exists = true
			})
		if(!exists){
			$option = $('<option/>')
			$option.append(twitter_handle)
			$option.val(twitter_handle)
			$option.insertAfter('#select-name option:eq(0)')
		}
	}

	function createInterface(img_src,twitter_handle,username,tweet,time,source,div){

		$tweet_div = $('<div/>')
		$tweet_div.addClass('tweet-div')
		$tweet_div.attr("name",twitter_handle)

		$upper_div = $('<div/>')
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
		$tweet_para = $('<p></p>')
		$tweet_para.append(tweet)
		$mid_div.append($tweet_para)
		
		$lower_div = $('<div></div>')
		$lower_div.addClass("lower-div")
		$time_para = $('<p></p>')
		$time_para.addClass("time-para")
		$time_para.append("Time : " + time + "<br />")
		source = source.replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&quot;/g,'"')
		$time_para.append("Sent Via : " + source)
		$lower_div.append($time_para)

		$tweet_div.append($upper_div).append($mid_div).append($lower_div)
		$(div).prepend($tweet_div)
		//$(div).show()
	}

	$('#select-name').bind("change",function(){
		$('div#selected-tweets').html(" ")
		if($(this).val() == "none"){
			$('div#tweet-container .tweet-div').show()
		}else{
			if($('div#tweet-container .tweet-div[name='+$(this).val()+']').is(':hidden')){
				$('div#tweet-container .tweet-div[name!='+$(this).val()+']').hide()
				$('div#tweet-container .tweet-div[name='+$(this).val()+']').show()
			}else{
				$('div#tweet-container .tweet-div[name!='+$(this).val()+']').hide()
			}
		}
	})
})

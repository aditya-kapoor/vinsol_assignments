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
	function getTweets(){
		$.ajax({
			url:"http://search.twitter.com/search.json?q=ruby%20OR%20ROR%20&rpp=100&lang=en&since_id="+since_id,
			dataType : "jsonp",
			success: function(data){
				global_json.concat(data.results)
				since_id = data.results[0].id
				console.log("Since ID",since_id)
				for(i=0;i<data.results.length;++i){
					createInterface(data.results[i],"#tweet-container")
					var twitter_handle = data.results[i].from_user
					addNames(twitter_handle)
					highlightKeywords()
				}
			}
		});
	}

	function highlightKeywords(){
		$('#tweet-container .mid-div').each(function(index,element){ 
			var text = $(element).find('p').text()
			var search_string = /(Ruby|ROR)/ig;
			$(element).find('p').html(
			text.replace(search_string,"<span class='highlight'>$1</span>")
			)
		})
	}

	function addNames(twitter_handle){
		$option = $('<option/>')
		$option.append(twitter_handle)
		$option.val(twitter_handle)
		if($('#select-name:not(:contains(twitter_handle))'))
			$option.insertAfter('#select-name option:eq(0)')
	}

	function createInterface(results,div){

		var img_src = results.profile_image_url
		var twitter_handle = results.from_user
		var username = results.from_user_name
		var tweet = results.text
		var time = results.created_at
		var source = results.source

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
		var tweet_div = 'div#tweet-container .tweet-div'
		if($(this).val() == "none"){
			$(tweet_div).show()
		}else{
			if($('div#tweet-container .tweet-div[name='+$(this).val()+']').is(':hidden')){
				console.log()
				$(tweet_div +'[name!='+$(this).val()+']').hide()
				$(tweet_div +'[name='+$(this).val()+']').show()
			}else{
				$(tweet_div +'[name!='+$(this).val()+']').hide()
			}
		}
	})
})

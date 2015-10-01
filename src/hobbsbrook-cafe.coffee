cheerio = require('cheerio');
FormData = require('form-data');
module.exports = (robot) ->
   robot.respond /cafe menu/i, (resp) ->
      robot.http("http://www.hobbsbrook.com/amenities/dining/")
	      .get() (err, res, body) ->
	      # pretend there's error checking code here
	        if res.statusCode isnt 200
	          resp.send "Request came back" + res.statusCode
	          return
	        $ = cheerio.load(body);
	        url = $(':header:contains('+process.env.HobbsBrookAddress +')').parent().parent().find('.img-menu > img').attr('src')
	        resp.send url

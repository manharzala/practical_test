# README

Steps to run the API app:

rails db:migrate
rails s


1)API to create a user:

	URL:  localhost:3000/users
	Method: POST
	Headers: 
		Content-Type :  application/json
	Body: raw 
		{
			"user" : {
			"email" : "test1@gmail.com",
			"password" : "123456",
			"password_confirmation" : "123456"
			}
		}

2)API for login

	URL: localhost:3000/oauth/token	
	Method: POST
	Headers: 
		Content-Type :  application/json
	Body: raw 
		{
			"email" : "test1@gmail.com",
			"password" : "123456",
			"grant_type" : "password"		
		}

3)API for logout

	URL: localhost:3000/oauth/revoke	
	Method: POST
	Headers: 
		Content-Type :  application/json
	Body: raw 
		{
			"token" : "-c4oNMnkIcyPbmppfCXFc0TxW-L2GdzBm5VfhYSWk1g"
		}

4)API to follow a user		

	URL: localhost:3000/relationships	
	Method: POST
	Headers: 
		Content-Type :  application/json
		Authorization : Bearer -c4oNMnkIcyPbmppfCXFc0TxW-L2GdzBm5VfhYSWk1g

	Body: x-www-form-urlencoded 
		key: followed_id
		value: id

5)API to unfollow a user		

	URL: localhost:3000/relationships/id	
	Method: DELETE
	Headers: 
		Content-Type :  application/json
		Authorization : Bearer -c4oNMnkIcyPbmppfCXFc0TxW-L2GdzBm5VfhYSWk1g

	
6)API to create a tweet		

	URL: localhost:3000/tweets	
	Method: POST
	Headers: 
		Content-Type :  application/json
		Authorization : Bearer -c4oNMnkIcyPbmppfCXFc0TxW-L2GdzBm5VfhYSWk1g
	Body: x-www-form-urlencoded 
		key: tweet[tweet_content]
		value: tweet content


7)API to get list of tweets		

	URL: localhost:3000/tweets?user_id=id	
	Method: GET
	Headers: 
		Content-Type :  application/json
		Authorization : Bearer -c4oNMnkIcyPbmppfCXFc0TxW-L2GdzBm5VfhYSWk1g
	

7)API to get profile		

	URL: localhost:3000/profile	
	Method: GET
	Headers: 
		Content-Type :  application/json
		Authorization : Bearer -c4oNMnkIcyPbmppfCXFc0TxW-L2GdzBm5VfhYSWk1g
	
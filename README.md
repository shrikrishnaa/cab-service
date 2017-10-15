# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
    ruby 2.3.1p112 (2016-04-26 revision 54768) [x86_64-linux]
    rails: 5.1.4'

* System dependencies
      mysql Server version: 5.7.19-
* Configuration

* Database creation
      rails db:create

* Database initialization
      rails db:migrate

* How to run the test suite
    bundle exec rspec spec

* APIS LIST:
  - To get list of cabs
    metod: get, url: localhost:3000/cabs
    output:
              [
                {
                    "id": 1,
                    "name": "cab1",
                    "model": "innovaa",
                    "number": "ka01,jv 1234",
                    "color": "pink",
                    "latitude": 12.9166,
                    "longitude": 77.6101,
                    "available_status": "available",
                    "created_at": "2017-10-15T11:27:53.000Z",
                    "updated_at": "2017-10-15T11:39:11.000Z"
                }
                ]
  - To add new cab
    method: post, url: localhost:3000/cabs
    json format input to submit: {
                            	"cab":{
                                  "name":"cab1",
                                  "model":"innova",
                                  "number":"ka01,jv 1234",
                                  "latitude":"12.9166",
                                  "longitude":"77.6101",
                                  "color":"pink",
                                  "available_status":"available"

                            	}
                            }

  - To update a cab details
    method: put, url: localhost:3000/cabs/:id
    json format input to submit: {
                            	"cab":{
                                  "name":"cab1",
                                  "model":"innovaa",
                                  "number":"ka01,jv 1234",
                                  "latitude":"12.9166",
                                  "longitude":"77.6101",
                                  "color":"pink",
                                  "available_status":"available"

                            	}
                            }
  - To update cab status and location
    method: put, url: localhost:3000/cabs/:id
    json format input to submit: {
                              "cab":{
                                  "latitude":"12.9166",
                                  "longitude":"77.6101",
                                  "available_status":"available"

                              }
                            }
 - To delete Cab
  method : delete, url: localhost:3000/cabs/4

  - To get list of customers
    metod: get, url: http://localhost:3000/customers
 - To create a customer
    method : post, url: http://localhost:3000/customers
      json format input to submit:
          {
          	"customer":{
          		"name":"krish",
          		"latitude":"12.9082",
          		"longitude":"77.6074",
          		"email":"krish@gmail.com"
          	}
          }
  - To update a customer details
    method: put, url: http://localhost:3000/customers/:id
    json format input to submit: {
                              "customer":{
                                "name":"krish",
                            		"latitude":"12.9082",
                            		"longitude":"77.6074",
                            		"email":"krish@gmail.com"
                              }
                            }
  - To update customer location
    method: put, url: http://localhost:3000/customers/:id
    json format input to submit: {
                              "customer":{
                                  "latitude":"12.9166",
                                  "longitude":"77.6101"
                              }
                            }
  - To delete customer
   method : delete, url: http://localhost:3000/customers/:id

 - Customer Requesting cab
    method: get, url: localhost:3000/cab_bookings/cab_request?latitude=12.9082&longitude=77.6074

 - Customer requesting cab with color
    method: get, url: localhost:3000/cab_bookings/cab_request?latitude=12.9082&longitude=77.6074&color=pink

 - Customer Booking the cab
    method : post, url: http://localhost:3000/cab_bookings/cab_booking
    json format input to submit:
    {
        "cab_booking":{
        "cab_id":"1",
        "customer_id":"1",
        "origin_lat":"12.9082",
        "origin_long":"77.6074",
        "destination_lat":"12.9901",
        "destination_long":"77.5525"
      }
    }


 - Customer start travel
    method : put, url: http://localhost:3000/cab_bookings/start_travel
    json format input to submit:
    {
    	"cab_booking":{
    	"booking_id": 2,
    	"origin_lat":"12.9082",
    	"origin_long":"77.6074"
	   }
   }

  - Customer finish travel
    method : put, url: http://localhost:3000/cab_bookings/finish_travel
    json format input to submit:
        {
      	"cab_booking":{
        	 "booking_id": 2,
      	   "destination_lat": 12.9901,
           "destination_long": 77.5525
      	}
      }

      output:
      {
          "amount": 96.73903906651037,
          "end_time": "2017-10-15T18:34:38.000Z",
          "id": 2,
          "destination_lat": 12.9901,
          "destination_long": 77.5525,
          "cab_id": 1,
          "customer_id": 1,
          "origin_lat": 12.9082,
          "origin_long": 77.6074,
          "created_at": "2017-10-15T17:01:45.000Z",
          "updated_at": "2017-10-15T18:34:38.000Z",
          "start_time": "2017-10-15T17:57:20.000Z"
        }

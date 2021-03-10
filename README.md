# API including TDD using Rspec
build using Ruby on Rails

## Commands to run
`bundle install`
`rails db:create`
`rails db:migrate`

### Testing
`bundle exec rspec -f d spec/_<folder_you_want_to_test>_/<**filename.rb:31**>`_(31 ie line numer for specific test)_

Note: `-f d` flags can be removed after `rspec` command above, if your system is producing full documentation output formatting, which is not the case on my Linux.

![image](https://user-images.githubusercontent.com/70934030/110709052-c12e5b00-824f-11eb-80f7-2762de429d57.png)


#### How it was created
`rails new *app-nape* --api` for lighter setup 

# Tasks
## GET /hello

This API is to test that your website is up and running. We will make a GET request to the path hello under the url you have specified.

For example if your web site is at http://8f166b0d6fd7.ngrok.io/ then the request will be made to http://8f166b0d6fd7.ngrok.io/hello.

The request body will be empty.

Your API should return a 204 (NoContent) response with an empty body.

## Sum
GET /sum?numbers=<command_seperated_numbers>

This API should return the sum of the supplied integers.

The URL will contain a query (search) parameter numbers that is a comma separated list of integers to sum.

The request body will be empty.

Your API should return a 200 (OK) response and the sum should be in the body of the response.

It should not be JSON formatted.

## Reverse Words
GET /reverse-words?sentence=<a_string>

This API should reverse each of the words in the supplied string and return the result.

The URL will contain a query (search) parameter sentence containing words and special characters.

A word is defined as one or more english alphabet characters (a-z, A-Z) in a row. All other characters, should be kept in place.

For example the sentence

Hi, Octopus

Would become

iH, supotcO

The request body will be empty.

Your API should return a 200 (OK) response and the resultant string should be in the body of the response. It should not be JSON formatted or quoted.

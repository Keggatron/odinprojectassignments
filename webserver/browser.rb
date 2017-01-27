require 'socket'
require 'json'

host = 'localhost'
port = 2000


puts "What do you want to do: GET or POST?"
action = gets.chomp
action.downcase!

if action == 'post'
    path = '/thanks.html'
    puts "What is your name?"
    name = gets.chomp
    puts "What is your email address?"
    email = gets.chomp
    
    send_hash = {:viking => {:name => name, :email => email} }
    
    json_hash = send_hash.to_json
    
    request = "POST #{path} HTTP/1.0\r\nContent-Length: #{json_hash.size}\r\n\r\n#{json_hash}"
    
    
elsif action == 'get'
    path = '/index.html'
        request = "GET #{path} HTTP/1.0"
        
    else
    end
    
socket = TCPSocket.open(host, port)
socket.print(request)
response = socket.read
headers, body = response.split("\r\n\r\n", 2)
print body
socket.close

        
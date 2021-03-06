require 'socket'
 
host = 'localhost'     # The web server
port = 2000                           # Default HTTP port
path = "/index.html"                 # The file we want 

# This is the HTTP request we send to fetch a file

request = "GET #{path} HTTP/1.0\r\n\r\n"

socket = TCPSocket.open(host,port)  # Connect to server
socket.print(request)               # Send request
response = socket.read              # Read complete response

headers,body = response.split("\r\n\r\n", 2) # Split response at first blank line into headers and body
puts body                          # And display it
socket.close
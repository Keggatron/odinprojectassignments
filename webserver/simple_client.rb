require 'socket'      # Sockets are in standard library

hostname = 'localhost'
port = 2000

request = 'GET /index.html HTTP/1.0\r\n\r\n'

socket = TCPSocket.open(hostname, port)
socket.print(request)
response = socket.gets
puts response
#headers, body = response.split
#print body


socket.close               # Close the socket when done
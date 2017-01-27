require 'socket'               # Get sockets from stdlib

server = TCPServer.open(2000)  # Socket to listen on port 2000
loop {                         # Servers run forever
  client = server.accept 
  request = client.gets
  
  header = request.split
  fileName = header[1][1..-1]
  file = File.open(fileName)
  client.read(file)
  client.close                 # Disconnect from the client
}

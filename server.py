import SimpleHTTPServer
import SocketServer
import BaseHTTPServer as bhs
import socket

class Handler(bhs.BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        self.wfile.write(socket.gethostname())

handler = Handler

httpd = SocketServer.TCPServer(("", 4040), handler)
httpd.serve_forever()

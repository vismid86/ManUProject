#Importing Required Packages
import time
import BaseHTTPServer
import pymysql
import re

#Variable declarations
HOST_NAME = '0.0.0.0'
PORT_NUMBER = 80

#Class for Handling the HTTP Requests
class MyHandler(BaseHTTPServer.BaseHTTPRequestHandler):
	
	def do_HEAD(s):
		"""Set response header type"""
		s.send_response(200)
		s.send_header("Content-type", "text/html")
		s.end_headers()
	
	def do_GET(s):
		"""Respond to a GET request."""
		s.send_response(200)
		s.send_header("Content-type", "text/html")
		s.end_headers()
		#Request HTML page starts
		s.wfile.write("<html><head><title>HUMAN HEALTH RECORDER</title></head>")
		s.wfile.write("<body><p><center><font size=\"6\">WELCOME TO HUMAN HEALTH RECORDER!!!TEST</font></center></p>");
		s.wfile.write("<form action=\"/results\" method=\"post\">")
		s.wfile.write("<fieldset>")
		s.wfile.write("<legend>Age (Mandatory field)</legend>")
		s.wfile.write("<label for=\"age\">Enter your age here: </label>")
		s.wfile.write("<input type=\"number\" name=\"age\" id=\"age\">")
		s.wfile.write("</fieldset>")		
		s.wfile.write("<fieldset>")
		s.wfile.write("<legend>Gender (Mandatory field)</legend>")
		s.wfile.write("<input type=\"radio\" name=\"gender\" id=\"m\" value=\"m\">")
		s.wfile.write("<label for=\"m\">Male</label>")
		s.wfile.write("<input type=\"radio\" name=\"gender\" id=\"f\" value=\"f\">")
		s.wfile.write("<label for=\"f\">Female</label>")
		s.wfile.write("</fieldset>")
		s.wfile.write("<fieldset>")
		s.wfile.write("<legend>Your locality (Mandatory field)</legend>")
		s.wfile.write("<input type=\"radio\" name=\"locality\" id=\"rural\" value=\"rural\">")
		s.wfile.write("<label for=\"rural\">Rural</label>")
		s.wfile.write("<input type=\"radio\" name=\"locality\" id=\"urban\" value=\"urban\">")
		s.wfile.write("<label for=\"urban\">Urban</label>")
		s.wfile.write("</fieldset>")
		s.wfile.write("<fieldset>")
		s.wfile.write("<legend>Are you working? (Mandatory field)</legend>")
		s.wfile.write("<input type=\"radio\" name=\"working\" id=\"y\" value=\"y\">")
		s.wfile.write("<label for=\"y\">Yes</label>")
		s.wfile.write("<input type=\"radio\" name=\"working\" id=\"n\" value=\"n\">")
		s.wfile.write("<label for=\"n\">No</label>")
		s.wfile.write("</fieldset>")		
		s.wfile.write("<fieldset>")
		s.wfile.write("<legend>Do you smoke? (Mandatory field)</legend>")
		s.wfile.write("<input type=\"radio\" name=\"smoking\" id=\"y\" value=\"y\">")
		s.wfile.write("<label for=\"y\">Yes</label>")
		s.wfile.write("<input type=\"radio\" name=\"smoking\" id=\"n\" value=\"n\">")
		s.wfile.write("<label for=\"n\">No</label>")
		s.wfile.write("</fieldset>")
		s.wfile.write("<fieldset>")
		s.wfile.write("<legend>Do you drink alcohol? (Mandatory field)</legend>")
		s.wfile.write("<input type=\"radio\" name=\"alcohol\" id=\"y\" value=\"y\">")
		s.wfile.write("<label for=\"y\">Yes</label>")
		s.wfile.write("<input type=\"radio\" name=\"alcohol\" id=\"n\" value=\"n\">")
		s.wfile.write("<label for=\"n\">No</label>")
		s.wfile.write("</fieldset>")
		s.wfile.write("<fieldset>")
		s.wfile.write("<legend>Are you involved in physical activity regularly? (Mandatory field)</legend>")
		s.wfile.write("<input type=\"radio\" name=\"physical_activity\" id=\"y\" value=\"y\">")
		s.wfile.write("<label for=\"y\">Yes</label>")
		s.wfile.write("<input type=\"radio\" name=\"physical_activity\" id=\"n\" value=\"n\">")
		s.wfile.write("<label for=\"n\">No</label>")
		s.wfile.write("</fieldset>")		
		s.wfile.write("<fieldset>")
		s.wfile.write("<legend>Illness History (Optional field (Select maximum 3) )</legend>")
		s.wfile.write("<input type=\"checkbox\" name=\"illness\" id=\"illness\" value=\"bp\">")
		s.wfile.write("<label for=\"bp\">Blood Pressure</label><br>")
		s.wfile.write("<input type=\"checkbox\" name=\"illness\" id=\"illness\" value=\"diabetes\">")
		s.wfile.write("<label for=\"diabetes\">Diabetes</label><br>")
		s.wfile.write("<input type=\"checkbox\" name=\"illness\" id=\"illness\" value=\"headache\">")
		s.wfile.write("<label for=\"headache\">Headache</label><br>")
		s.wfile.write("<input type=\"checkbox\" name=\"illness\" id=\"illness\" value=\"weight_loss\">")
		s.wfile.write("<label for=\"weight_loss\">Weight Loss</label><br>")
		s.wfile.write("<input type=\"checkbox\" name=\"illness\" id=\"illness\" value=\"obesity\">")
		s.wfile.write("<label for=\"obesity\">Obesity</label><br>")
		s.wfile.write("<input type=\"checkbox\" name=\"illness\" id=\"illness\" value=\"arthritis\">")
		s.wfile.write("<label for=\"arthritis\">Arthritis</label><br>")
		s.wfile.write("<input type=\"checkbox\" name=\"illness\" id=\"illness\" value=\"cholestrol\">")
		s.wfile.write("<label for=\"cholestrol\">Cholestrol</label><br>")
		s.wfile.write("<input type=\"checkbox\" name=\"illness\" id=\"illness\" value=\"fever\">")
		s.wfile.write("<label for=\"fever\">Fever</label><br>")
		s.wfile.write("<input type=\"checkbox\" name=\"illness\" id=\"illness\" value=\"diarrhea\">")
		s.wfile.write("<label for=\"diarrhea\">Diarrhea</label><br>")
		s.wfile.write("<input type=\"checkbox\" name=\"illness\" id=\"illness\" value=\"stroke\">")
		s.wfile.write("<label for=\"stroke\">Stroke</label><br>")		
		s.wfile.write("</fieldset>")		
		s.wfile.write("<fieldset>")
		s.wfile.write("<legend>Action</legend>")
		s.wfile.write("<input type=\"submit\" value=\"Submit\">")
		s.wfile.write("<input type=\"reset\" value=\"Reset\">")
		s.wfile.write("</fieldset>")
		s.wfile.write("</form>")		
		s.wfile.write("</body></html>")
		#Request HTML page ends

	def do_POST(s):
		"""Parse the user input and Print Results"""
		content_len = int(s.headers.getheader('content-length', 0))
		post_body = s.rfile.read(content_len)
		args=post_body.split('&')
		input_values = {}
		ill = 1
		for arg in args:
			avp = arg.split('=')
			if(len(avp) == 2):
				if(avp[0] == 'illness' and ill <= 3):
					input_values[str(avp[0])+str(ill)] = avp[1]
					ill = ill + 1
				else:
					input_values[avp[0]] = avp[1]
		print input_values
		#Result HTML page starts
		s.send_response(200)
		s.send_header("Content-type", "text/html")
		s.end_headers()
		s.wfile.write("<html><head><title>HUMAN HEALTH RECORDER</title>")
		s.wfile.write("<style>")
		s.wfile.write("table, th, td \{")
		s.wfile.write("border: 1px solid black;")
		s.wfile.write("\}")
		s.wfile.write("</style>")
		s.wfile.write("</head>")		
		s.wfile.write("<body><p><center><font size=\"6\">HUMAN HEALTH RECORDER RESULTS</font></center><br></p>");
		s.wfile.write("<form action=\"/results\" method=\"post\">")
		s.wfile.write("<br><fieldset>")
		s.wfile.write("<legend>ENTERED DETAILS</legend>")
		s.wfile.write("<table>")
		s.wfile.write("<tr>")
		for k,v in sorted(input_values.iteritems()):
			s.wfile.write("<td>  %s</td>" % str(re.sub(r'_', " ", k)).upper())
			s.wfile.write("<td>  %s</td>" % str(re.sub(r'_', " ", v)).upper())
			s.wfile.write("</tr>")
		s.wfile.write("</table>")
		s.wfile.write("</fieldset>")		
		s.wfile.write("</form>")
		s.wfile.write("</body></html>")
		#Result HTML page ends
			
if __name__ == '__main__':
	""" Main function serving any HTTP request"""
	server_class = BaseHTTPServer.HTTPServer
	httpd = server_class((HOST_NAME, PORT_NUMBER), MyHandler)
	print time.asctime(), "Server Starts - %s:%s" % (HOST_NAME, PORT_NUMBER)
	try:
		httpd.serve_forever()
	except KeyboardInterrupt:
		pass
	httpd.server_close()
	print time.asctime(), "Server Stops - %s:%s" % (HOST_NAME, PORT_NUMBER)


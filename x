from flask import Flask, redirect, url_for, request
import json
app = Flask(__name__)

url = "http://localhost:5000/fructe"

with open('coll.json', 'r') as f:
	json_text = f.read()
apod_dict = json.loads(json_text)
#print(apod_dict[0])


@app.route('/fructe',methods = ['POST', 'GET', 'PUT', 'DELETE'])
def fructe():
	if request.method == 'GET':
    	#  info = request.args['nm']
		print("GET pe colectie (FRUCTE)")
		return apod_dict
		return "GET succes!"
    	#  return redirect(url_for('success',name = user))
	elif request.method == 'POST':
		request_data = request.get_json()
		print("POST pe ceva")
		print('Pret:' ,  request_data['Pret'])
		#print('Pret:', apod_dict[2])
		print(request_data)
		return "POST apelat!"
	elif request.method == 'PUT':
		print("PUT pe coletie (FRUCTE)")
		return "PUT succes!"
	else:
		print("DETELE pe colectie (FRUCTE)")
		return "DETELE succes!"
#user = request.args.get('nm')
   		#   return redirect(url_for('success',name = user))

@app.route('/fructe',methods = ['POST', 'Get'])
def fructe_id(id):
	if request.method == 'GET':
		#  info = request.args['nm']
		print("GET pe colectie (FRUCTE), id = ", id)
		return apod_dict[id]
	else:
		print("Post pe ceva")
		request_data = request.get_json()
		print('Pret:' , request_data[0]['pret'])
		print('Pret:' , request_data[1]['pret'])
		return "Post succes"


if __name__ == '__main__':
   app.run(debug = True)

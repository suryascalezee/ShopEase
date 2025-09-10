from flask import Flask, jsonify 
app = Flask(__ShopEase__) 
@app.route('/products') 
def products(): 
    return jsonify({"items":["Shoes", "Bags", "Watches"]}) 
if __ShopEase__ == '__main__': 
    app.run(host='0.0.0.0', port=5000) 

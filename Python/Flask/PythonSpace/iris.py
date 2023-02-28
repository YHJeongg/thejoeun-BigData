"""
Create on 2023-02-06
author : JYH
Description : Flutter와 Python의 Ai 예측값 보내기
"""

from flask import Flask, jsonify, render_template, request
import joblib
import os

app = Flask(__name__)

@app.route("/iris")
def iris():
    ws = os.path.join(os.path.dirname(os.path.abspath(__file__)), "./rf_iris.h5")

    sepalLength = float(request.args.get('sepalLength',''))
    sepalWidth = float(request.args.get('sepalWidth',''))
    petalLength = float(request.args.get('petalLength',''))
    Petalwidth = float(request.args.get('petalWidth',''))

    clf = joblib.load(ws)
    pre = clf.predict([[sepalLength,sepalWidth,petalLength,Petalwidth]])

    return jsonify({'result' : pre[0][5:]})


if __name__ == '__main__':
    app.run(host='127.0.0.1',port=5000,debug=True)
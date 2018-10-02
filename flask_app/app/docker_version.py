from flask import Flask

app = Flask(__name__)


@app.route('/dockerstatus', methods=['GET'])
def docker_ver():
    import docker, json
    dcli=docker.from_env()
    return json.dumps(dcli.version())

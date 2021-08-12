import json
import os

if __name__ == '__main__':
    drone_cred = os.environ.get("DRONE_GCC_SECRET_DEV")
    with open("./DRONE_GCC_SECRET_DEV.json","w",encoding='utf-8') as f:
        f.write(json.dumps(json.loads(drone_cred)))
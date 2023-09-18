import logging
import time
import os

logging.basicConfig(format='[%(asctime)s] %(levelname)s:%(message)s',
                    datefmt ='%m/%d %I:%M:%S %p',
                    level=logging.DEBUG)

logging.info(f"{os.getpid()}에서 컨테이너가 시작됨")

while True:
    logging.info(f"{os.getpid()} 컨테이너에서 로그 남기기")
    time.sleep(2)

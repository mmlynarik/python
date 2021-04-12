FROM tensorflow/tensorflow:latest-gpu

COPY requirements.txt /app/
WORKDIR /app
RUN pip install -r requirements.txt
EXPOSE 8888

CMD ["bash", "-c", "jupyter lab --port=8888 --ip='0.0.0.0' --allow-root --no-browser --ServerApp.token='' --ServerApp.password=''"]
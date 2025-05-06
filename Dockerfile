FROM python:3.8.14-slim-buster

WORKDIR /code

# Install opencv
ENV TZ="Asia/Ho_Chi_Minh"
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/* 

# set env variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /code/requirements.txt

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Sao chép mã nguồn vào container
COPY . /code

# Cấu hình FastAPI chạy với Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

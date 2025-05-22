@echo off
echo Loading Docker image...
docker load < php_ocr-app.tar

echo Running Docker container...
docker run -p 8000:8000 php_ocr-app

pause

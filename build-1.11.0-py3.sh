python3 setup.py sdist
cp dist/sagemaker_tensorflow_container-1.0.0.tar.gz docker/1.11.0/final/py3
cd docker/1.11.0/final/py3
wget https://files.pythonhosted.org/packages/3d/f1/6acf8dddd9831282cb4044a3a789c6234d6174b4b1165f31baaf788ade29/tensorflow-1.11.0-cp35-cp35m-manylinux1_x86_64.whl
wget https://files.pythonhosted.org/packages/84/d8/00a450ad627c7c5e28ada8a179e6a43854089ea5b30485f896efa5ed5814/tensorflow_gpu-1.11.0-cp35-cp35m-manylinux1_x86_64.whl
docker build -t pms-tensorflow:1.11.0-cpu-py3 --build-arg framework_installable=tensorflow-1.11.0-cp35-cp35m-manylinux1_x86_64.whl -f Dockerfile.cpu .
docker build -t pms-tensorflow:1.11.0-gpu-py3 --build-arg framework_installable=tensorflow_gpu-1.11.0-cp35-cp35m-manylinux1_x86_64.whl -f Dockerfile.gpu .

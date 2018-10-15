git config --global user.email "YourEmailAddress"
git config --global user.name "YourName"
python -m pip install --upgrade pip -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host=mirrors.aliyun.com
pip install sphinx recommonmark sphinx-autobuild sphinx_rtd_theme -r requirements.txt -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host=mirrors.aliyun.com
pip install sphinx recommonmark sphinx-autobuild sphinx_rtd_theme -r requirements.txt -i http://mirrors.aliyun.com/pypi/simple/
sphinx-quickstart
git config --global user.email "YourEmailAddress"
git config --global user.name "YourName"
<<<<<<< HEAD
python -m pip install --upgrade pip -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host=mirrors.aliyun.com
pip install sphinx recommonmark sphinx-autobuild sphinx_rtd_theme -r requirements.txt -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host=mirrors.aliyun.com
=======
runas /user:administrator cmd
pip install sphinx recommonmark sphinx-autobuild sphinx_rtd_theme -r requirements.txt -i http://mirrors.aliyun.com/pypi/simple/
>>>>>>> a042fcef1c48c0d377522e1ad2ceec995dde3790
sphinx-quickstart
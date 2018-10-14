---
title: PaddlePaddle
date: 2018-8-21 15:13:58
tags: 学科竞赛
---

* 从pip [官网下载](https://pypi.python.org/pypi/pip) pip的源代码

#### FTP上传

如果无法通过ftp上传，可以查看ftpd的开启情况  getsebool -a | grep ftp 使用命令：setsebool ftpd_full_access=1 将 ftpd_full_access 开启为 on ，就可以上传了，如果没有这个选项，可以修改其他的选项进行尝试。

	#解压
	tar -zxvf pip-1.5.5.tar.gz 
	cd pip-1.5.5
	#安装
	python setup.py install
	这个时候会报错说少了setuptools

从[setuptools官网](https://pypi.python.org/pypi/setuptools)下载setuptools
	#解压
	tar -zxvf setuptools-3.6.tar.gz 
	cd setuptools-3.6
	
	#安装
	python setup.py install
	
	再次安装pip就OK了。
	
	安装PaddlePaddle
	pip install paddlepaddle

#### 测试

[下载房价模型](https://raw.githubusercontent.com/PaddlePaddle/book/develop/01.fit_a_line/fit_a_line.tar)

```python
## 创建一个 housing.py 并粘贴此Python代码 (请确保fit_a_line.tar 是在正确的路径上)

	import paddle.v2 as paddle

	# Initialize PaddlePaddle.
	paddle.init(use_gpu=False, trainer_count=1)

	# Configure the neural network.
	x = paddle.layer.data(name='x', type=paddle.data_type.dense_vector(13))
	y_predict = paddle.layer.fc(input=x, size=1, act=paddle.activation.Linear())

	with open('fit_a_line.tar', 'r') as f:
		parameters = paddle.parameters.Parameters.from_tar(f)

	# Infer using provided test data.
	probs = paddle.infer(
		 output_layer=y_predict, parameters=parameters,
		 input=[item for item in paddle.dataset.uci_housing.test()()])

	for i in xrange(len(probs)):
		 print 'Predicted price: ${:,.2f}'.format(probs[i][0] * 1000)
```

*执行python housing.py 瞧！ 它应该打印出预测住房数据的清单。*

##### 补充
* [Docker的作用](http://blog.csdn.net/u013814964/article/details/51274160)
* 运行Docker需要商业版的Windows，也可以在linux上运行。

# GMT5参考手册

这是介绍GMT5的语法及用法的中文手册。


本项目源码用[reStructuredText](http://docutils.sourceforge.net/rst.html)写成，
利用[Sphinx](http://sphinx-doc.org/)制作成网页，源码托管在
[GitHub](https://github.com/seisman/GMT5_Docs)上，网页渲染及托管由
[Read the Docs](http://readthedocs.org/projects/gmt5-docs/)提供。

- 项目源码：https://github.com/seisman/GMT5_Docs
- 项目主页：http://gmt5.seisman.info/
- 我的博客：http://seisman.info

该项目基于Python3提供的文件构建工具Sphinx，按照如下方式可以在本地编译：

~~~bash
$ pip install sphinx sphinx_rtd_theme
$ git clone https://github.com/seisman/GMT5_Docs.git
$ make html
$ firefox build/html/index.html&
~~~
